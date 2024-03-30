package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.DistrictEntity;
import webfood.entity.WardsEntity;
import webfood.repository.WardsRepository;

@Service
public class WardsService {
	@Autowired
	private WardsRepository wardsRepository;

	public List<WardsEntity> listAllWards() {
		return wardsRepository.findAll();
	}

	public List<WardsEntity> findEntitiesByIds(long maQh) {
		return wardsRepository.findByMaQh(maQh);
	}
	
	public WardsEntity findById(long xaId) {
		return wardsRepository.findOne(xaId);
	}
}
