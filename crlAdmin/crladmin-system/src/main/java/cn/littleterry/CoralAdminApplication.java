package cn.littleterry;

import cn.littleterry.util.SpringContextHolder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;

import java.util.Optional;

/**
 * @author terry
 * @since 2018/11/15 9:20:19
 */
@SpringBootApplication
@EnableTransactionManagement
@EnableWebSocketMessageBroker
//@ImportResource(locations= {"classpath:reload.xml"})
public class CoralAdminApplication {
    private static final Logger logger = LoggerFactory.getLogger(CoralAdminApplication.class);
    public static void main(String[] args) {

        Long a = 1L;
        try {
            a=a+1L;
        }catch (Exception e){
            logger.error(a.toString() + "_" + e.getMessage(), e);
        }
        SpringApplication.run(CoralAdminApplication.class, args);
    }

    @Bean
    public SpringContextHolder springContextHolder() {
        return new SpringContextHolder();
    }
}
