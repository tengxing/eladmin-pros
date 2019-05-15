package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysPermission;
import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.SysPermissionDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.service.SysPermissionService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


/**
 * 权限表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/permission")
public class SysPermissionController {
    @Autowired
    private SysPermissionService sysPermissionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R<List<SysPermissionDTO>> listAll(){
        return R.ok().write(sysPermissionService.listAll());
    }

    /**
     * 菜单树
     * @return
     */
    @RequestMapping("/tree")
    public R<TreeModel> tree(){
        return R.ok().write(sysPermissionService.tree());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysPermission sysPermission = sysPermissionService.getById(id);

        return R.ok().write(sysPermission);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysPermission sysPermission){
		sysPermissionService.save(sysPermission);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysPermission sysPermission){
		sysPermissionService.updateById(sysPermission);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysPermissionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
