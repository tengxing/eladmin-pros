package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 部门表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {
	
}
