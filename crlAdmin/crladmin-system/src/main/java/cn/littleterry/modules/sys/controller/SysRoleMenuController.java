package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysRoleMenu;
import cn.littleterry.modules.sys.service.SysRoleMenuService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 角色菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysrolemenu")
public class SysRoleMenuController {
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysRoleMenu sysRoleMenu, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysRoleMenu> queryWrapper = new QueryWrapper<>(sysRoleMenu);
        Page<SysRoleMenu> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysRoleMenuService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysRoleMenu sysRoleMenu = sysRoleMenuService.getById(id);

        return R.ok().write(sysRoleMenu);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysRoleMenu sysRoleMenu){
		sysRoleMenuService.save(sysRoleMenu);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysRoleMenu sysRoleMenu){
		sysRoleMenuService.updateById(sysRoleMenu);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysRoleMenuService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
