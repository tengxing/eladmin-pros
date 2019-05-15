package cn.littleterry.modules.sys.service.impl;

import cn.littleterry.modules.sys.entity.SysRole;
import cn.littleterry.modules.sys.mapper.SysRoleMapper;
import cn.littleterry.modules.sys.service.SysRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;


@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Override
    public IPage<SysRole> listByPage(Map<String,Object> map) {
        SysRole sysRole = new SysRole();
        Long pageNo = Long.parseLong(map.get("page").toString());
        Long pageSize = Long.parseLong(map.get("size").toString());
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>(sysRole);
        Page<SysRole> page = new Page<>(pageNo,pageSize);
        return this.baseMapper.selectPage(page,queryWrapper);
    }
}