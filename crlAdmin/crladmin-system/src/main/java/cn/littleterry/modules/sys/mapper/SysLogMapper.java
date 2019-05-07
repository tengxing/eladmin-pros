package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysLogMapper extends BaseMapper<SysLog> {
	
}
