package cn.littleterry.modules.sys.controller;


import cn.hutool.core.util.StrUtil;
import cn.littleterry.exception.BadRequestException;
import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.entity.vo.MenuMetaVo;
import cn.littleterry.modules.sys.entity.vo.MenuVo;
import cn.littleterry.modules.sys.service.SysMenuService;
import cn.littleterry.modules.sys.service.SysRoleMenuService;
import cn.littleterry.modules.sys.util.BeanCopyUtils;
import cn.littleterry.util.GlobalAuthUtils;
import cn.littleterry.util.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


/**
 * 菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 构建前端路由菜单
     * @return
     */
    @ApiOperation("构建前端路由菜单")
    @GetMapping(value = "/build")
    public R<List<TreeModel>> buildMenus(){
        String username = GlobalAuthUtils.getCurrentUser();
        List<SysMenu> sysMenuList = sysMenuService.findByName(username);

        List<SysMenuDTO> sysMenuDtoList =new ArrayList();

        sysMenuList.stream().forEach(item->sysMenuDtoList.add(BeanCopyUtils.copy(item,SysMenuDTO.class)));


        List<SysMenuDTO> sysMenuDTOTree = buildTree(sysMenuDtoList);

        List<MenuVo> menus = buildMenus(sysMenuDTOTree);

        return R.ok().write(menus);
    }

    /**
     * 通过用户查询菜单
     */
    @ApiOperation("通过用户查询菜单")
    @RequestMapping("/findByUser")
    public R<List<SysMenu>> findByUser(String username){
        return R.ok().write(sysMenuService.findByUser(username));
    }


    /**
     * 查询角色菜单
     */
    @ApiOperation("通过角色查询菜单")
    @RequestMapping("/findByRoleId")
    public R<List<SysMenu>> findByRoleId(long roleId){
        return R.ok().write(sysMenuService.findByRoleId(roleId));
    }

    /**
     * 查询菜单
     */
    @ApiOperation("查询菜单列表")
    @RequestMapping("/list")
    public R<List<SysMenuDTO>> listAll(){
        System.out.println("console:"+sysMenuService.listAll().get(0).getComponent()==null);
        return R.ok().write(sysMenuService.listAll());
    }


    /**
     * 菜单树
     * @return
     */
    @ApiOperation("查询菜单树")
    @RequestMapping("/tree")
    public R<TreeModel> tree(String roleId){
        return R.ok().write(sysMenuService.tree());
    }

    /**
     * 信息
     */
    @ApiOperation("查询菜单信息")
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysMenu sysMenu = sysMenuService.getById(id);

        return R.ok().write(sysMenu);
    }

    /**
     * 保存
     */
    @ApiOperation("新增菜单信息")
    @RequestMapping("/add")
    public R add(@RequestBody SysMenu sysMenu){
        if (sysMenu.getParentId()==null) {
            throw new BadRequestException("必须存在父级ID ");
        }
        sysMenuService.save(sysMenu);

        return R.ok();
    }

    /**
     * 修改
     */
    @ApiOperation("修改菜单信息")
    @RequestMapping("/modify")
    public R modify(@RequestBody SysMenu sysMenu){
		sysMenuService.updateById(sysMenu);

        return R.ok();
    }

    /**
     * 删除(子节点id)
     */
    @ApiOperation("删除菜单信息")
    @RequestMapping("/remove/{id}")
    public R remove(@PathVariable("id") Long id){
		sysMenuService.removeById(id);

        return R.ok();
    }

    private List<SysMenuDTO> buildTree(List<SysMenuDTO> menuDTOS){
        List<SysMenuDTO> trees = new ArrayList<SysMenuDTO>();

        for (SysMenuDTO menuDTO : menuDTOS) {

            if ("0".equals(menuDTO.getParentId().toString())) {
                trees.add(menuDTO);
            }

            for (SysMenuDTO it : menuDTOS) {
                if (it.getParentId().toString().equals(menuDTO.getId().toString())) {
                    if (menuDTO.getChildren() == null) {
                        menuDTO.setChildren(new ArrayList<SysMenuDTO>());
                    }
                    menuDTO.getChildren().add(it);
                }
            }
        }
        return trees;
    }

    public List<MenuVo> buildMenus(List<SysMenuDTO> menuDTOS) {
        List<MenuVo> list = new LinkedList<>();
        menuDTOS.forEach(menuDTO -> {
                    if (menuDTO!=null){
                        List<SysMenuDTO> menuDTOList = menuDTO.getChildren();
                        MenuVo menuVo = new MenuVo();
                        menuVo.setName(menuDTO.getName());
                        menuVo.setPath(menuDTO.getPath());

                        // 如果不是外链
                        if(!"1".equals(menuDTO.getIsIframe())){
                            if(menuDTO.getParentId().equals(0L)){
                                //一级目录需要加斜杠，不然访问 会跳转404页面
                                menuVo.setPath("/" + menuDTO.getPath());
                                menuVo.setComponent(StrUtil.isEmpty(menuDTO.getComponent())?"Layout":menuDTO.getComponent());
                            }else if(!StrUtil.isEmpty(menuDTO.getComponent())){
                                menuVo.setComponent(menuDTO.getComponent());
                            }
                        }
                        menuVo.setMeta(new MenuMetaVo(menuDTO.getName(),menuDTO.getIcon()));
                        if(menuDTOList!=null && menuDTOList.size()!=0){
                            menuVo.setAlwaysShow(true);
                            menuVo.setRedirect("noredirect");
                            menuVo.setChildren(buildMenus(menuDTOList));
                            // 处理是一级菜单并且没有子菜单的情况
                        } else {
                            if ("0".equals(menuDTO.getParentId().toString())) {
                                MenuVo menuVo1 = new MenuVo();
                                menuVo1.setMeta(menuVo.getMeta());
                                // 非外链
                                if (!"1".equals(menuDTO.getIsIframe())) {
                                    menuVo1.setPath("index");
                                    menuVo1.setName(menuVo.getName());
                                    menuVo1.setComponent(menuVo.getComponent());
                                } else {
                                    menuVo1.setPath(menuDTO.getPath());
                                }
                                menuVo.setName(null);
                                menuVo.setMeta(null);
                                menuVo.setComponent("Layout");
                                List<MenuVo> list1 = new ArrayList<MenuVo>();
                                list1.add(menuVo1);
                                menuVo.setChildren(list1);
                            }
                        }
                        list.add(menuVo);
                    }
                }
        );
        return list;
    }

}
