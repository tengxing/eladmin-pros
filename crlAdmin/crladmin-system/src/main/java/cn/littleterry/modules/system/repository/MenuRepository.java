package cn.littleterry.modules.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.LinkedHashSet;
import java.util.List;

/**
 * @author terry
 * @since 2018-12-17
 */
public interface MenuRepository extends JpaRepository<Menu, Long> {

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
