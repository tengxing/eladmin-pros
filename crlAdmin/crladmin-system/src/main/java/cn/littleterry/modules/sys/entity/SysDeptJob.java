package cn.littleterry.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 部门职位表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @date 2019-07-06
 */
@Data
@TableName("sys_dept_job")
public class SysDeptJob implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 部门id
	 */
	private Long deptId;
	/**
	 * 职位id
	 */
	private Long jobId;

}
