package cn.littleterry.modules.sys.util;


import cn.littleterry.modules.sys.entity.SysMenu;
import cn.littleterry.modules.sys.entity.dto.TreeModel;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;

import java.util.Calendar;

/**
 * @author tengxing
 * @since 09/05/2019
 */
public class BeanCopyUtils<T> {
    private static final Logger logger = LoggerFactory.getLogger(BeanCopyUtils.class);

    public static <T> T copy(Object orig, Class<T> clazz){
        T target =null;
        try {
            target = clazz.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        try {
            BeanUtils.copyProperties(orig,target);
        }catch (BeansException e){
            logger.error("拷贝失败->"+e.getMessage(),e);
        }
        return target;
    }
    public static void main(String[] args){
        SysMenu sysMenu = new SysMenu();
        sysMenu.setId(1L);
        sysMenu.setName("coral");
        sysMenu.setCreateTime(Calendar.getInstance().getTime());
        System.out.println(JSON.toJSONString(copy(sysMenu,TreeModel.class)));
    }
}
