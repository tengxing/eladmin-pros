package cn.littleterry.modules.sys.service;

import cn.littleterry.modules.sys.entity.SysDept;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.littleterry.modules.sys.entity.SysJob;

import java.util.Map;

/**
 * 岗位表
 *
 * @author terry
 * @since 2019-05-03
 */
public interface SysJobService extends IService<SysJob> {
    SysDept findSysDeptByJobId(Long id);
}

