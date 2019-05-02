package cn.littleterry.modules.system.service.mapper;

import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.domain.Job;
import cn.littleterry.modules.system.service.dto.JobDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
* @author terry
* @date 2019-03-29
*/
@Mapper(componentModel = "spring",uses = {DeptMapper.class},unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface JobMapper extends EntityMapper<JobDTO, Job> {

}