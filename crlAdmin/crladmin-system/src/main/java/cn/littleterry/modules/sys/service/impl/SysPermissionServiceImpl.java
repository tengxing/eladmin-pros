package cn.littleterry.modules.sys.service.impl;

import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.SysPermission;
import cn.littleterry.modules.sys.entity.dto.SysPermissionDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.mapper.SysPermissionMapper;
import cn.littleterry.modules.sys.service.SysPermissionService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service("sysPermissionService")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements SysPermissionService {

    @Autowired
    SysPermissionMapper sysPermissionMapper;

    @Override
    public List<SysPermissionDTO> listAll() {
        List<SysPermission>  allList = this.sysPermissionMapper.selectList(Wrappers.emptyWrapper());
        List<SysPermissionDTO> treeModels =new ArrayList<>();
        for(SysPermission permission : allList){
            if ("0".equals(permission.getParentId().toString())){
                SysPermissionDTO tm= new SysPermissionDTO();
                BeanUtils.copyProperties(permission,tm);
                treeModels.add(tm);
            }
        }

        for (SysPermissionDTO parent : treeModels){
            List<SysPermissionDTO> children = new ArrayList<>();
            for (SysPermission permission : allList){
                if (parent.getId().toString().equals(permission.getParentId().toString())){
                    SysPermissionDTO tm= new SysPermissionDTO();
                    BeanUtils.copyProperties(permission,tm);
                    children.add(tm);
                }
            }
            parent.setChildren(children);
        }
        return treeModels;
    }

    @Override
    public List<TreeModel> tree() {
        List<SysPermission>  allList = this.sysPermissionMapper.selectList(Wrappers.emptyWrapper());
        List<TreeModel> treeModels =new ArrayList<>();
        buildTree(treeModels,allList);
        return treeModels;
    }

    @Override
    public List<SysPermission> findByRoleId(long roleId) {
        return this.sysPermissionMapper.findByRoleId(roleId);
    }

    /**
     * 构造tree
     * @param treeModels
     * @param allList
     */
    private void buildTree(List<TreeModel> treeModels,List<SysPermission> allList){
        for(SysPermission permission : allList){
            if ("0".equals(permission.getParentId().toString())){
                TreeModel tm= new TreeModel();
                tm.setId(permission.getId().intValue());
                tm.setLabel(permission.getName());
                treeModels.add(tm);
            }
        }

        for (TreeModel parent : treeModels){
            List<TreeModel> children = new ArrayList<>();
            for (SysPermission permission : allList){
                if (parent.getId().toString().equals(permission.getParentId().toString())){
                    TreeModel tm= new TreeModel();
                    tm.setId(permission.getId().intValue());
                    tm.setLabel(permission.getName());
                    children.add(tm);
                }
            }
            parent.setChildren(children);
        }
    }
}