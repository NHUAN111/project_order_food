package webfood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import webfood.entity.WardsEntity;

@Repository
public interface WardsRepository extends JpaRepository<WardsEntity, Long>{

	@Transactional
	@Modifying
    List<WardsEntity> findByMaQh(long maQh);
}
