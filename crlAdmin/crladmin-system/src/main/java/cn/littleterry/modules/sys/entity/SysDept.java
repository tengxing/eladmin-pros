package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 部门表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @since 2019-05-03
 */
@Data
@TableName("sys_dept")
public class SysDept implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 父部门ID
	 */
	private Long parentId;
	/**
	 * 部门名称
	 */
	private String deptName;
	/**
	 * 部门编码
	 */
	private String deptCode;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 状态（1启用，0不启用）
	 */
	private String status;
	/**
	 * 创建人
	 */
	private String createBy;
	/**
	 * 创建日期
	 */
	private Date createTime;
	/**
	 * 更新人
	 */
	private String updateBy;
	/**
	 * 更新日期
	 */
	private Date updateTime;

}
