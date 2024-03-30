package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.repository.CityRepository;
import webfood.repository.DistricRepository;
import webfood.entity.CityEntity;
import webfood.entity.DistrictEntity;

@Service
public class DistricService {
	@Autowired
	private DistricRepository districRepository;

	public List<DistrictEntity> listDistrict(){
		List<DistrictEntity> districtEntities = districRepository.findAll();
		return districtEntities;
	}

    public List<DistrictEntity> findEntitiesByIds(long maTp) {
        return districRepository.findByMaTp(maTp);
    }
    
    public DistrictEntity findById(long maQh) {
    	return districRepository.findOne(maQh);
    }
}
