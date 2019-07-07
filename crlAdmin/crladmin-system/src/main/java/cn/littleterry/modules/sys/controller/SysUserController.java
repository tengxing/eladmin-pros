package cn.littleterry.modules.sys.controller;


import cn.littleterry.modules.sys.entity.SysUser;
import cn.littleterry.modules.sys.entity.dto.SysUserDto;
import cn.littleterry.modules.sys.service.SysUserService;
import cn.littleterry.util.R;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 用户表
 *
 * @author terry
 * @since 2019-05-03
 */
@RestController
@RequestMapping("sys/user")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(SysUser sysUser,
                  @RequestParam(name="page", defaultValue="1") Integer pageNo,
                  @RequestParam(name="size", defaultValue="10") Integer pageSize,
                  @RequestParam(name="deptId", required = false) Integer deptId){
        Map<String,Object> params= new HashMap<>();
        params.put("deptId",deptId);
        PageHelper.startPage(pageNo, pageSize);
        List<SysUserDto> list = sysUserService.queryByMap(params);
        PageInfo<SysUserDto> pageInfo = new PageInfo<>(list);

        return R.ok().write(list);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysUser sysUser = sysUserService.getById(id);

        return R.ok().write(sysUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/add")
    public R save(@RequestBody SysUserDto userDto){

        // 默认密码 123456，此密码是加密后的字符
        userDto.setPassword("e10adc3949ba59abbe56e057f20f883e");
        userDto.setAvatar("https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg");
        System.out.println(JSON.toJSONString(userDto));

        sysUserService.add(userDto);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/modify")
    public R modify(@RequestBody SysUserDto userDto){

        if (userDto.getId() == null){
            //用户ID不能为空
        }
        sysUserService.modify(userDto);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/remove/{id}")
    public R delete(@PathVariable("id") Long id){
		sysUserService.removeById(id);

        return R.ok();
    }

}
