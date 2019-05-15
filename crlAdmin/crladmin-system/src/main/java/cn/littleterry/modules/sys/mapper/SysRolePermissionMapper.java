package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysRolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色权限表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysRolePermissionMapper extends BaseMapper<SysRolePermission> {

    List<SysRolePermission> listByRoleId(Long roleId);
}
