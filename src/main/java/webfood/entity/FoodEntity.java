package webfood.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_food")
public class FoodEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "food_id")
	private Long foodId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private CategoryEntity category;

	@OneToMany(mappedBy = "food")
	private List<OrderDetailEntity> orderDetailEntitties;

	@Column(name = "food_name")
	private String foodName;

	@Column(name = "food_desc")
	private String foodDesc;

	@Column(name = "food_content")
	private String foodContent;

	@Column(name = "food_price")
	private String foodPrice;

	@Column(name = "food_img")
	private String foodImg;

	@Column(name = "food_status")
	private Integer foodStatus;

	@Column(name = "food_condition")
	private Integer foodCondition;

	@Column(name = "food_number")
	private Integer foodNumber;

	public Long getFoodId() {
		return foodId;
	}

	public void setFoodId(Long foodId) {
		this.foodId = foodId;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodDesc() {
		return foodDesc;
	}

	public void setFoodDesc(String foodDesc) {
		this.foodDesc = foodDesc;
	}

	public String getFoodContent() {
		return foodContent;
	}

	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}

	public String getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(String foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodImg() {
		return foodImg;
	}

	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}

	public int getFoodStatus() {
		return foodStatus;
	}

	public Integer getFoodCondition() {
		return foodCondition;
	}

	public void setFoodCondition(Integer foodCondition) {
		this.foodCondition = foodCondition;
	}

	public Integer getFoodNumber() {
		return foodNumber;
	}

	public void setFoodNumber(Integer foodNumber) {
		this.foodNumber = foodNumber;
	}

	public void setFoodStatus(Integer foodStatus) {
		this.foodStatus = foodStatus;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public List<OrderDetailEntity> getOrderDetailEntitties() {
		return orderDetailEntitties;
	}

	public void setOrderDetailEntitties(List<OrderDetailEntity> orderDetailEntitties) {
		this.orderDetailEntitties = orderDetailEntitties;
	}

}
