<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="col-lg-10 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Thêm mã giảm giá</h3>
		</div>
		<div class="row">
		
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						
						<s:form class="forms-sample" id="form-coupon"
							action="/webfood/admin/coupon/save-coupon" modelAttribute="couponModel"
							method="POST" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="exampleInputUsername1">Tên mã giảm giá</label> <input
									name="couponName" type="text" class="form-control"
									id="name_coupon"> <span
									class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Mã giảm giá</label> <input
									name="couponCode" type="text" class="form-control"
									id="code_coupon"> <span
									class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Số lượng mã giảm giá</label>
								<input name="couponQty" type="text" class="form-control"
									id="time_qty"> <span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Tính năng </label>
								<div>
									<select name="couponCondition" id="" class="form-control"
										id="condition_coupon">
										<option value="0">--Chọn--</option>
										<option value="1">Giảm theo phần trăm</option>
										<option value="2">Giảm theo tiền</option>
									</select> <span class="form-message text-danger"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Nhập số % hoặc số
									tiền giảm</label> <input name="couponNumber" class="form-control"
									id="number_coupon"> <span
									class="form-message text-danger"></span>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="exampleInputUsername1">Thời gian bắt đầu</label> <input
										name="couponStart" type="text" class="form-control"
										id="datepicker_start"> <span
										class="form-message text-danger"></span>
								</div>
								<div class="col-md-6">
									<label for="exampleInputUsername1">Thời gian kết thúc</label> <input
										name="couponEnd" type="text" class="form-control"
										id="datepicker_end"> <span
										class="form-message text-danger"></span>
								</div>
							</div>
							<button type="submit"
								class="btn btn-gradient-primary me-2 add-coupon">Thêm</button>
							<button class="btn btn-light">Thoát</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


