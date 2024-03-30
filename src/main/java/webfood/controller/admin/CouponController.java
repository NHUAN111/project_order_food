package webfood.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.CouponEntity;
import webfood.service.CouponService;

@Controller(value = "couponControllerOfAdmin")
public class CouponController {

	@Autowired
	private CouponService couponService;

	@RequestMapping(value = "/admin/coupon/list-coupon", method = RequestMethod.GET)
	public ModelAndView listCoupon() {
		ModelAndView mav = new ModelAndView("admin/coupon/list_coupon");
		mav.addObject("list_coupon", couponService.listCoupons());
		return mav;
	}

	@RequestMapping(value = "/admin/coupon/add-coupon", method = RequestMethod.GET)
	public ModelAndView addCoupon() {
		ModelAndView mav = new ModelAndView("admin/coupon/add_coupon");
		return mav;
	}

	@PostMapping("/admin/coupon/save-coupon")
	public String saveCoupon(@ModelAttribute("couponModel") CouponEntity couponEntity) {
		couponService.saveCoupon(couponEntity);
		return "redirect:/admin/coupon/list-coupon";
	}

	@RequestMapping(value = "/admin/coupon/delete-coupon", method = RequestMethod.GET)
	public String deleteCoupon(@RequestParam("coupon_id") long coupon_id) {
		couponService.deleteCoupon(coupon_id);
		return "redirect:/admin/coupon/list-coupon";
	}

	@RequestMapping(value = "/admin/coupon/edit-coupon", method = RequestMethod.GET)
	public ModelAndView editCoupon(@RequestParam("coupon_id") long coupon_id) {
		ModelAndView mav = new ModelAndView("admin/coupon/edit_coupon");
		mav.addObject("detail_coupon", couponService.editCoupon(coupon_id));
		return mav;
	}

	@PostMapping("/admin/coupon/update-coupon")
	public String updateCategory(@ModelAttribute("couponModel") CouponEntity couponEntity,
			@RequestParam("couponId") long coupon_id) {
		couponService.updateCoupon(couponEntity);
		return "redirect:/admin/coupon/list-coupon";
	}

}
