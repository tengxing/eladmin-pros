package cn.littleterry.modules.sys.service.impl;

import cn.littleterry.modules.sys.entity.*;
import cn.littleterry.modules.sys.entity.dto.SysUserDto;
import cn.littleterry.modules.sys.mapper.SysUserDeptMapper;
import cn.littleterry.modules.sys.mapper.SysUserRoleMapper;
import cn.littleterry.modules.sys.util.BeanCopyUtils;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysUserMapper;
import cn.littleterry.modules.sys.service.SysUserService;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Slf4j
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Resource
    private SysUserRoleMapper userRoleMapper;
    @Resource
    private SysUserDeptMapper userDeptMapper;


    @Override
    public List<SysUserDto> queryByMap(Map<String, Object> params) {
        return sysUserMapper.queryByMap(params);
    }

    @Override
    public void add(SysUserDto userDto) {
        /*if(userRepository.findByUsername(resources.getUsername())!=null){
            throw new EntityExistException(User.class,"username",resources.getUsername());
        }

        if(userRepository.findByEmail(resources.getEmail())!=null){
            throw new EntityExistException(User.class,"email",resources.getEmail());
        }*/

        this.save(BeanCopyUtils.copy(userDto,SysUser.class));

        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.eq("username",userDto.getUsername());
        SysUser sysUser = this.getOne(query);

        this.updateOtherInfo(sysUser.getId(),userDto);
    }

    @Override
    public void modify(SysUserDto userDto) {
        SysUser sysUser = BeanCopyUtils.copy(userDto,SysUser.class);
        this.updateById(sysUser);

        this.updateOtherInfo(userDto.getId(),userDto);
    }

    /**
     * 更新用户角色，部门，岗位
     * @param userId
     * @param userDto
     */
    private void updateOtherInfo(Long userId, SysUserDto userDto) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id",userId);

        List<SysUserRole> oldroles = userRoleMapper.selectList(queryWrapper);
        if (!CollectionUtils.isEmpty(oldroles)){
            userRoleMapper.deleteBatchIds(oldroles);
        }

        List<SysUserDept> oldDepts = userDeptMapper.selectList(queryWrapper);
        if (!CollectionUtils.isEmpty(oldDepts)){
            userDeptMapper.deleteBatchIds(oldDepts);
        }


        SysRole[] roles = userDto.getRoles();
        if (roles.length>0){
            for (SysRole item : roles){
                SysUserRole userRole = new SysUserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(item.getId());
                int r = userRoleMapper.insert(userRole);
                if (r > 0){
                    log.info("insert a userRole record successful");
                }
            }
        }
        SysDept dept = userDto.getDept();
        if (dept != null){
            SysUserDept userDept = new SysUserDept();
            userDept.setUserId(userId);
            userDept.setDeptId(dept.getId());
            int r = userDeptMapper.insert(userDept);
            if (r > 0){
                log.info("insert a userDept record successful");
            }
        }
    }

}