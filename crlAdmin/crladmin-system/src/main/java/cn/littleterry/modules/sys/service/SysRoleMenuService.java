package cn.littleterry.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.littleterry.modules.sys.entity.SysRoleMenu;

import java.util.List;
import java.util.Map;

/**
 * 角色菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
public interface SysRoleMenuService extends IService<SysRoleMenu> {
    List<SysRoleMenu> listByRoleId(Long id);
}

