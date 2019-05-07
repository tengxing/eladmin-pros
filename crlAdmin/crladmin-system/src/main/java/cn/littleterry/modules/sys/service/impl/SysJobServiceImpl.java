package cn.littleterry.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysJobMapper;
import cn.littleterry.modules.sys.entity.SysJob;
import cn.littleterry.modules.sys.service.SysJobService;


@Service("sysJobService")
public class SysJobServiceImpl extends ServiceImpl<SysJobMapper, SysJob> implements SysJobService {
}