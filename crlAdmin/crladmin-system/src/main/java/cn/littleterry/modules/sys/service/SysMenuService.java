package cn.littleterry.modules.sys.service;

import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.littleterry.modules.sys.entity.SysMenu;

import java.util.List;

/**
 * 菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
public interface SysMenuService extends IService<SysMenu> {
    List<SysMenu> findByRoleId(long roleId);

    List<TreeModel> tree();

    List<TreeModel> findByUser(String username);

    List<SysMenuDTO> listAll();

    List<SysMenu> findByName(String username);
}

