package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.service.SysMenuService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 菜单表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysmenu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysMenu sysMenu, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysMenu> queryWrapper = new QueryWrapper<>(sysMenu);
        Page<SysMenu> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysMenuService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysMenu sysMenu = sysMenuService.getById(id);

        return R.ok().write(sysMenu);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysMenu sysMenu){
		sysMenuService.save(sysMenu);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysMenu sysMenu){
		sysMenuService.updateById(sysMenu);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysMenuService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
