package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.entity.SysJob;
import lombok.Data;

/**
 * @author terry
 * @since 10/07/2019
 */
@Data
public class SysJobDto extends SysJob {
    private SysDept dept;
}
