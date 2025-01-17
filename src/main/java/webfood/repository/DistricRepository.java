package webfood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import webfood.entity.DistrictEntity;

@Repository
public interface DistricRepository extends JpaRepository<DistrictEntity, Long>{

	@Transactional
	@Modifying
    List<DistrictEntity> findByMaTp(long maTp);

}
