package cn.littleterry.modules.sys.entity.vo;

import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.entity.SysMenu;
import lombok.Data;

import java.util.List;

/**
 * @author terry
 * @since 06/07/2019
 */
@Data
public class SysDeptVo extends SysDept {
    List<SysMenu> children;
}
