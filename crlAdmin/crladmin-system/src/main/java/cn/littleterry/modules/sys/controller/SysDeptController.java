package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.service.SysDeptService;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



/**
 * 部门表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/dept")
public class SysDeptController {
    @Autowired
    private SysDeptService sysDeptService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysDept sysDept, @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="page", defaultValue="10") Integer pageSize){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>(sysDept);
        Page<SysDept> page = new Page<>(pageNo,pageSize);
        IPage pageList = sysDeptService.page(page,queryWrapper);

        return R.ok().write(pageList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysDept sysDept = sysDeptService.getById(id);

        return R.ok().write(sysDept);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysDept sysDept){
		sysDeptService.save(sysDept);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysDept sysDept){
		sysDeptService.updateById(sysDept);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete/{id}")
    public R delete(@PathVariable("id") Long id){
		sysDeptService.removeById(id);

        return R.ok();
    }

}
