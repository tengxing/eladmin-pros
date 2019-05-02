package cn.littleterry.modules.security.service;

import cn.littleterry.exception.EntityNotFoundException;
import cn.littleterry.modules.system.domain.Dept;
import cn.littleterry.modules.system.domain.Job;
import cn.littleterry.modules.system.domain.User;
import cn.littleterry.modules.system.service.UserService;
import cn.littleterry.modules.system.domain.*;
import cn.littleterry.exception.EntityNotFoundException;
import cn.littleterry.modules.system.repository.PermissionRepository;
import cn.littleterry.modules.system.repository.RoleRepository;
import cn.littleterry.modules.security.security.JwtUser;
import cn.littleterry.modules.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author terry
 * @date 2018-11-22
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String username){

        User user = userService.findByName(username);
        if (user == null) {
            throw new EntityNotFoundException(User.class, "name", username);
        } else {
            return createJwtUser(user);
        }
    }

    public UserDetails createJwtUser(User user) {
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
