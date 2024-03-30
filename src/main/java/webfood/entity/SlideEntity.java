package webfood.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "tbl_slider")
public class SlideEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "slider_id")
	private Long sliderId;

	@Column(name = "slider_name")
	private String sliderName;

	@Column(name = "slider_img")
	private String sliderImg;


	@Column(name = "created_at")
	private String createdAt;
	
	public Long getSliderId() {
		return sliderId;
	}

	public void setSliderId(Long sliderId) {
		this.sliderId = sliderId;
	}

	public String getSliderName() {
		return sliderName;
	}

	public void setSliderName(String sliderName) {
		this.sliderName = sliderName;
	}

	public String getSliderImg() {
		return sliderImg;
	}

	public void setSliderImg(String sliderImg) {
		this.sliderImg = sliderImg;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
}
