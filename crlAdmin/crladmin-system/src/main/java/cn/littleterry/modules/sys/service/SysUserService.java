package cn.littleterry.modules.sys.service;

import cn.littleterry.modules.sys.entity.dto.SysUserDto;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.littleterry.modules.sys.entity.SysUser;

import java.util.List;
import java.util.Map;

/**
 * 用户表
 *
 * @author terry
 * @since 2019-05-03
 */
public interface SysUserService extends IService<SysUser> {
    void add(SysUserDto userDto);

    void modify(SysUserDto userDto);

    List<SysUserDto> queryByMap(Map<String,Object> params);
}

