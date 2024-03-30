package webfood.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webfood.entity.FoodEntity;
import webfood.repository.FoodRepository;

@Service
public class FoodService {
	@Autowired
	private FoodRepository foodRepository;

	public List<FoodEntity> listAllFood() {
		// Tạo một danh sách riêng để lưu trữ các món ăn thỏa mãn điều kiện
		List<FoodEntity> foodNotSale = new ArrayList<>();
	

		List<FoodEntity> foodEntities = foodRepository.findAll();
		for (FoodEntity food : foodEntities) {
			if (food.getFoodCondition() == 0) {
				foodNotSale.add(food);
			}
		}
		return foodNotSale;
	}

	public FoodEntity saveFood(FoodEntity foodEntity) {
		return foodRepository.save(foodEntity);
	}

	public void deleteFood(long food_id) {
		FoodEntity foodEntity = foodRepository.findOne(food_id);
		foodRepository.delete(foodEntity);
	}

	public void updateFood(FoodEntity foodEntity) {
		foodRepository.save(foodEntity);
	}

	public void updateStatusFood(long food_id) {
		FoodEntity foodEntity = foodRepository.findOne(food_id);
		if (foodEntity.getFoodStatus() == 0) {
			foodEntity.setFoodStatus(1);
		} else if (foodEntity.getFoodStatus() == 1) {
			foodEntity.setFoodStatus(0);
		}
		foodRepository.save(foodEntity);
	}

	public FoodEntity editFood(long food_id) {
		FoodEntity foodEntity = foodRepository.findOne(food_id);
		return foodEntity;
	}

	public List<FoodEntity> listFoodSale() {
		// Tạo một danh sách riêng để lưu trữ các món ăn thỏa mãn điều kiện
		List<FoodEntity> foodSale = new ArrayList<>();

		List<FoodEntity> foodEntities = foodRepository.findAll();
		for (FoodEntity food : foodEntities) {
			if (food.getFoodCondition() != 0) {
				foodSale.add(food);
			}
		}
		return foodSale;
	}
	
	public FoodEntity findOne(long id) {
		return foodRepository.findOne(id);
	}
	
	public List<FoodEntity> foodSimilarly(long id){
		FoodEntity foodEntity = foodRepository.findOne(id);
		List<FoodEntity> foodEntities = foodRepository.findByCategory_CategoryId(foodEntity.getCategory().getCategoryId());
		foodEntities.remove(foodEntity);
		
		List<FoodEntity> fooodNotSale = new ArrayList<>();
		
		for(FoodEntity foodEntity2: foodEntities) {
			if(foodEntity2.getFoodCondition() == 0) {
				fooodNotSale.add(foodEntity2);
			}
		}
		
		return fooodNotSale;
	}
}
