package cn.littleterry.modules.system.service.mapper;

import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.domain.User;
import cn.littleterry.mapper.EntityMapper;
import cn.littleterry.modules.system.service.dto.UserDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * @author terry
 * @date 2018-11-23
 */
@Mapper(componentModel = "spring",uses = {RoleMapper.class, DeptMapper.class, JobMapper.class},unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper extends EntityMapper<UserDTO, User> {

}
