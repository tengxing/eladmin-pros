package cn.littleterry.modules.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Set;

/**
* @author terry
* @since 2019-03-25
*/
public interface DeptRepository extends JpaRepository<Dept, Long> {

    /**
     * findByPid
     * @param id
     * @return
     */
    List<Dept> findByPid(Long id);

    Set<Dept> findByRoles_Id(Long id);
}