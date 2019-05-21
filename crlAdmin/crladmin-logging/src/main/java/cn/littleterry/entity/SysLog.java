package cn.littleterry.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 系统日志表
 * 
 * @author terry
 * @email tengxing7452@163.com
 * @date 2019-05-20
 */
@Data
@TableName("sys_log")
public class SysLog implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.ID_WORKER)
	private Long id;
	/**
	 * 日志类型（1登录日志，2操作日志）
	 */
	private Integer logType;
	/**
	 * 日志内容
	 */
	private String logContent;
	/**
	 * 操作类型
	 */
	private String logLevel;
	/**
	 * 操作用户账号
	 */
	private String operateId;
	/**
	 * 操作用户名称
	 */
	private String operateName;
	/**
	 * IP
	 */
	private String requestIp;
	/**
	 * 请求java方法
	 */
	private String operateMethod;
	/**
	 * 请求路径
	 */
	private String requestUri;
	/**
	 * 请求参数
	 */
	private String requestParam;
	/**
	 * 请求类型
	 */
	private String requestMethod;
	/**
	 * 耗时
	 */
	private Long costTime;
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

	public SysLog(String logLevel, Long costTime) {
		this.logLevel = logLevel;
		this.costTime = costTime;
	}
}
