package webfood.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import webfood.entity.OrderEntity;
import webfood.service.OrderDetailService;
import webfood.service.OrderService;

@Controller(value = "orderControllerOfAdmin")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(value = "/admin/order/view-order", method = RequestMethod.GET)
	public ModelAndView viewOrder() {
		ModelAndView mav = new ModelAndView("admin/order/view_order");
		mav.addObject("list_order", orderService.listAllOrder());
		return mav;
	}

	@RequestMapping(value = "/admin/order/view-order-detail", method = RequestMethod.GET)
	public ModelAndView viewOrderDetail(@RequestParam(value = "order_code") String orderCode) {
		ModelAndView mav = new ModelAndView("admin/order/view_detail_order");

		mav.addObject("order_byId", orderService.listOrderDetail(orderCode));

		mav.addObject("order_detail", orderDetailService.listOrderDetailById(orderCode));
		return mav;
	}

	@RequestMapping(value = "/admin/order/cancel-order", method = RequestMethod.GET)
	public void cancelOrder(@RequestParam(value = "order_id") Long orderId, HttpServletRequest request, Model model,
			HttpServletResponse respone) throws IOException {
		OrderEntity orderEntity = orderService.findById(orderId);
		orderEntity.setOrderStatus(3);
		orderService.cancelOrder(orderEntity);
		model.addAttribute("successMessage", "Thêm món thành công");
		respone.sendRedirect(request.getContextPath() + "/admin/order/view-order");

	}
	
	@RequestMapping(value = "/admin/order/delete-order", method = RequestMethod.GET)
	public void deleteOrder(@RequestParam(value = "order_id") long orderId, HttpServletRequest request, 
			HttpServletResponse respone) throws IOException {
		
		orderService.deleteOrder(orderId);
		respone.sendRedirect(request.getContextPath() + "/admin/order/view-order");
	}
	
	@RequestMapping(value = "/admin/order/confirm-order", method = RequestMethod.GET)
	public void confirmOrder(@RequestParam(value = "order_id") long orderId,
			@RequestParam(value = "order_status") int orderStatus,
			HttpServletRequest request,
			HttpServletResponse respone) throws IOException {
		
		orderService.confirmOrder(orderId, orderStatus);
		
		respone.sendRedirect(request.getContextPath() + "/admin/order/view-order");
	}

}
