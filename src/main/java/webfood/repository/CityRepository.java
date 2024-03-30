package webfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import webfood.entity.CityEntity;

@Repository
public interface CityRepository extends JpaRepository<CityEntity, Long>{

		
}
