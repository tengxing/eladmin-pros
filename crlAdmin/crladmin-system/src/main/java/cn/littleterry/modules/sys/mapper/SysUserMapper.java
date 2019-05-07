package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
	
}
