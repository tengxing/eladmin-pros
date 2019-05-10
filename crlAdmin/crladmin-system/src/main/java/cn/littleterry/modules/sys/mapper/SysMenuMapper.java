package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> queryByUser(String username);

    List<SysMenu> findByRoleId(Long roleId);
}
