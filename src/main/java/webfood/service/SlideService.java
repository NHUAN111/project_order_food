package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.SlideEntity;
import webfood.repository.SlideRepository;

@Service
public class SlideService {
	@Autowired
	private SlideRepository slideRepository;
	
	public List<SlideEntity> listSlides(){
		return slideRepository.findAll();
	}
	
	public void deleteSlide(long slide_id) {
		slideRepository.delete(slide_id);
	}
	
	public void saveSlide(SlideEntity slideEntity) {
		slideRepository.save(slideEntity);
	}
}
