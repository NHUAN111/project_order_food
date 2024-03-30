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
import javax.persistence.Transient;

@Entity(name = "tbl_tinhthanhpho")
public class CityEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "matp")
	private Long maTp;

	@Column(name = "name_city")
	private String nameCity;

	@OneToMany(mappedBy = "city")
	private List<DistrictEntity> diEntities;

	@OneToMany(mappedBy = "citys")
	private List<FeeshipEntity> feeshipEntities;

	@Transient // Trường không tồn tại trong csdl sẽ dùng @Transient
	private String action;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Long getMaTp() {
		return maTp;
	}

	public void setMaTp(Long maTp) {
		this.maTp = maTp;
	}

	public String getNameCity() {
		return nameCity;
	}

	public void setNameCity(String nameCity) {
		this.nameCity = nameCity;
	}

	public List<DistrictEntity> getDiEntities() {
		return diEntities;
	}

	public void setDiEntities(List<DistrictEntity> diEntities) {
		this.diEntities = diEntities;
	}

	public List<FeeshipEntity> getFeeshipEntities() {
		return feeshipEntities;
	}

	public void setFeeshipEntities(List<FeeshipEntity> feeshipEntities) {
		this.feeshipEntities = feeshipEntities;
	}

}
