package cn.littleterry.modules.system.service.mapper;

import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.domain.Dict;
import cn.littleterry.modules.system.service.dto.DictDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
* @author terry
* @date 2019-04-10
*/
@Mapper(componentModel = "spring",uses = {},unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface DictMapper extends EntityMapper<DictDTO, Dict> {

}