package cn.littleterry.service;

import cn.littleterry.domain.Log;
import cn.littleterry.domain.Log;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.scheduling.annotation.Async;

/**
 * @author terry
 * @date 2018-11-24
 */
public interface LogService {

    /**
     * 新增日志
     * @param joinPoint
     * @param log
     */
    @Async
    void save(ProceedingJoinPoint joinPoint, Log log);
}
