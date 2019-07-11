package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 部门组织表
 *
 * @author terry
 * @since 2019-07-06
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

    SysDept findByJobId(Long jobId);
}
