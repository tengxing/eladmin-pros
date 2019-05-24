package cn.littleterry.util;

import cn.littleterry.exception.BadRequestException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Security
 *
 * @author terry
 * @since 2019-01-17
 */
public class SecurityContextHolder {
    private static Logger logger = LoggerFactory.getLogger(SecurityContextHolder.class);

    /**
     * 获取用户信息，如果是shiro，改写即可
     * @return
     */
    public static UserDetails getUserDetails() {
        UserDetails userDetails = null;
        try {
            userDetails = (UserDetails) org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            throw new BadRequestException(HttpStatus.UNAUTHORIZED, "登录状态过期");
        }
        return userDetails;
    }
}
