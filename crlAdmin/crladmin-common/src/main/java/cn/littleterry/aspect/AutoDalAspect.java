package cn.littleterry.aspect;

import cn.littleterry.util.GlobalAuthUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Map;

/**
 * 自动添加实体更新，创建信息切面
 * @author terry
 * @since 23/05/2019
 */
@Aspect
@Component
public class AutoDalAspect {
    private static final Logger logger = LoggerFactory.getLogger(AutoDalAspect.class);

    /**
     * point表达式
     */
    //private static final String POINT_EXPRESS = "@annotation(cn.littleterry.aop.limit.Limit)";
    private static final String POINT_EXPRESS = "execution(* cn.littleterry.modules.*.mapper..*.insert*(..))";

    private static final String CREATOR     = "createBy";
    private static final String MODIFIER    = "updateBy";
    private static final String GMTCREATE   = "createTime";
    private static final String GMTMODIFIED = "updateTime";

    @Pointcut(POINT_EXPRESS)
    public void pointcut() {}

    @Before("pointcut()")
    public void beforeInsert(JoinPoint point) {
        Object[] args = point.getArgs();

        if (args != null && args.length > 0) {
            Object argument = args[0];
            BeanWrapper beanWrapper = new BeanWrapperImpl(argument);
            // 设置创建时间和修改时间
            if (beanWrapper.isWritableProperty(GMTCREATE)) {
                beanWrapper.setPropertyValue(GMTCREATE, Calendar.getInstance().getTime());
            }
            if (beanWrapper.isWritableProperty(GMTMODIFIED)) {
                beanWrapper.setPropertyValue(GMTMODIFIED, Calendar.getInstance().getTime());
            }
            // 设置创建人和修改人
            if (beanWrapper.isWritableProperty(CREATOR) ) {
                beanWrapper.setPropertyValue(CREATOR, GlobalAuthUtils.getCurrentUser());
            }
            if (beanWrapper.isWritableProperty(MODIFIER) ) {
                beanWrapper.setPropertyValue(MODIFIER, GlobalAuthUtils.getCurrentUser());
            }
        }
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Before("pointcut()")
    public void beforeUpdate(JoinPoint jp) {

        Object[] args = jp.getArgs();
        if (args != null && args.length > 0) {
            Object argument = args[0];

            // 如果argument是map类型
            if (argument instanceof Map) {
                Map map = (Map) argument;
                map.put(GMTMODIFIED,  Calendar.getInstance().getTime());
                map.put(MODIFIER, GlobalAuthUtils.getCurrentUser());
            } else {
                BeanWrapper beanWrapper = new BeanWrapperImpl(argument);
                if (beanWrapper.isWritableProperty(GMTMODIFIED)) {
                    beanWrapper.setPropertyValue(GMTMODIFIED,  Calendar.getInstance().getTime());
                }
                if (beanWrapper.isWritableProperty(MODIFIER)) {
                    beanWrapper.setPropertyValue(MODIFIER, GlobalAuthUtils.getCurrentUser());
                }
            }
        }
    }
}



