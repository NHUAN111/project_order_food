package webfood.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_order")
public class OrderEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_id")
	private Long orderId;

	@Column(name = "order_code")
	private String orderCode;

	@Column(name = "order_coupon")
	private String orderCoupon;

	@Column(name = "coupon_price")
	private String couponPrice;

	@Column(name = "order_feeship")
	private String orderFeeship;

	@OneToOne
	@JoinColumn(name = "customer_id", nullable = false)
	private CustomerEntity customerId;

	@OneToOne
	@JoinColumn(name = "shipping_id", nullable = false)
	private ShippingEntity shippingId;

	@OneToOne
	@JoinColumn(name = "payment_id", nullable = false)
	private PaymentEntity paymentId;

	@Column(name = "order_status")
	private Integer orderStatus;

	@Column(name = "created_at")
	private String createdAt;

	@Column(name = "updated_at")
	private String updatedAt;
	
	@PrePersist
    public void prePersist() {
        LocalDateTime now = LocalDateTime.now();
        this.createdAt = now.toString();
    }

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now().toString();
    }

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderCoupon() {
		return orderCoupon;
	}

	public void setOrderCoupon(String orderCoupon) {
		this.orderCoupon = orderCoupon;
	}

	public String getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(String couponPrice) {
		this.couponPrice = couponPrice;
	}

	public String getOrderFeeship() {
		return orderFeeship;
	}

	public void setOrderFeeship(String orderFeeship) {
		this.orderFeeship = orderFeeship;
	}

	public CustomerEntity getCustomerId() {
		return customerId;
	}

	public void setCustomerId(CustomerEntity customerId) {
		this.customerId = customerId;
	}

	public ShippingEntity getShippingId() {
		return shippingId;
	}

	public void setShippingId(ShippingEntity shippingId) {
		this.shippingId = shippingId;
	}

	public PaymentEntity getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(PaymentEntity paymentId) {
		this.paymentId = paymentId;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

}
