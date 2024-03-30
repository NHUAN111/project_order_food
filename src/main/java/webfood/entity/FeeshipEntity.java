package webfood.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "tbl_fee_ship")
public class FeeshipEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "fee_id")
	private Long feeId;

	@Column(name = "fee_feeship")
	private Integer feeFeeship;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fee_matp")
	private CityEntity citys;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fee_maqh")
	private DistrictEntity districts;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fee_xaid")
	private WardsEntity wards;

	public Long getFeeId() {
		return feeId;
	}

	public void setFeeId(Long feeId) {
		this.feeId = feeId;
	}
	
	public Integer getFeeFeeship() {
		return feeFeeship;
	}

	public void setFeeFeeship(Integer feeFeeship) {
		this.feeFeeship = feeFeeship;
	}

	public CityEntity getCitys() {
		return citys;
	}

	public void setCitys(CityEntity citys) {
		this.citys = citys;
	}

	public DistrictEntity getDistricts() {
		return districts;
	}

	public void setDistricts(DistrictEntity districts) {
		this.districts = districts;
	}

	public WardsEntity getWards() {
		return wards;
	}

	public void setWards(WardsEntity wards) {
		this.wards = wards;
	}
	
}
