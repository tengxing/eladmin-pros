package cn.littleterry.modules.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

/**
 * @author terry
 * @since 2018-12-03
 */
public interface PermissionRepository extends JpaRepository<Permission, Long> {

    /**
     * findByName
     * @param name
     * @return
     */
    Permission findByName(String name);

    /**
     * findByPid
     * @param pid
     * @return
     */
    List<Permission> findByPid(long pid);

    Set<Permission> findByRoles(Set<Role> roles);
}
