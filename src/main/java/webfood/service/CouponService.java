package webfood.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.CouponEntity;
import webfood.repository.CouponRepository;

@Service
public class CouponService {
	@Autowired
	private CouponRepository couponRepository;
	
	public List<CouponEntity> listCoupons(){
		return couponRepository.findAll();
	}
	
	public void saveCoupon(CouponEntity couponEntity) {
		couponRepository.save(couponEntity);
	}
	
	public void deleteCoupon(long coupon_id) {
		couponRepository.delete(coupon_id);
	}
	
	public CouponEntity editCoupon(long coupon_id) {
		return couponRepository.findOne(coupon_id);
	}
	
	public void updateCoupon(CouponEntity couponEntity) {
		couponRepository.save(couponEntity);
	}
	
	public CouponEntity checkCoupon(String couponCode) {
		CouponEntity couponEntity = couponRepository.findByCouponCode(couponCode);
		
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate couponEnd = LocalDate.parse(couponEntity.getCouponEnd(), formatter);
		
		if (couponEntity.getCouponQty() > 0 && couponEnd.isAfter(currentDate)) {
			return couponEntity;
		}
		
		return null;
	}
	
	public void deleteQtyCoupon(String couponCode) {
		CouponEntity couponEntity = couponRepository.findByCouponCode(couponCode);
		if(couponCode != null) {
			couponEntity.setCouponQty(couponEntity.getCouponQty() - 1);
			couponRepository.save(couponEntity);
		}
	}
}
