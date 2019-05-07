package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysLog;
import cn.littleterry.modules.sys.service.SysLogService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;



/**
 * 系统日志表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/syslog")
public class SysLogController {
    @Autowired
    private SysLogService sysLogService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysLog sysLog, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysLog> queryWrapper = new QueryWrapper<>(sysLog);
        Page<SysLog> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysLogService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysLog sysLog = sysLogService.getById(id);

        return R.ok().write(sysLog);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysLog sysLog){
		sysLogService.save(sysLog);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysLog sysLog){
		sysLogService.updateById(sysLog);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysLogService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
