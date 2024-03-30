package webfood.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import webfood.entity.CategoryEntity;
import webfood.entity.CouponEntity;
import webfood.entity.CustomerEntity;
import webfood.entity.FoodEntity;
import webfood.entity.OrderDetailEntity;
import webfood.entity.OrderEntity;
import webfood.entity.SlideEntity;
import webfood.repository.CategoryRepository;
import webfood.repository.CouponRepository;
import webfood.repository.FoodRepository;
import webfood.repository.OrderDetailRepository;
import webfood.repository.OrderRepository;
import webfood.repository.SlideRepository;

@Service
public class HomeService {
	@Autowired
	private SlideRepository slideRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private CouponRepository couponRepository;

	@Autowired
	private FoodRepository foodRepository;

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Autowired
	private OrderRepository orderRepository;

	public List<SlideEntity> listAllSlider() {
		return slideRepository.findAll();
	}

	public List<CategoryEntity> listAllCategory() {
		return categoryRepository.findByCategoryStatus(0);
	}

	public List<CouponEntity> listAllCoupon() {
		List<CouponEntity> listEntities = couponRepository.findAll();
		List<CouponEntity> validCoupons = new ArrayList<>();

		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		for (CouponEntity couponEntity : listEntities) {
			LocalDate couponEnd = LocalDate.parse(couponEntity.getCouponEnd(), formatter);
			if (couponEnd.isAfter(currentDate) && couponEntity.getCouponQty() > 0) {
				validCoupons.add(couponEntity);
			}
		}
		return validCoupons;
	}

	private Sort sortByIdDesc() {
		return new Sort(Sort.Direction.DESC, "foodId");
	}

	// Các sản phẩm không giảm giá
	public List<FoodEntity> listAllFood() {
		List<FoodEntity> foodNotSale = new ArrayList<>();
		
		List<FoodEntity> foodEntities = foodRepository.findAll(sortByIdDesc());
		
		for(FoodEntity foodEntity: foodEntities) {
			if(foodEntity.getFoodCondition() == 0) {
				foodNotSale.add(foodEntity);
			}
		}
		
		if (foodNotSale.size() > 5) {
			return foodNotSale.subList(5, Math.min(foodNotSale.size(), 15));
		} else {
			return foodNotSale;
		}
	}

	public List<FoodEntity> listFoodNew() {
		List<FoodEntity> foodNotSale = new ArrayList<>();

		List<FoodEntity> foodEntities = foodRepository.findAll(sortByIdDesc());
		for (FoodEntity food : foodEntities) {
			if (food.getFoodCondition() == 0) {
				foodNotSale.add(food);
			}
		}
		return foodNotSale.subList(0, Math.min(foodNotSale.size(), 5));
	}

	public List<FoodEntity> listFoodSale() {
		List<FoodEntity> lFoodEntities = foodRepository.findAll();
		List<FoodEntity> listFoodSale = new ArrayList<>();

		for (FoodEntity foodEntity : lFoodEntities) {
			if ((foodEntity.getFoodCondition() == 1 || foodEntity.getFoodCondition() == 2)) {
				listFoodSale.add(foodEntity);
			}
		}
		return listFoodSale.subList(0, Math.min(lFoodEntities.size(), 6));
	}
	/*
	 * public List<Long> listFoodIdBest(){ List<OrderDetailEntity> }
	 * 
	 * public List<FoodEntity> listFoodBestseller() {
	 * 
	 * }
	 */

	private Sort sortByOrderIdDesc() {
		return new Sort(Sort.Direction.DESC, "orderId");
	}

	public List<OrderEntity> listAllOrder(long customer_id) {
		List<OrderEntity> orderEntity = orderRepository.findAll(sortByOrderIdDesc());
		List<OrderEntity> orderEntities = new ArrayList<>();

		for (OrderEntity orderEntity2 : orderEntity) {
			if (orderEntity2.getCustomerId().getCustomerId() == customer_id) {
				if (orderEntity != null) {
					orderEntities.add(orderEntity2);
				} else {
					orderEntities.add(null);
				}
			}
		}
		return orderEntities;
	}

}
