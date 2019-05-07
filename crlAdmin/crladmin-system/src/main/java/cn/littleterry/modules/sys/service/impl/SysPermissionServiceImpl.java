package cn.littleterry.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysPermissionMapper;
import cn.littleterry.modules.sys.entity.SysPermission;
import cn.littleterry.modules.sys.service.SysPermissionService;


@Service("sysPermissionService")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements SysPermissionService {
}