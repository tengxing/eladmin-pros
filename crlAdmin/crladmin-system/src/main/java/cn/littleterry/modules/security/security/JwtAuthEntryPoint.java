package cn.littleterry.modules.security.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;

/**
 * 未认证处理
 * @author terry
 * @since 2018-11-30
 */
@Component
public class JwtAuthEntryPoint implements AuthenticationEntryPoint, Serializable {
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthEntryPoint.class);
    private static final long serialVersionUID = -8970718410437077606L;

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
        /**
         * 用户没有提供凭据访问REST资源访 发送401响应
         */
        logger.error("Unauthorized error. Message - {}", authException.getMessage());
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Error -> Unauthorized");
    }
}
