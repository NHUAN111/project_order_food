package webfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.CategoryEntity;
import webfood.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;

	public List<CategoryEntity> getAllCategories() {
		return categoryRepository.findAll();
	}
	
	public CategoryEntity saveCategory(CategoryEntity categoryEntity) {
		return categoryRepository.save(categoryEntity);
	}
	
	public CategoryEntity findCategory(long category_id) {
		return categoryRepository.findOne((long) category_id);
	}
	
	public void deleteCategory(int category_id) {
		CategoryEntity categoryEntity = categoryRepository.findOne((long) category_id);
		categoryRepository.delete(categoryEntity);
	}
	
	public void updateStatusCategory(int category_id) {
		CategoryEntity categoryEntity = categoryRepository.findOne((long) category_id);
		if (categoryEntity.getCategoryStatus() == 0) {
			categoryEntity.setCategoryStatus(1);
		} else if (categoryEntity.getCategoryStatus() == 1){
			categoryEntity.setCategoryStatus(0);
		}
		categoryRepository.save(categoryEntity);
	}
	
	public CategoryEntity editCategory(int category_id) {
		CategoryEntity categoryEntity = categoryRepository.findOne((long) category_id);
		return categoryEntity;
	}
	
	public void updateCategory(CategoryEntity categoryEntity) {
		categoryRepository.save(categoryEntity);
	}
}
