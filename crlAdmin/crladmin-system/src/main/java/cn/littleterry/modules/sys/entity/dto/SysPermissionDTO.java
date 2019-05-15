package cn.littleterry.modules.sys.entity.dto;

import cn.littleterry.modules.sys.entity.SysPermission;
import lombok.Data;

import java.util.List;

/**
 * @author tengxing
 * @since 13/05/2019
 */
@Data
public class SysPermissionDTO extends SysPermission {
    List<SysPermissionDTO> children;
}
