package cn.littleterry.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysRolePermissionMapper;
import cn.littleterry.modules.sys.entity.SysRolePermission;
import cn.littleterry.modules.sys.service.SysRolePermissionService;

import java.util.List;


@Service("sysRolePermissionService")
public class SysRolePermissionServiceImpl extends ServiceImpl<SysRolePermissionMapper, SysRolePermission> implements SysRolePermissionService {

    @Autowired
    SysRolePermissionMapper sysRolePermissionMapper;

    @Override
    public List<SysRolePermission> listByRoleId(Long id) {
        return this.sysRolePermissionMapper.listByRoleId(id);
    }
}