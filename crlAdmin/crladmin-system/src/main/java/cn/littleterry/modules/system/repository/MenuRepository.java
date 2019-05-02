package cn.littleterry.modules.system.repository;

import cn.littleterry.modules.system.domain.Menu;
import cn.littleterry.modules.system.domain.Menu;
import cn.littleterry.modules.system.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * @author terry
 * @date 2018-12-17
 */
public interface MenuRepository extends JpaRepository<Menu, Long>, JpaSpecificationExecutor {

    /**
     * findByName
     * @param name
     * @return
     */
    Menu findByName(String name);

    /**
     * findByPid
     * @param pid
     * @return
     */
    List<Menu> findByPid(long pid);

    LinkedHashSet<Menu> findByRoles_IdOrderBySortAsc(Long id);
}
