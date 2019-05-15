package cn.littleterry.modules.sys.service;

import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.SysPermissionDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.littleterry.modules.sys.entity.SysPermission;

import java.util.List;
import java.util.Map;

/**
 * 权限表
 *
 * @author terry
 * @since 2019-05-03
 */
public interface SysPermissionService extends IService<SysPermission> {
    List<SysPermissionDTO> listAll();
    List<TreeModel> tree();
    List<SysPermission> findByRoleId(long roleId);
}

