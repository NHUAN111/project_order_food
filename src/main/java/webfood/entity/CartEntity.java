package webfood.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CartEntity {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cart_id;
	private Long food_id;
	private String food_name;
	private String food_img;
	private Integer food_qty;
	private String food_price;
	public Long getCart_id() {
		return cart_id;
	}
	public void setCart_id(Long cart_id) {
		this.cart_id = cart_id;
	}
	public Long getFood_id() {
		return food_id;
	}
	
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public void setFood_id(Long food_id) {
		this.food_id = food_id;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	public Integer getFood_qty() {
		return food_qty;
	}
	public void setFood_qty(Integer food_qty) {
		this.food_qty = food_qty;
	}
	public String getFood_price() {
		return food_price;
	}
	public void setFood_price(String food_price) {
		this.food_price = food_price;
	}
	public CartEntity(Long cart_id, Long food_id, String food_name, String food_img, int food_qty, String food_price) {
		super();
		this.cart_id = cart_id;
		this.food_id = food_id;
		this.food_name = food_name;
		this.food_img = food_img;
		this.food_qty = food_qty;
		this.food_price = food_price;
	}
	
	public CartEntity() {
		
	}
}
