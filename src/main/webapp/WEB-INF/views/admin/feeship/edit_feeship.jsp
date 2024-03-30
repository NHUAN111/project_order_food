<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<meta charset="UTF-8">

<c:url var="select-city" value="/admin/feeship/select-delivery" />


<div class="col-lg-12 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Cập nhật phí vận chuyển</h3>
		</div>
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">

						<s:form class="forms-sample" id="form-category"
							modelAttribute="feeShip"
							action="/webfood/admin/feeship/update-feeship" method="post"
							enctype="multipart/form-data">

							<input hidden="" name="feeId" value="${edit_feeship.feeId }">
							<div class="form-group">
								<label for="exampleInputEmail1">Chọn thành phố</label>
								<div>
									<select name="feeMatp" id="city"
										class="form-control choose city" id="exampleInputUsername1">
										<option value >--Chọn tỉnh thành phố--</option>
										<option selected="selected" value="${edit_feeship.citys.maTp }">${edit_feeship.citys.nameCity }</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Chọn quận huyện</label>
								<div>
									<select name="feeMaqh" id="province"
										class="form-control choose province"
										id="exampleInputUsername1">
										<option value="">--Chọn quận huyện--</option>
										<option selected="selected" value="${edit_feeship.districts.maQh }">${edit_feeship.districts.nameQuanhuyen }</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Chọn xã phường</label>
								<div>
									<select name="feeXaid" id="wards" class="form-control wards"
										id="exampleInputUsername1">
										<option>--Chọn xã phường--</option>
										<option selected="selected" value="${edit_feeship.wards.xaID }">${edit_feeship.wards.nameXaphuong }</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Phí vận chuyển</label>
								 <input value="${edit_feeship.feeFeeship }"
									name="feeFeeship" type="text" class="form-control fee_ship"
									id="exampleInputUsername1">
							</div>
							<button type="submit"
								class="btn btn-gradient-primary me-2 add_delivery">Cập nhật</button>
							<button class="btn btn-light">Thoát</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('.choose').on('change', function() {
		var action = $(this).attr('id');
		var matp = $(this).val();
		var result = '';

		if (action == 'city') {
			result = 'province';
		} else {
			result = 'wards';
		}

		var data = {
			action : action,
			maTp : matp
		};

		$.ajax({
			url : '/webfood/admin/feeship/select-delivery',
			method : 'POST',
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data) {
				$('#' + result).html(data);
			},
			error : function() {
				alert('lỗi 4');
			}
		});
	});
</script>

