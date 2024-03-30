package webfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import webfood.entity.CouponEntity;

@Repository
public interface CouponRepository extends JpaRepository<CouponEntity, Long>{
	CouponEntity findByCouponCode(String couponCode);
}
