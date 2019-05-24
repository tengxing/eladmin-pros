package cn.littleterry.modules.sys.controller;


import cn.littleterry.exception.BadRequestException;
import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.service.SysMenuService;
import cn.littleterry.modules.sys.service.SysRoleMenuService;
import cn.littleterry.util.GlobalAuthUtils;
import cn.littleterry.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping(value = "/build")
    public R<List<TreeModel>> buildMenus(){
        String username = GlobalAuthUtils.getCurrentUser();
        List<SysMenu> sysMenuList = sysMenuService.findByName(username);
        return R.ok().write(sysMenuList);
    }

    /**
     * 通过用户查询菜单
     */
    @RequestMapping("/findByUser")
    public R<List<SysMenu>> findByUser(String username){
        return R.ok().write(sysMenuService.findByUser(username));
    }


    /**
     * 查询角色菜单
     */
    @RequestMapping("/findByRoleId")
    public R<List<SysMenu>> findByRoleId(long roleId){
        return R.ok().write(sysMenuService.findByRoleId(roleId));
    }

    /**
     * 查询菜单
     */
    @RequestMapping("/list")
    public R<List<SysMenuDTO>> listAll(){
        return R.ok().write(sysMenuService.listAll());
    }


    /**
     * 菜单树
     * @return
     */
    @RequestMapping("/tree")
    public R<TreeModel> tree(String roleId){
        return R.ok().write(sysMenuService.tree());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysMenu sysMenu = sysMenuService.getById(id);

        return R.ok().write(sysMenu);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysMenu sysMenu){
        if (sysMenu.getParentId()==null) {
            throw new BadRequestException("必须存在父级ID ");
        }
        sysMenuService.save(sysMenu);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysMenu sysMenu){
		sysMenuService.updateById(sysMenu);

        return R.ok();
    }

    /**
     * 删除(子节点id)
     */
    @RequestMapping("/delete/{id}")
    public R delete(@PathVariable("id") Long id){
		sysMenuService.removeById(id);

        return R.ok();
    }

}
