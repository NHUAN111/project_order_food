package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import webfood.entity.OrderEntity;
import webfood.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public List<OrderEntity> listAllOrder() {
		return orderRepository.findAll(sortByIdDesc());
	}

	private Sort sortByIdDesc() {
		return new Sort(Sort.Direction.DESC, "orderId");
	}

	public OrderEntity listOrderDetail(String order_code) {
		OrderEntity orderEntity = orderRepository.findByOrderCode(order_code);
		return orderEntity;
	}
	
	public OrderEntity findById(long order_id) {
		OrderEntity orderEntity = orderRepository.findOne(order_id);
		return orderEntity;
	}
	
	public void cancelOrder(OrderEntity orderEntity) {
		if (orderEntity.getOrderId() != null) {
			orderRepository.save(orderEntity);
		} 
	}
	
	public void deleteOrder(long order_id) {
		orderRepository.delete(order_id);
	}
	
	public void confirmOrder(long order_id, int order_status) {
		OrderEntity orderEntity = orderRepository.findOne(order_id);
		if(orderEntity.getOrderId() != null) {
			if(order_status == 0) {
				orderEntity.setOrderStatus(1);
				orderRepository.save(orderEntity);
			} else if (order_status == 1) {
				orderEntity.setOrderStatus(4);
				orderRepository.save(orderEntity);
			}
		}
		
	}
	
	public void saveOrder(OrderEntity orderEntity) {
		orderRepository.save(orderEntity);
	}
	
}
