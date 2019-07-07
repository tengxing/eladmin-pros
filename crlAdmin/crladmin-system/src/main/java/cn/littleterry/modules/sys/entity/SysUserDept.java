package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户部门表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @date 2019-07-06
 */
@Data
@TableName("sys_user_dept")
public class SysUserDept implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 部门id
	 */
	private Long deptId;

}
