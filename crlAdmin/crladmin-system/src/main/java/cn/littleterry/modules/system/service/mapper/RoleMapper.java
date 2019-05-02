package cn.littleterry.modules.system.service.mapper;

import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.domain.Role;
import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.service.dto.RoleDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * @author terry
 * @date 2018-11-23
 */
@Mapper(componentModel = "spring", uses = {PermissionMapper.class, MenuMapper.class, DeptMapper.class}, unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface RoleMapper extends EntityMapper<RoleDTO, Role> {

}
