package cn.littleterry.modules.system.service.mapper;

import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.domain.Menu;
import cn.littleterry.modules.system.service.dto.MenuDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * @author terry
 * @date 2018-12-17
 */
@Mapper(componentModel = "spring",uses = {},unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface MenuMapper extends EntityMapper<MenuDTO, Menu> {

}
