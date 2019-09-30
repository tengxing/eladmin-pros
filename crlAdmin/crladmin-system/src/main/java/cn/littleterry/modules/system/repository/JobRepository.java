package cn.littleterry.modules.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

/**
* @author terry
* @since 2019-03-29
*/
public interface JobRepository extends JpaRepository<Job, Long> {
}