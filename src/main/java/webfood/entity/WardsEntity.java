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

@Entity(name = "tbl_xaphuongthitran")
public class WardsEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "xaid")
	private Long xaID;

	@Column(name = "name_xaphuong")
	private String nameXaphuong;

	@Column(name = "maqh")
	private Long maQh;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maQh")
	private DistrictEntity distric;

	@OneToMany(mappedBy = "wards")
	private List<FeeshipEntity> feeshipEntities;

	public Long getMaQh() {
		return maQh;
	}

	public void setMaQh(Long maQh) {
		this.maQh = maQh;
	}

	public Long getXaID() {
		return xaID;
	}

	public void setXaID(Long xaID) {
		this.xaID = xaID;
	}

	public String getNameXaphuong() {
		return nameXaphuong;
	}

	public void setNameXaphuong(String nameXaphuong) {
		this.nameXaphuong = nameXaphuong;
	}

	public DistrictEntity getDistric() {
		return distric;
	}

	public void setDistric(DistrictEntity distric) {
		this.distric = distric;
	}

	public List<FeeshipEntity> getFeeshipEntities() {
		return feeshipEntities;
	}

	public void setFeeshipEntities(List<FeeshipEntity> feeshipEntities) {
		this.feeshipEntities = feeshipEntities;
	}

}
