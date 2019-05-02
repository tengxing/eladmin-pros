package cn.littleterry.modules.system.repository;

import cn.littleterry.modules.system.domain.Role;
import cn.littleterry.modules.system.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Set;

/**
 * @author terry
 * @date 2018-12-03
 */
public interface RoleRepository extends JpaRepository<Role, Long>, JpaSpecificationExecutor {

    /**
     * findByName
     * @param name
     * @return
     */
    Role findByName(String name);

    Set<Role> findByUsers_Id(Long id);

    Set<Role> findByMenus_Id(Long id);
}
