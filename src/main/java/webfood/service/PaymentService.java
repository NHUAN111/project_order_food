package webfood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.PaymentEntity;
import webfood.repository.PaymentRepository;

@Service
public class PaymentService {
	@Autowired
	private PaymentRepository paymentRepository;
	
	public void savePayment(PaymentEntity paymentEntity) {
		paymentRepository.save(paymentEntity);
	}
}
