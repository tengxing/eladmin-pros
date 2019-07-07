package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.dto.SysDeptDto;
import cn.littleterry.modules.sys.entity.dto.SysMenuDTO;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import cn.littleterry.modules.sys.service.SysDeptService;
import cn.littleterry.modules.system.service.dto.DeptDTO;
import cn.littleterry.util.R;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;


/**
 * 部门组织表
 *
 * @author terry
 * @since 2019-07-06
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
                  @RequestParam(name="size", defaultValue="10") Integer pageSize){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>(sysDept);
        Page<SysDept> page = new Page<>(pageNo,pageSize);
        IPage<SysDept> pageList = sysDeptService.page(page,queryWrapper);

        List<SysDept> all = pageList.getRecords();

        List<SysDeptDto> allDto = new ArrayList<>();
        all.forEach(item -> {
            SysDeptDto dto = new SysDeptDto();
            BeanUtils.copyProperties(item,dto);
            allDto.add(dto);
        });


        Set<SysDeptDto> trees = new LinkedHashSet<>();
        Set<SysDeptDto> depts= new LinkedHashSet<>();
        Boolean isChild;
        for (SysDeptDto deptDTO : allDto) {
            isChild = false;
            if ("0".equals(deptDTO.getParentId().toString())) {
                trees.add(deptDTO);
            }
            for (SysDeptDto it : allDto) {
                if (it.getParentId().toString().equals(deptDTO.getId().toString())) {
                    isChild = true;
                    if (deptDTO.getChildren() == null) {
                        deptDTO.setChildren(new ArrayList<SysDeptDto>());
                    }
                    deptDTO.getChildren().add(it);
                }
            }
            if(isChild) {
                depts.add(deptDTO);
            }
        }

        if (CollectionUtils.isEmpty(trees)) {
            trees = depts;
        }

        return R.ok().write(trees);
    }

    /**
     * 树
     */
    @RequestMapping("/tree")
    public R list(){
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("enabled","true");
        List<SysDept> deptList = sysDeptService.list(queryWrapper);


        List<SysDeptDto> allDto = new ArrayList<>();
        deptList.forEach(item -> {
            SysDeptDto dto = new SysDeptDto();
            BeanUtils.copyProperties(item,dto);
            allDto.add(dto);
        });

        Set<SysDeptDto> trees = new LinkedHashSet<>();
        Set<SysDeptDto> depts= new LinkedHashSet<>();
        Boolean isChild;
        for (SysDeptDto deptDTO : allDto) {
            isChild = false;
            if ("0".equals(deptDTO.getParentId().toString())) {
                trees.add(deptDTO);
            }
            for (SysDeptDto it : allDto) {
                if (it.getParentId().toString().equals(deptDTO.getId().toString())) {
                    isChild = true;
                    if (deptDTO.getChildren() == null) {
                        deptDTO.setChildren(new ArrayList<SysDeptDto>());
                    }
                    deptDTO.getChildren().add(it);
                }
            }
            if(isChild) {
                depts.add(deptDTO);
            }
        }

        if (CollectionUtils.isEmpty(trees)) {
            trees = depts;
        }
        return R.ok().write(trees);
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
    @RequestMapping("/add")
    public R add(@RequestBody SysDept sysDept){
        sysDept.setDeptCode(String.valueOf(Math.round(Math.random()*1000)));
		sysDeptService.save(sysDept);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/modify")
    public R modify(@RequestBody SysDept sysDept){
		sysDeptService.updateById(sysDept);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/remove/{id}")
    public R remove(@RequestBody Long id){
		sysDeptService.removeById(id);

        return R.ok();
    }

}
