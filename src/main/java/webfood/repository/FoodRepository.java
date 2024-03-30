package webfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import webfood.entity.FoodEntity;

@Repository
public interface FoodRepository extends JpaRepository<FoodEntity, Long> {
	 // Sử dụng Pageable để lấy 10 sản phẩm
//    Page<FoodEntity> findAll(Pageable pageable);
	  List<FoodEntity> findByCategory_CategoryId(long categoryId);


}
