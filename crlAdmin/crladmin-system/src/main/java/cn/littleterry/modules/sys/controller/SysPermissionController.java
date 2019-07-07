package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysPermission;
import cn.littleterry.modules.sys.entity.dto.SysPermissionDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.service.SysPermissionService;
import cn.littleterry.util.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @ApiOperation("分页查询权限列表信息")
    @RequestMapping("/list")
    public R<List<SysPermissionDTO>> listAll(){
        return R.ok().write(sysPermissionService.listAll());
    }

    /**
     * 菜单树
     * @return
     */
    @ApiOperation("查询权限树信息")
    @RequestMapping("/tree")
    public R<TreeModel> tree(){
        return R.ok().write(sysPermissionService.tree());
    }

    /**
     * 信息
     */
    @ApiOperation("查询权限信息")
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysPermission sysPermission = sysPermissionService.getById(id);

        return R.ok().write(sysPermission);
    }

    /**
     * 保存
     */
    @ApiOperation("新增权限信息")
    @RequestMapping("/add")
    public R add(@RequestBody SysPermission sysPermission){
		sysPermissionService.save(sysPermission);

        return R.ok();
    }

    /**
     * 修改
     */

    @ApiOperation("修改权限信息")
    @RequestMapping("/modify")
    public R modify(@RequestBody SysPermission sysPermission){
		sysPermissionService.updateById(sysPermission);

        return R.ok();
    }

    /**
     * 删除
     */

    @ApiOperation("删除权限信息")
    @RequestMapping("/remove/{id}")
    public R remove(@PathVariable("id") Long id){
        sysPermissionService.removeById(id);

        return R.ok();
    }

}
