package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysRole;
import cn.littleterry.modules.sys.service.SysRoleService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 角色表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysrole")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysRole sysRole, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>(sysRole);
        Page<SysRole> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysRoleService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysRole sysRole = sysRoleService.getById(id);

        return R.ok().write(sysRole);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysRole sysRole){
		sysRoleService.save(sysRole);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysRole sysRole){
		sysRoleService.updateById(sysRole);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysRoleService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
