package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.CityEntity;
import webfood.repository.CityRepository;

@Service
public class CityService {
	@Autowired
	private CityRepository cityRepository;
	
	public List<CityEntity> listAllCities(){
		return cityRepository.findAll();
	}
	
	public CityEntity findCityById(long id_city) {
		return cityRepository.findOne(id_city);
	}
}
