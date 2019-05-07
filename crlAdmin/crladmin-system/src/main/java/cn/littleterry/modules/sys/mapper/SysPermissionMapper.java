package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysPermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 权限表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysPermissionMapper extends BaseMapper<SysPermission> {
	
}
