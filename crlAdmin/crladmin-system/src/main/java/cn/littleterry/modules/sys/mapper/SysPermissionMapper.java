package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.SysPermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 权限表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    List<SysMenu> queryByUser(@Param("username") String username);

    List<SysPermission> findByRoleId(long roleId);
}
