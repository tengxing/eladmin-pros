package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysMenu;
import lombok.Data;

import java.util.List;

/**
 * @author tengxing
 * @since 08/05/2019
 */
@Data
public class SysMenuDTO extends SysMenu {
    List<SysMenuDTO> children;
}
