package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.CityEntity;
import webfood.entity.DistrictEntity;
import webfood.entity.FeeshipEntity;
import webfood.entity.WardsEntity;
import webfood.repository.CityRepository;
import webfood.repository.DistricRepository;
import webfood.repository.FeeshipRepository;
import webfood.repository.WardsRepository;

@Service
public class FeeshipService {
	@Autowired
	private FeeshipRepository feeshipRepository;
	
	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private DistricRepository districRepository;
	
	@Autowired
	private WardsRepository wardsRepository;
	
	public List<FeeshipEntity> listAllFeeShip(){
		return feeshipRepository.findAll();
	}

	public List<CityEntity> listAllCity(){
		return cityRepository.findAll();
	}
	
	public void saveFeeShip(FeeshipEntity feeshipEntity) {
		feeshipRepository.save(feeshipEntity);
	}
	
	public void deleteFeeship(long id) {
		feeshipRepository.delete(id);
	}
	
	public FeeshipEntity editFeeship(long id) {
		return feeshipRepository.findOne(id);
	}
	
	public void updateFeeship(FeeshipEntity feeshipEntity) {
		feeshipRepository.save(feeshipEntity);
	}
	
	public FeeshipEntity calculateFeeship(long cityId, long districtId, long wardId) {
		FeeshipEntity feeshipEntity = feeshipRepository.findByFeeByCityIdAndDistrictIdAndWardId(cityId, districtId, wardId);
		if(feeshipEntity != null) {
			return feeshipEntity;
		}
		FeeshipEntity feeshipEntityNotFeeship = new FeeshipEntity();
		CityEntity cityEntity = cityRepository.findOne(cityId);
		DistrictEntity districtEntity = districRepository.findOne(districtId);
		WardsEntity wardsEntity = wardsRepository.findOne(wardId);
		
		feeshipEntityNotFeeship.setCitys(cityEntity);
		feeshipEntityNotFeeship.setDistricts(districtEntity);
		feeshipEntityNotFeeship.setWards(wardsEntity);
		feeshipEntityNotFeeship.setFeeFeeship(25000);
		
		return feeshipEntityNotFeeship;
	}
}
