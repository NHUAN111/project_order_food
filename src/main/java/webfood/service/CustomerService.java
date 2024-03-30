package webfood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.CustomerEntity;
import webfood.repository.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;

	public CustomerEntity checkLoginCustomer(String name, String pass) {
		return customerRepository.findByCustomerNameAndCustomerPassword(name, pass);
	}

	public CustomerEntity registerCustomer(CustomerEntity customerEntity) {
		return customerRepository.save(customerEntity);
	}
	
	public CustomerEntity checkAccount(String email) {
		return customerRepository.findByCustomerEmail(email);
	}

}
