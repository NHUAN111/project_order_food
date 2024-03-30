package webfood.controller.web;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.CartEntity;
import webfood.entity.CustomerEntity;
import webfood.entity.OrderEntity;
import webfood.service.CustomerService;
import webfood.service.FoodService;
import webfood.service.HomeService;
import webfood.service.OrderDetailService;
import webfood.service.OrderService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private HomeService homeService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private FoodService foodService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView viewHome(HttpSession session) {
		ModelAndView mav = new ModelAndView("web/home");
		mav.addObject("slider_model", homeService.listAllSlider());
		mav.addObject("category_model", homeService.listAllCategory());
		mav.addObject("coupon_model", homeService.listAllCoupon());
		mav.addObject("food_model", homeService.listAllFood());
		mav.addObject("food_sale", homeService.listFoodSale());
		mav.addObject("food_new", homeService.listFoodNew());
		

		String name = (String) session.getAttribute("customer_name");
		System.out.println("Session: " + name);
	

//		mav.addObject("food_best_seller", homeService.listFoodBestseller());
		return mav;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("web/LoginAndRegister/login");
		return mav;
	}

	@PostMapping("/kiem-tra-dang-nhap")
	public void loginCheck(@ModelAttribute("customer") CustomerEntity customerEntity, HttpServletRequest request,
			@RequestParam(value = "remember", required = false) String remember, HttpServletResponse respone,
			HttpSession session) throws IOException {
		System.out.println(customerEntity.getCustomerPassword());

		CustomerEntity customer = customerService.checkLoginCustomer(customerEntity.getCustomerName(),
				generateMD5(customerEntity.getCustomerPassword()));
		if (customer != null) {
			if (remember == "on") {
				System.out.println("ok");
				session.setAttribute("customer", customer);
				Cookie cookie = new Cookie("customer_name", customer.getCustomerName());
				cookie.setMaxAge(3600);
				respone.addCookie(cookie);
				respone.sendRedirect(request.getContextPath() + "/trang-chu");
			} else {
				session.setAttribute("customer", customer);
				respone.sendRedirect(request.getContextPath() + "/trang-chu");
			}
		} else {
			System.out.println("fail");
			respone.sendRedirect(request.getContextPath() + "/dang-nhap");
		}

	}

	@RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
	public void logOut(HttpServletRequest request,
			@CookieValue(name = "customer_name", defaultValue = "Guest") String customer_name,
			HttpServletResponse respone, HttpSession session) throws IOException {
		Cookie cookie = new Cookie("customer_name", null);
		cookie.setMaxAge(0);
		respone.addCookie(cookie);

		HttpSession sessions = request.getSession(false); // Không tạo mới session nếu không tồn tại
		if (sessions != null) {
			sessions.invalidate(); // Xóa session
		}

		respone.sendRedirect(request.getContextPath() + "/trang-chu");
	}

	@PostMapping("/them-dang-ky")
	public void addRegister(HttpServletRequest request, String remember, HttpServletResponse respone,
			HttpSession session, @ModelAttribute("customerRegister") CustomerEntity customerEntity) throws IOException {
		System.out.println(customerEntity.getCustomerName());

		CustomerEntity customerRegister = new CustomerEntity();
		customerRegister.setCustomerPassword(generateMD5(customerEntity.getCustomerPassword()));
		customerRegister.setCustomerName(customerEntity.getCustomerName());
		customerRegister.setCustomerEmail(customerEntity.getCustomerEmail());
		customerRegister.setCustomerPhone(customerEntity.getCustomerPhone());
		customerService.registerCustomer(customerRegister);

		// Check account
		CustomerEntity customer = customerService.checkAccount(customerEntity.getCustomerEmail());

		if (customer != null) {
			if (remember == "on") {
				Cookie cookie = new Cookie("customer_name", customerEntity.getCustomerName());
				cookie.setMaxAge(3600);
				respone.addCookie(cookie);
			}
			session.setAttribute("customer", customerEntity);
			respone.sendRedirect(request.getContextPath() + "/trang-chu");
		} else {
			respone.sendRedirect(request.getContextPath() + "/dang-ky");
		}
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("web/LoginAndRegister/register");
		return mav;
	}
	
	
	public static String generateMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] hashInBytes = md.digest(input.getBytes(StandardCharsets.UTF_8));
			StringBuilder stringBuilder = new StringBuilder();
			for (byte b : hashInBytes) {
				stringBuilder.append(String.format("%02x", b));
			}

			return stringBuilder.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/chi-tiet", method = RequestMethod.GET)
	public ModelAndView chiTiet(@RequestParam(value = "food_id", required = false) long food_id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/detail");
		mav.addObject("food_detail", foodService.findOne(food_id));
		mav.addObject("food_similarly", foodService.foodSimilarly(food_id));
		return mav;
	}
	
	@RequestMapping(value = "/thuc-don", method = RequestMethod.GET)
	public ModelAndView thuDonMon() {
		ModelAndView mav = new ModelAndView("web/menu");
		mav.addObject("category_model", homeService.listAllCategory());
		mav.addObject("food_model", homeService.listAllFood());
		return mav;
	}
	
	@RequestMapping(value = "/thong-tin-don-hang", method = RequestMethod.GET)
	public ModelAndView donDaDat(HttpSession session) {
		ModelAndView mav = new ModelAndView("web/order/info_order");
		CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("customer");
		mav.addObject("all_orders", homeService.listAllOrder(customerEntity.getCustomerId()));
		return mav;
	}
	
	@RequestMapping(value = "/huy-don-hang", method = RequestMethod.GET)
	public void cancelOrder(@RequestParam(value = "order_id") Long orderId, HttpServletRequest request,
			HttpServletResponse respone) throws IOException {
		OrderEntity orderEntity = orderService.findById(orderId);
		orderEntity.setOrderStatus(2);
		orderService.cancelOrder(orderEntity);
		respone.sendRedirect(request.getContextPath() + "/thong-tin-don-hang");
	}
	
	@RequestMapping(value = "/xoa-don-hang", method = RequestMethod.GET)
	public void deleteOrder(@RequestParam(value = "order_id") Long orderId, HttpServletRequest request,
			HttpServletResponse respone) throws IOException {
		orderService.deleteOrder(orderId);
		respone.sendRedirect(request.getContextPath() + "/thong-tin-don-hang");
	}
	
	@RequestMapping(value = "/chi-tiet-don-hang", method = RequestMethod.GET)
	public ModelAndView detailOrder(@RequestParam(value = "order_code") String orderCode) {
			ModelAndView mav = new ModelAndView("web/order/detail_order");
			
			mav.addObject("order_byId", orderService.listOrderDetail(orderCode));
			
			mav.addObject("order_detail", orderDetailService.listOrderDetailById(orderCode));
		return mav;
	}
	
	@RequestMapping(value = "/kiem-tra-don-hang", method = RequestMethod.GET)
	public ModelAndView kiemTraDon() {
		ModelAndView mav = new ModelAndView("web/order/check_order");
		
		return mav;
	}
	
	@RequestMapping(value = "/count-cart", method = RequestMethod.GET)
	@ResponseBody
	public int countCart(HttpServletResponse respone, HttpSession session) {
		List<CartEntity> cartItems = (List<CartEntity>) session.getAttribute("cart");
		
		if(cartItems.size() > 0) {
			return cartItems.size();
		} else {
			return cartItems.size();
		}
	}
}
















