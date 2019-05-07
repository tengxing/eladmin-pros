package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 权限表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @since 2019-05-03
 */
@Data
@TableName("sys_permission")
public class SysPermission implements Serializable {
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
	 * 权限标题
	 */
	private String name;
	/**
	 * 权限编码
	 */
	private String code;
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
