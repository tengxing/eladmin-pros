package cn.littleterry.modules.sys.service.impl;

import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.mapper.SysMenuMapper;
import cn.littleterry.modules.sys.service.SysMenuService;
import cn.littleterry.modules.sys.service.SysUserService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;


@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    @Resource
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private SysUserService sysUserService;

    @Override
    public List<SysMenu> findByName(String username) {
        return this.sysMenuMapper.findByUser(username);
    }

    @Override
    public List<SysMenu> findByRoleId(long roleId) {
        return this.sysMenuMapper.findByRoleId(roleId);
    }

    @Override
    public List<SysMenuDTO> listAll() {
        List<SysMenu>  allMenuList = this.sysMenuMapper.selectList(Wrappers.emptyWrapper());
        List<SysMenuDTO> treeModels =new ArrayList<>();
        for(SysMenu menu : allMenuList){
            if ("0".equals(menu.getParentId().toString())){
                SysMenuDTO tm= new SysMenuDTO();
                BeanUtils.copyProperties(menu,tm);
                treeModels.add(tm);
            }
        }

        for (SysMenuDTO parentMenu : treeModels){
            List<SysMenuDTO> children = new ArrayList<>();
            for (SysMenu menu : allMenuList){
                if (parentMenu.getId().toString().equals(menu.getParentId().toString())){
                    SysMenuDTO tm= new SysMenuDTO();
                    BeanUtils.copyProperties(menu,tm);
                    children.add(tm);
                }
            }
            parentMenu.setChildren(children);
        }
        return treeModels;
    }

    @Override
    public List<TreeModel> findByUser(String username){
        List<SysMenu> menuList = this.sysMenuMapper.findByUser(username);
        List<TreeModel> treeModels =new ArrayList<>();
        buildMenu(treeModels,menuList);
        return treeModels;
    }
    @Override
    public List<TreeModel> tree() {
        List<SysMenu>  allMenuList = this.sysMenuMapper.selectList(Wrappers.emptyWrapper());
        List<TreeModel> treeModels =new ArrayList<>();
        buildMenu(treeModels,allMenuList);
        return treeModels;
    }

    /**
     * 构造tree
     * @param treeModels
     * @param allList
     */
    private void buildMenu(List<TreeModel> treeModels,List<SysMenu> allList){
        for(SysMenu menu : allList){
            if ("0".equals(menu.getParentId().toString())){
                TreeModel tm= new TreeModel();
                tm.setId(menu.getId().intValue());
                tm.setLabel(menu.getName());
                treeModels.add(tm);
            }
        }

        for (TreeModel parentMenu : treeModels){
            List<TreeModel> children = new ArrayList<>();
            for (SysMenu menu : allList){
                if (parentMenu.getId().toString().equals(menu.getParentId().toString())){
                    TreeModel tm= new TreeModel();
                    tm.setId(menu.getId().intValue());
                    tm.setLabel(menu.getName());
                    children.add(tm);
                }
            }
            parentMenu.setChildren(children);
        }
    }
}