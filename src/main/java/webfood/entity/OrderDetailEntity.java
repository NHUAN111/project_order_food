package webfood.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_order_details")
public class OrderDetailEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_details_id")
	private Long orderDetailsId;

	@Column(name = "order_code")
	private String orderCode;

	@Column(name = "food_name")
	private String foodName;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "food_id")
	private FoodEntity food;

	@Column(name = "food_price")
	private double foodPrice;

	@Column(name = "food_sales_quantity")
	private int foodSalesQuantity;

	@Column(name = "order_date")
	private String orderDate;

	@Column(name = "updated_at")
	private String updatedAt;

	public Long getOrderDetailsId() {
		return orderDetailsId;
	}

	public void setOrderDetailsId(Long orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public FoodEntity getFood() {
		return food;
	}

	public void setFood(FoodEntity food) {
		this.food = food;
	}

	public double getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}

	public int getFoodSalesQuantity() {
		return foodSalesQuantity;
	}

	public void setFoodSalesQuantity(int foodSalesQuantity) {
		this.foodSalesQuantity = foodSalesQuantity;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

}
