package cn.littleterry.modules.sys.util;

import cn.littleterry.util.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author terry
 * @since 07/05/2019
 */
public class GlobalUserUtils {

    String getCurrentUsername(){
        UserDetails userDetails = SecurityContextHolder.getUserDetails();
        return userDetails.getUsername();
    }
}
