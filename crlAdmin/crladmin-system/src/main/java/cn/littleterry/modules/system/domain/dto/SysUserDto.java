package cn.littleterry.modules.system.domain.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author tengxing
 * @since 29/04/2019
 */
@Data
public class SysUserDto implements Serializable {
        private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long id;

    /**
     * 登录账号
     */
    private String username;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 密码
     */
    private String password;

    /**
     * md5密码盐
     */
    /*private String salt;
*/
    /**
     * 头像
     */
    private String avatar;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 性别（1：男 2：女）
     */
    private Integer sex;

    /**
     * 电子邮件
     */
    private String email;

    /**
     * 电话
     */
    private String phone;
}
