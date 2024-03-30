package webfood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.ShippingEntity;
import webfood.repository.ShippingRepository;

@Service
public class ShippingService {
	@Autowired
	private ShippingRepository shippingRepository;
	
	public void saveShipping(ShippingEntity shippingEntity) {
		shippingRepository.save(shippingEntity);
	}
}
