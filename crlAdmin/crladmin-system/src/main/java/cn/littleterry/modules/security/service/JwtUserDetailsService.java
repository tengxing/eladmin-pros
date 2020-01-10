package cn.littleterry.modules.security.service;

import cn.littleterry.exception.EntityNotFoundException;
import cn.littleterry.modules.security.security.JwtUser;
import cn.littleterry.modules.system.repository.Dept;
import cn.littleterry.modules.system.repository.Job;
import cn.littleterry.modules.system.repository.User;
import cn.littleterry.modules.system.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * @author terry
 * @since 2018-11-22
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class JwtUserDetailsService implements UserDetailsService {
    private Logger logger = LoggerFactory.getLogger(getClass());


    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String username){
        logger.info("用户的用户名: {}", username);
        User user = userRepository.findByUsername(username);;
        Optional.ofNullable(user).orElseThrow(() -> new EntityNotFoundException(User.class, "用户", username));
        return buildJwtUser(user);
    }

    public UserDetails buildJwtUser(User user) {
        return new JwtUser(
                user.getId(),
                user.getUsername(),
                user.getPassword(),
                user.getAvatar(),
                user.getEmail(),
                user.getPhone(),
                Optional.ofNullable(user.getDept()).map(Dept::getName).orElse(null),
                Optional.ofNullable(user.getJob()).map(Job::getName).orElse(null),
                permissionService.mapToGrantedAuthorities(user),
                user.getEnabled(),
                user.getCreateTime(),
                user.getLastPasswordResetTime()
        );
    }
}
