package webfood.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import webfood.entity.CartEntity;
import webfood.entity.CityEntity;
import webfood.entity.CouponEntity;
import webfood.entity.CustomerEntity;
import webfood.entity.DistrictEntity;
import webfood.entity.FeeshipEntity;
import webfood.entity.FoodEntity;
import webfood.entity.OrderDetailEntity;
import webfood.entity.OrderEntity;
import webfood.entity.PaymentEntity;
import webfood.entity.ShippingEntity;
import webfood.entity.WardsEntity;
import webfood.repository.PaymentRepository;
import webfood.service.CityService;
import webfood.service.CouponService;
import webfood.service.DistricService;
import webfood.service.FeeshipService;
import webfood.service.OrderDetailService;
import webfood.service.OrderService;
import webfood.service.PaymentService;
import webfood.service.ShippingService;
import webfood.service.WardsService;

@Controller(value = "checkOutControllerOfWeb")
public class CheckOutController {

	@Autowired
	private CityService cityService;

	@Autowired
	private DistricService districService;

	@Autowired
	private WardsService wardsService;

	@Autowired
	private FeeshipService feeshipService;

	@Autowired
	private ShippingService shippingService;

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private CouponService couponService;

	@RequestMapping(value = "/thu-tuc-thanh-toan", method = RequestMethod.GET)
	public ModelAndView checkOutView(HttpSession session) {
		ModelAndView mav = new ModelAndView("web/checkOut/check_out");
		mav.addObject("list_city", cityService.listAllCities());

		return mav;
	}

	@PostMapping("/thong-tin-van-chuyen")
	public void infoDelivery(HttpServletRequest request, @ModelAttribute("shipping") ShippingEntity shippingEntity,
			HttpSession session, HttpServletResponse respone) throws IOException {

		String address = "";
		FeeshipEntity feeshipEntity = (FeeshipEntity) session.getAttribute("feeship");
		if (feeshipEntity != null) {
			CityEntity cityEntity = cityService.findCityById(feeshipEntity.getCitys().getMaTp());
			DistrictEntity districtEntity = districService.findById(feeshipEntity.getDistricts().getMaQh());
			WardsEntity wardsEntity = wardsService.findById(feeshipEntity.getWards().getXaID());

			address = shippingEntity.getShippingAddress() + ", " + wardsEntity.getNameXaphuong() + ", "
					+ districtEntity.getNameQuanhuyen() + ", " + cityEntity.getNameCity();

		}

		ShippingEntity shippingEntitySession = new ShippingEntity();
		shippingEntitySession.setShippingName(shippingEntity.getShippingName());
		shippingEntitySession.setShippingPhone(shippingEntity.getShippingPhone());
		shippingEntitySession.setShippingAddress(address);
		shippingEntitySession.setShippingEmail(shippingEntity.getShippingEmail());
		shippingEntitySession.setShippingNotes(shippingEntity.getShippingNotes());

		session.setAttribute("shipping", shippingEntitySession);

		respone.sendRedirect(request.getContextPath() + "/thanh-toan");
	}

	@RequestMapping(value = "/thanh-toan", method = RequestMethod.GET)
	public ModelAndView payMent(HttpSession session) {
		ModelAndView mav = new ModelAndView("web/checkOut/payment");
		FeeshipEntity feeshipEntity = (FeeshipEntity) session.getAttribute("feeship");
		mav.addObject("feeship", feeshipEntity);
		/* System.out.println("feeship: "+feeshipEntity.getFeeFeeship()); */

		List<CartEntity> cartItems = (List<CartEntity>) session.getAttribute("cart");

		CouponEntity couponEntity = (CouponEntity) session.getAttribute("coupon");

		mav.addObject("cartItems", cartItems);
		if (couponEntity != null) {
			mav.addObject("coupon", couponEntity);
			System.out.println("coupon; " + couponEntity.getCouponNumber());
		} else {
			mav.addObject("coupon", null);
		}
		return mav;
	}

