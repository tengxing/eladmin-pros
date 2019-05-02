package cn.littleterry.modules.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @description 系统用户
 * @author terry
 * @since 2018-11-22
 */
@Entity
@Getter
@Setter
@Table(name="sys_user_role")
public class SysUserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    private String roleId;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    @CreationTimestamp
    @Column(name = "create_time")
    private Timestamp createTime;
}
