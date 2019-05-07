package cn.littleterry.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysUserRoleMapper;
import cn.littleterry.modules.sys.entity.SysUserRole;
import cn.littleterry.modules.sys.service.SysUserRoleService;


@Service("sysUserRoleService")
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {
}