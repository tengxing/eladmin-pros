package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.entity.SysJob;
import cn.littleterry.modules.sys.entity.dto.SysJobDto;
import cn.littleterry.modules.sys.service.SysJobService;
import cn.littleterry.modules.sys.util.BeanCopyUtils;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;


/**
 * 岗位表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/job")
public class SysJobController {
    @Autowired
    private SysJobService sysJobService;

    /**
     * 列表
     */
    @ApiOperation("分页查询岗位列表信息")
    @RequestMapping("/list")
    public R list(SysJob sysJob, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="size", defaultValue="10") Integer pageSize){
        QueryWrapper<SysJob> queryWrapper = new QueryWrapper<>(sysJob);
        Page<SysJob> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysJobService.page(page,queryWrapper);

        List<SysJob> records = pageList.getRecords();

        List<SysJobDto> list = new LinkedList<>();
        for (SysJob item : records) {
            SysJobDto dto= BeanCopyUtils.copy(item,SysJobDto.class);
            SysDept dept = sysJobService.findSysDeptByJobId(item.getId());
            dto.setDept(dept);
            list.add(dto);
        }

        return R.ok().write(list);
    }

    /**
     * 信息
     */
    @ApiOperation("查询部门信息")
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysJob sysJob = sysJobService.getById(id);
        SysJobDto dto= BeanCopyUtils.copy(sysJob,SysJobDto.class);
        SysDept dept = sysJobService.findSysDeptByJobId(sysJob.getId());
        dto.setDept(dept);

        return R.ok().write(dto);
    }

    /**
     * 保存
     */
    @ApiOperation("新增部门信息")
    @RequestMapping("/add")
    public R add(@RequestBody SysJobDto sysJob){
		sysJobService.save(sysJob);

        return R.ok();
    }

    /**
     * 修改
     */
    @ApiOperation("修改部门信息")
    @RequestMapping("/modify")
    public R modify(@RequestBody SysJobDto sysJob){
		sysJobService.updateById(sysJob);

        return R.ok();
    }

    /**
     * 删除
     */
    @ApiOperation("删除部门信息")
    @RequestMapping("/remove/{id}")
    public R remove(@PathVariable("id") Long id){
		sysJobService.removeById(id);

        return R.ok();
    }

}
