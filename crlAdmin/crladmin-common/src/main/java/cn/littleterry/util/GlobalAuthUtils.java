package cn.littleterry.util;

import java.util.Optional;

/**
 * GlobalAuthUtils
 * @author terry
 * @since 23/05/2019
 */
public class GlobalAuthUtils {
    public static String getCurrentUser(){
        return Optional.ofNullable(SecurityContextHolder.getUserDetails().getUsername()).orElse("非法用户");
    }
}
