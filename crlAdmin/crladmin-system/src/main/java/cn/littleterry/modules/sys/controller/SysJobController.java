package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysJob;
import cn.littleterry.modules.sys.service.SysJobService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 岗位表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/sysjob")
public class SysJobController {
    @Autowired
    private SysJobService sysJobService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysJob sysJob, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysJob> queryWrapper = new QueryWrapper<>(sysJob);
        Page<SysJob> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysJobService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysJob sysJob = sysJobService.getById(id);

        return R.ok().write(sysJob);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysJob sysJob){
		sysJobService.save(sysJob);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysJob sysJob){
		sysJobService.updateById(sysJob);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysJobService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
