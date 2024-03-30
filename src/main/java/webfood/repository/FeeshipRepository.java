package webfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import webfood.entity.FeeshipEntity;

@Repository
public interface FeeshipRepository extends JpaRepository<FeeshipEntity, Long> {

	@Query(value = "SELECT * FROM tbl_fee_ship WHERE fee_matp = :cityId AND fee_maqh = :districtId AND fee_xaid = :wardId", nativeQuery = true)
	FeeshipEntity findByFeeByCityIdAndDistrictIdAndWardId(@Param("cityId") Long cityId, @Param("districtId") Long districtId, @Param("wardId") Long wardId);


}
