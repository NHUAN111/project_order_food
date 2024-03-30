package webfood.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.CartEntity;
import webfood.entity.CategoryEntity;
import webfood.entity.CouponEntity;
import webfood.entity.FeeshipEntity;
import webfood.entity.FoodEntity;
import webfood.service.CouponService;

@Controller(value = "cartControllerOfWeb")
public class CartController {
	@Autowired
	private CouponService couponService;
	
	
	@RequestMapping(value = "/gio-hang-cua-ban", method = RequestMethod.GET)
	public ModelAndView viewCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("web/cart/cart_customer");
		List<CartEntity> cartItems = (List<CartEntity>) session.getAttribute("cart");
		
		CouponEntity couponEntity = (CouponEntity) session.getAttribute("coupon");
		
		mav.addObject("cartItems", cartItems);		
		if(couponEntity != null) {
			mav.addObject("coupon", couponEntity);
			System.out.println("coupon; "+couponEntity.getCouponNumber());			
		} else {
			mav.addObject("coupon", null);
		}
		return mav;
	}

	@RequestMapping(value = "/them-san-pham", method = RequestMethod.POST)
	public void addCart(HttpServletRequest request, HttpServletResponse respone,
			@ModelAttribute("food") FoodEntity foodEntity, HttpSession session) throws IOException {

		System.out.println("ID FOOD: " + foodEntity.getFoodId());
		List<CartEntity> listCartEntities = (List<CartEntity>) session.getAttribute("cart");
		if (listCartEntities == null) {
			listCartEntities = new ArrayList<>();
			CartEntity cartEntity = new CartEntity();
			cartEntity.setFood_id(foodEntity.getFoodId());
			cartEntity.setFood_img(foodEntity.getFoodImg());
			cartEntity.setFood_name(foodEntity.getFoodName());
			cartEntity.setFood_price(foodEntity.getFoodPrice());
			cartEntity.setFood_qty(1);
			listCartEntities.add(cartEntity);
			session.setAttribute("cart", listCartEntities);

		} else {
			// Kiểm tra sản phẩm tồn tại chưa, nếu có thì + 1 SL
			boolean check = false;
			for (CartEntity cartEntity : listCartEntities) {
				if (cartEntity.getFood_id().equals(foodEntity.getFoodId())) {
					cartEntity.setFood_qty(cartEntity.getFood_qty() + 1);
					check = true;
					break;
				}
			}
			if (check == false) {
				CartEntity cartItem = new CartEntity();
				cartItem.setFood_id(foodEntity.getFoodId());
				cartItem.setFood_img(foodEntity.getFoodImg());
				cartItem.setFood_name(foodEntity.getFoodName());
				cartItem.setFood_price(foodEntity.getFoodPrice());
				cartItem.setFood_qty(1);
				listCartEntities.add(cartItem);
			}
			session.setAttribute("cart", listCartEntities);
		}

		respone.sendRedirect(request.getContextPath() + "/trang-chu");
	}

	@RequestMapping(value = "/xoa-san-pham", method = RequestMethod.GET)
	public void deleteCart(HttpSession session, HttpServletRequest request, HttpServletResponse respone,
			@RequestParam(value = "food_id", required = false) long food_id) throws IOException {
		List<CartEntity> listCartEntities = (List<CartEntity>) session.getAttribute("cart");

		for (CartEntity caEntity : listCartEntities) {
			if (caEntity.getFood_id().equals(food_id)) {
				listCartEntities.remove(caEntity);
				session.setAttribute("cart", listCartEntities);
				break;
			}
		}
		respone.sendRedirect(request.getContextPath() + "/gio-hang-cua-ban");
	}

	@RequestMapping(value = "/cap-nhat-gio-hang", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> updateCart(HttpSession session, HttpServletRequest request, HttpServletResponse response,
	        @RequestParam(value = "food_id") long food_id, @RequestParam(value = "food_qty") int food_qty)
	        throws IOException {
	    List<CartEntity> listCartEntities = (List<CartEntity>) session.getAttribute("cart");

	    int price_food = 0;
	    int total = 0;
	    int coupon_price = 0;

	    for (CartEntity caEntity : listCartEntities) {
	        if (caEntity.getFood_id().equals(food_id)) {
	            caEntity.setFood_qty(food_qty);
	        }
	        price_food += caEntity.getFood_qty() * Integer.parseInt(caEntity.getFood_price());
	    }
	    total += price_food;

	    // Lấy giá trị của coupon và feeship từ session
	    CouponEntity couponEntity = (CouponEntity) session.getAttribute("coupon");
	    FeeshipEntity feeshipEntity = (FeeshipEntity) session.getAttribute("feeship");

	    
	    if (couponEntity != null && feeshipEntity == null) { // TH1: TH này là chỉ ở giỏ hàng
	        if (couponEntity.getCouponCondition() == 1) {
	            coupon_price = total * couponEntity.getCouponNumber() / 100;
	            total -= coupon_price;
	        } else if (couponEntity.getCouponCondition() == 2) {
	        	coupon_price = couponEntity.getCouponNumber();
	            total -= couponEntity.getCouponNumber();
	        }
	    } else if (couponEntity != null && feeshipEntity != null) { // TH2: TH này là đã đến thanh toán
	    	if (couponEntity.getCouponCondition() == 1) {
	    		 coupon_price = (total * couponEntity.getCouponNumber()) / 100;
		         total = (total - coupon_price) + feeshipEntity.getFeeFeeship();
	        } else if (couponEntity.getCouponCondition() == 2) {
	        	coupon_price = couponEntity.getCouponNumber();
	            total = (total - couponEntity.getCouponNumber()) + feeshipEntity.getFeeFeeship();
	        }
	    } else if (couponEntity == null && feeshipEntity != null) { // TH3: TH này là đã đến thanh toán
	    	total += feeshipEntity.getFeeFeeship();
	    } else if (couponEntity == null && feeshipEntity == null) { // TH4: TH này là chỉ ở giỏ hàng
	    	total = total;
	    }

	    // Lưu giá mới của sản phẩm vào session
	    session.setAttribute("cart", listCartEntities);
	    

	    Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("price", price_food);
	    responseMap.put("total", total);
	    responseMap.put("coupon_price", coupon_price);
	    return responseMap;
	}


	@RequestMapping(value = "/kiem-tra-ma-giam", method = RequestMethod.POST)
	public void checkCoupon(HttpSession session, HttpServletRequest request, HttpServletResponse respone,
			@ModelAttribute("coupon") CouponEntity cEntity) throws IOException {
		
		CouponEntity couponEntity = couponService.checkCoupon(cEntity.getCouponCode());
		
		if(couponEntity != null) {
			session.setAttribute("coupon", couponEntity);	
			session.setMaxInactiveInterval(300);
		} else {
			session.setAttribute("coupon", null);
		}

		respone.sendRedirect(request.getContextPath() + "/gio-hang-cua-ban");
	}
	
}
