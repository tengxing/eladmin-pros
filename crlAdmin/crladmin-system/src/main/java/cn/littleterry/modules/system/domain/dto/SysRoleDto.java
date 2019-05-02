package cn.littleterry.modules.system.domain.dto;

import lombok.Data;

/**
 * @author tengxing
 * @since 29/04/2019
 */
@Data
public class SysRoleDto {
    /**
     * id
     */
    private Long id;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色编码
     */
    private String roleCode;

    /**
     * 描述
     */
    private String description;
}
