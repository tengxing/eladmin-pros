package cn.littleterry.modules.system.repository;

import cn.littleterry.modules.system.domain.Dept;
import cn.littleterry.modules.system.domain.Dept;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Set;

/**
* @author terry
* @date 2019-03-25
*/
public interface DeptRepository extends JpaRepository<Dept, Long>, JpaSpecificationExecutor {

    /**
     * findByPid
     * @param id
     * @return
     */
    List<Dept> findByPid(Long id);

    Set<Dept> findByRoles_Id(Long id);
}