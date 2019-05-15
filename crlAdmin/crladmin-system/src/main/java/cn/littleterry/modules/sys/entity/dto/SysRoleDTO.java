package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.SysPermission;
import cn.littleterry.modules.sys.entity.SysRole;
import lombok.Data;

import java.util.List;

/**
 * @author tengxing
 * @since 13/05/2019
 */
@Data
public class SysRoleDTO extends SysRole {
    List<SysMenu> menus;
    List<SysPermission> permissions;
}
