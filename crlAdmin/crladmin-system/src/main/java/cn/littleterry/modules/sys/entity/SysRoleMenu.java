package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 角色菜单表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @since 2019-05-03
 */
@Data
@TableName("sys_role_menu")
public class SysRoleMenu implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 角色id
	 */
	private Long roleId;
	/**
	 * 菜单id
	 */
	private Long menuId;

}
