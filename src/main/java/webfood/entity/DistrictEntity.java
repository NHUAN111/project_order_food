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

@Entity(name = "tbl_quanhuyen")
public class DistrictEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "maqh")
	private Long maQh;

	@Column(name = "name_quanhuyen")
	private String nameQuanhuyen;

	@Column(name = "matp")
	private Long maTp;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maTp")
	private CityEntity city;

	@OneToMany(mappedBy = "distric")
	private List<WardsEntity> wardsEntities;

	@OneToMany(mappedBy = "districts")
	private List<FeeshipEntity> feeshipEntities;

	public Long getMaQh() {
		return maQh;
	}

	public void setMaQh(Long maQh) {
		this.maQh = maQh;
	}

	public String getNameQuanhuyen() {
		return nameQuanhuyen;
	}

	public void setNameQuanhuyen(String nameQuanhuyen) {
		this.nameQuanhuyen = nameQuanhuyen;
	}

	public Long getMaTp() {
		return maTp;
	}

	public void setMaTp(Long maTp) {
		this.maTp = maTp;
	}

	public CityEntity getCity() {
		return city;
	}

	public void setCity(CityEntity city) {
		this.city = city;
	}

	public List<WardsEntity> getWardsEntities() {
		return wardsEntities;
	}

	public void setWardsEntities(List<WardsEntity> wardsEntities) {
		this.wardsEntities = wardsEntities;
	}

	public List<FeeshipEntity> getFeeshipEntities() {
		return feeshipEntities;
	}

	public void setFeeshipEntities(List<FeeshipEntity> feeshipEntities) {
		this.feeshipEntities = feeshipEntities;
	}

}
