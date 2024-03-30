<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="col-lg-10 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Chỉnh sửa mã giảm giá</h3>
		</div>
		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">

						<s:form class="forms-sample" id="form-coupon"
							action="/webfood/admin/coupon/update-coupon"
							modelAttribute="couponModel" method="POST"
							enctype="multipart/form-data">
							<input hidden name="couponId" value="${detail_coupon.couponId }">
							<div class="form-group">
								<label for="exampleInputUsername1">Tên mã giảm giá</label> <input
									name="couponName" type="text" class="form-control"
									value="${detail_coupon.couponName }" id="name_coupon">
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Mã giảm giá</label> <input
									name="couponCode" type="text" class="form-control"
									value="${detail_coupon.couponCode }" id="code_coupon">
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Số lượng mã giảm giá</label>
								<input name="couponQty" type="text" class="form-control"
									value="${detail_coupon.couponQty }" id="time_qty"> <span
									class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Tính năng </label>
								<div>
									<select name="couponCondition" id="" class="form-control"
										id="condition_coupon">

										<c:choose>
											<c:when test="${detail_coupon.couponCondition == 1}">
												<option value="0">--Chọn--</option>
												<option value="1" selected>Giảm theo phần trăm</option>
												<option value="2">Giảm theo tiền</option>
											</c:when>
											<c:when test="${detail_coupon.couponCondition == 2}">
												<option value="0">--Chọn--</option>
												<option value="1">Giảm theo phần trăm</option>
												<option value="2" selected>Giảm theo tiền</option>
											</c:when>
										</c:choose>



									</select> <span class="form-message text-danger"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Nhập số % hoặc số
									tiền giảm</label> <input name="couponNumber" class="form-control"
									value="${detail_coupon.couponNumber }" id="number_coupon">
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="exampleInputUsername1">Thời gian bắt đầu</label> <input
										name="couponStart" type="text" class="form-control"
										value="${detail_coupon.couponStart }" id="datepicker_start">
									<span class="form-message text-danger"></span>
								</div>
								<div class="col-md-6">
									<label for="exampleInputUsername1">Thời gian kết thúc</label> <input
										name="couponEnd" type="text" class="form-control"
										value="${detail_coupon.couponEnd }" id="datepicker_end">
									<span class="form-message text-danger"></span>
								</div>
							</div>
							<button type="submit"
								class="btn btn-gradient-primary me-2 add-coupon">Chỉnh
								sửa</button>
							<button class="btn btn-light">Thoát</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


