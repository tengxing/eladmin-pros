package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysUserRole;
import cn.littleterry.modules.sys.service.SysUserRoleService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 用户角色表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysuserrole")
public class SysUserRoleController {
    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysUserRole sysUserRole, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysUserRole> queryWrapper = new QueryWrapper<>(sysUserRole);
        Page<SysUserRole> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysUserRoleService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysUserRole sysUserRole = sysUserRoleService.getById(id);

        return R.ok().write(sysUserRole);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysUserRole sysUserRole){
		sysUserRoleService.save(sysUserRole);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysUserRole sysUserRole){
		sysUserRoleService.updateById(sysUserRole);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysUserRoleService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
