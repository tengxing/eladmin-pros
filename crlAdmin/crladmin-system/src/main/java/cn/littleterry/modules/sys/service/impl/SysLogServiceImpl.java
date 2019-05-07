package cn.littleterry.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.littleterry.modules.sys.mapper.SysLogMapper;
import cn.littleterry.modules.sys.entity.SysLog;
import cn.littleterry.modules.sys.service.SysLogService;


@Service("sysLogService")
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {
}