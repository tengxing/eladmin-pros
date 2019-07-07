package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.entity.SysJob;
import cn.littleterry.modules.sys.entity.SysRole;
import cn.littleterry.modules.sys.entity.SysUser;
import lombok.Data;

/**
 * @author terry
 * @since 06/07/2019
 */
@Data
public class SysUserDto extends SysUser {
    private SysRole[] roles;
    private SysDept dept;
    private SysJob job;
    private String deptCode;
    private String deptName;
    private String jobCode;
    private String jobName;
}
