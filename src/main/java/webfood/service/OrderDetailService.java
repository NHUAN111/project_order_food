package webfood.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.OrderDetailEntity;
import webfood.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	public List<OrderDetailEntity> listOrderDetailById(String orderCode){
		return orderDetailRepository.findByOrderCode(orderCode);
	}
	
	public void saveOrderDetail(OrderDetailEntity orderDetailEntity) {
		orderDetailRepository.save(orderDetailEntity);
	}
}
