package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysDept;
import lombok.Data;

import java.util.List;

/**
 * @author terry
 * @since 06/07/2019
 */
@Data
public class SysDeptDto extends SysDept {
    List<SysDeptDto> children;
}
