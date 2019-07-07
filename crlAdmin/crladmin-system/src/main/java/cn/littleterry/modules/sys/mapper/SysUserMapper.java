package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysUser;
import cn.littleterry.modules.sys.entity.dto.SysUserDto;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 用户表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    List<SysUserDto> queryByMap(Map<String,Object> params);
}
