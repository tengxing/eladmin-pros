package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 菜单表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @since 2019-05-03
 */
@Data
@TableName("sys_menu")
public class SysMenu implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 父id
	 */
	private Long parentId;
	/**
	 * 菜单标题
	 */
	private String name;
	/**
	 * 路径
	 */
	private String path;
	/**
	 * 组件
	 */
	private String component;
	/**
	 * 组件名字
	 */
	private String componentName;
	/**
	 * 菜单排序
	 */
	private Double sort;
	/**
	 * 菜单图标
	 */
	private String icon;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 创建人
	 */
	private String createBy;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新人
	 */
	private String updateBy;
	/**
	 * 更新时间
	 */
	private Date updateTime;

}
