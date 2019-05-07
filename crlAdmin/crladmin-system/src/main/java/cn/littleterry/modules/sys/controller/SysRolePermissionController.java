package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysRolePermission;
import cn.littleterry.modules.sys.service.SysRolePermissionService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 角色权限表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysrolepermission")
public class SysRolePermissionController {
    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysRolePermission sysRolePermission, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysRolePermission> queryWrapper = new QueryWrapper<>(sysRolePermission);
        Page<SysRolePermission> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysRolePermissionService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysRolePermission sysRolePermission = sysRolePermissionService.getById(id);

        return R.ok().write(sysRolePermission);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysRolePermission sysRolePermission){
		sysRolePermissionService.save(sysRolePermission);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysRolePermission sysRolePermission){
		sysRolePermissionService.updateById(sysRolePermission);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysRolePermissionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
