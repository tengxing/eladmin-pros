package cn.littleterry.modules.sys.mapper;

import cn.littleterry.modules.sys.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {
	
}
