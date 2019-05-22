package cn.littleterry.service.impl;

import cn.hutool.json.JSONObject;
import cn.littleterry.entity.SysLog;
import cn.littleterry.mapper.SysLogMapper;
import cn.littleterry.repository.LogRepository;
import cn.littleterry.service.LogService;
import cn.littleterry.util.RequestHolder;
import cn.littleterry.util.SecurityContextHolder;
import cn.littleterry.util.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * @author terry
 * @since 2018-11-24
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class LogServiceImpl implements LogService {

    @Autowired
    private LogRepository logRepository;

    @Autowired
    private SysLogMapper sysLogMapper;

    private final String LOGINPATH = "login";

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(ProceedingJoinPoint joinPoint, SysLog log){

        // 获取request
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        cn.littleterry.aop.log.Log aopLog = method.getAnnotation(cn.littleterry.aop.log.Log.class);

        // 描述
        if (log != null) {
            log.setLogContent(aopLog.value());
            log.setLogType(2);
            if("用户登录".equals(aopLog.value())){
                log.setLogType(1);
            }
        }

        // 方法路径
        String methodName = joinPoint.getTarget().getClass().getName()+"."+signature.getName()+"()";

        String params = "{";
        //参数值
        Object[] argValues = joinPoint.getArgs();
        //参数名称
        String[] argNames = ((MethodSignature)joinPoint.getSignature()).getParameterNames();
        // 用户名
        String username = "";

        if(argValues != null){
            for (int i = 0; i < argValues.length; i++) {
                params += " " + argNames[i] + ": " + argValues[i];
            }
        }

        // 获取IP地址
        log.setRequestIp(StringUtils.getIP(request));
        log.setRequestMethod(request.getMethod());
        log.setRequestUri(request.getRequestURI());

        if(!LOGINPATH.equals(signature.getName())){
            UserDetails userDetails = SecurityContextHolder.getUserDetails();
            username = userDetails.getUsername();
        } else {
            try {
                JSONObject jsonObject = new JSONObject(argValues[0]);
                username = jsonObject.get("username").toString();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        log.setOperateMethod(methodName);
        log.setOperateId(username);
        log.setRequestParam(params + " }");
        sysLogMapper.insert(log);
    }
}