	@RequestMapping(value = "/calculate-fee", method = RequestMethod.GET)
	public void calculate_fee(HttpServletRequest request, HttpServletResponse respone, HttpSession session,
			@RequestParam(value = "fee_matp") long fee_matp, @RequestParam(value = "fee_maqh") long fee_maqh,
			@RequestParam(value = "fee_xaid") long fee_xaid) {

		System.out.println("city: " + fee_matp);
		System.out.println("district: " + fee_maqh);
		System.out.println("wards: " + fee_xaid);

		FeeshipEntity feeShip = feeshipService.calculateFeeship(fee_matp, fee_maqh, fee_xaid);

		session.setAttribute("feeship", feeShip);
	}

	@RequestMapping(value = "/dat-hang", method = RequestMethod.GET)
	public void order(HttpServletRequest request, HttpServletResponse respone, HttpSession session) throws IOException{

		// Lưu shipping
		ShippingEntity shippingEntity = (ShippingEntity) session.getAttribute("shipping");
		shippingService.saveShipping(shippingEntity);

		// Lưu HT thanh toán
		PaymentEntity paymentEntity = new PaymentEntity();
		paymentEntity.setPaymentMethod("1");
		paymentEntity.setPaymentStatus("0");
		paymentService.savePayment(paymentEntity);

		// Lưu vào order
		String prefix = "TAT";
		Random random = new Random();
		int randomNumber = random.nextInt(90000) + 10000; // Sinh số ngẫu nhiên từ 10000 đến 99999
		String orderCode = prefix + randomNumber;
		OrderEntity order = new OrderEntity();
		order.setOrderCode(orderCode);
		
		CouponEntity couponEntity = (CouponEntity) session.getAttribute("coupon");
		if(couponEntity != null) {
			String coupon_price = String.valueOf(couponEntity.getCouponNumber());
			order.setOrderCoupon(couponEntity.getCouponCode());
			order.setCouponPrice(coupon_price);
		} else {
			order.setOrderCoupon("0");
			order.setCouponPrice("0");
		}
		
		FeeshipEntity feeshipEntity = (FeeshipEntity) session.getAttribute("feeship");
		String feeShip = String.valueOf(feeshipEntity.getFeeFeeship());
		order.setOrderFeeship(feeShip);
		
		CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
		if(customerEntity != null) {
			order.setCustomerId(customerEntity);
		} else {
			CustomerEntity customerEntity2 = new CustomerEntity();
			customerEntity2.setCustomerId((long) 0);
			order.setCustomerId(customerEntity2);
		}
		
		order.setShippingId(shippingEntity);
		order.setPaymentId(paymentEntity);
		order.setOrderStatus(0);
		orderService.saveOrder(order);

		
		// Thêm vào orderDetail
		List<CartEntity> cartEntity = (List<CartEntity>) session.getAttribute("cart");
		for(CartEntity cartEntity2: cartEntity) {
			OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
			orderDetailEntity.setOrderCode(orderCode);
			FoodEntity foodEntity = new FoodEntity();
			foodEntity.setFoodId(cartEntity2.getFood_id());
			orderDetailEntity.setFood(foodEntity);
			orderDetailEntity.setFoodName(cartEntity2.getFood_name());
			double foodPrice = Double.parseDouble(cartEntity2.getFood_price());
			orderDetailEntity.setFoodPrice(foodPrice);
			orderDetailEntity.setFoodSalesQuantity(cartEntity2.getFood_qty());
			orderDetailService.saveOrderDetail(orderDetailEntity);
		}
		
		// Thanh toán khi nhận hàng
		if(paymentEntity.getPaymentMethod() == "1") {
			if(couponEntity == null) {
				session.setAttribute("cart", null);		
			} else {
				couponService.deleteQtyCoupon(couponEntity.getCouponCode());
				session.setAttribute("coupon", null);
				session.setAttribute("cart", null);				
			}
		} else if (paymentEntity.getPaymentMethod() == "2"){
			
		}
		
		
		respone.sendRedirect(request.getContextPath() + "/trang-chu");
 	}

}
