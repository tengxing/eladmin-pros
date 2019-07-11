package cn.littleterry.modules.sys.service.impl;

import cn.littleterry.modules.sys.entity.SysDept;
import cn.littleterry.modules.sys.mapper.SysDeptMapper;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysJobMapper;
import cn.littleterry.modules.sys.entity.SysJob;
import cn.littleterry.modules.sys.service.SysJobService;

import javax.annotation.Resource;


@Service("sysJobService")
public class SysJobServiceImpl extends ServiceImpl<SysJobMapper, SysJob> implements SysJobService {


    @Resource
    SysDeptMapper sysDeptMapper;
    @Override
    public SysDept findSysDeptByJobId(Long jobId) {
        return sysDeptMapper.findByJobId(jobId);
    }
}