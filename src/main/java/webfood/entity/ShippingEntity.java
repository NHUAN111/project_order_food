package webfood.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_shipping")
public class ShippingEntity {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "shipping_id")
    private Long shippingId;
    
    @Column(name = "shipping_name")
    private String shippingName;
    
    @Column(name = "shipping_phone")
    private String shippingPhone;
    
    @Column(name = "shipping_address")
    private String shippingAddress;
    
    @Column(name = "shipping_email")
    private String shippingEmail;
    
    @Column(name = "shipping_notes")
    private String shippingNotes;

	public Long getShippingId() {
		return shippingId;
	}

	public void setShippingId(Long shippingId) {
		this.shippingId = shippingId;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingPhone() {
		return shippingPhone;
	}

	public void setShippingPhone(String shippingPhone) {
		this.shippingPhone = shippingPhone;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getShippingEmail() {
		return shippingEmail;
	}

	public void setShippingEmail(String shippingEmail) {
		this.shippingEmail = shippingEmail;
	}

	public String getShippingNotes() {
		return shippingNotes;
	}

	public void setShippingNotes(String shippingNotes) {
		this.shippingNotes = shippingNotes;
	}
    
    
}
