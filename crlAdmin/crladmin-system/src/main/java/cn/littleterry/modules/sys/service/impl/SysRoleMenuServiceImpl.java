package cn.littleterry.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysRoleMenuMapper;
import cn.littleterry.modules.sys.entity.SysRoleMenu;
import cn.littleterry.modules.sys.service.SysRoleMenuService;

import java.util.List;


@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {

    @Autowired
    SysRoleMenuMapper sysRoleMenuMapper;
    @Override
    public List<SysRoleMenu> listByRoleId(Long id) {
        return this.sysRoleMenuMapper.listByRoleId(id);
    }
}