<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="row gx-lg-5 gx-md-4 gx-2 justify-content-center mt-5">
	<div class="col-12 col-md-10 col-lg-5 card p-3 p-md-5 p-lg-5 pt-4 mt-5">
		<s:form id="form-category" modelAttribute="customerRegister"
			action="/webfood/them-dang-ky" method="POST"
			enctype="multipart/form-data">
			<div class="mb-3">
				<h4 class="form-title text-center fs-4">Đăng Ký</h4>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label fs-5">Họ
					và tên </label> <input type="text" class="form-control" id="fullname"
					aria-describedby="emailHelp" name="customerName" required
					placeholder="Tên Đăng Nhập"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label fs-5">Email
				</label> <input type="email" class="form-control" id="email"
					aria-describedby="emailHelp" name="customerEmail" required
					placeholder="Email Của Bạn"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label fs-5">Điện
					thoại </label> <input type="text" class="form-control" id="phonenumber"
					aria-describedby="emailHelp" name="customerPhone" required
					placeholder="Số Điện Thoại"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label fs-5">Mật
					khẩu</label> <input type="password" class="form-control" id="password"
					name="customerPassword" required placeholder="Mật Khẩu"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label fs-5">Nhập
					lại mật khẩu</label> <input type="password" class="form-control"
					id="password_confirmation" name="" required
					placeholder="Xác Nhận Lại Mật Khẩu"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-4 form-check">
				<input type="checkbox" class="form-check-input p-2"
					id="exampleCheck1" name="remember" value="on"> <label
					class="form-check-label" for="exampleCheck1">Lưu đăng nhập
					của tôi</label>
			</div>
			
			<div class="mb-3">
				<button id="register-submit" type="submit"
					class="btn btn-danger m-auto d-block w-100">Đăng ký</button>
			</div>
		</s:form>
	</div>
</div>
