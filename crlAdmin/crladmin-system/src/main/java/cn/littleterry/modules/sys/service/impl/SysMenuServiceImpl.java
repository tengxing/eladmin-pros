package cn.littleterry.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysMenuMapper;
import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.service.SysMenuService;


@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
}