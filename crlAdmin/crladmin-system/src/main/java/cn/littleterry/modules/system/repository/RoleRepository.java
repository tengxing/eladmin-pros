package cn.littleterry.modules.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Set;

/**
 * @author terry
 * @since 2018-12-03
 */
public interface RoleRepository extends JpaRepository<Role, Long> {

    /**
     * findByName
     * @param name
     * @return
     */
    Role findByName(String name);

    Set<Role> findByUsers_Id(Long id);

    Set<Role> findByMenus_Id(Long id);
}
