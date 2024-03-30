package webfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import webfood.entity.SlideEntity;

@Repository
public interface SlideRepository extends JpaRepository<SlideEntity, Long>{

}
