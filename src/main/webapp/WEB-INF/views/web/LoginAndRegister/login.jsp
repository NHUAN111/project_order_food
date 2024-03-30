<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="row gx-lg-5 gx-md-4 gx-2 justify-content-center mt-5">
	<div
		class="col-12 col-md-10 col-lg-5 card  p-3 p-md-5 p-lg-5 pt-4 mt-5">


		<div class="mb-3">
			<h4 class="form-title text-center fs-4">Đăng Nhập</h4>
		</div>
		<s:form id="form-category" modelAttribute="customer"
			action="/webfood/kiem-tra-dang-nhap" method="POST"
			enctype="multipart/form-data">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label fs-5">Tài
					Khoản Hoặc Email</label> <input type="text" class="form-control p-2"
					id="name_login" aria-describedby="emailHelp" name="customerName"
					placeholder="Tên Hoặc Email"> <span
					class="form-message text-danger"></span>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label fs-5">Mật
					khẩu</label> <input type="password" class="form-control p-2"
					id="pass_login" name="customerPassword" placeholder="Mật Khẩu Của Bạn">
				<span class="form-message text-danger"></span>
			</div>
			<div class="mb-4 form-check">
				<input type="checkbox" class="form-check-input p-2"
					id="exampleCheck1" name="remember" value="on"> <label
					class="form-check-label" for="exampleCheck1">Lưu đăng nhập
					của tôi</label>
			</div>
			<div class="d-flex justify-content-center">
				<div class="g-recaptcha" data-sitekey="{{ env('CAPTCHA_KEY') }}"></div>
			</div>
			<br />

			<div class="mb-3 d-flex justify-content-center">
				<button type="submit" class="btn btn-danger w-100">Đăng
					nhập</button>
			</div>


		</s:form>
		<c:url var="register" value="/dang-ky" />
		<div class="mb-3 text-center">
			Chưa có tài khoản? <a type="submit" class="text-decoration-none"
				href="${register }">Đăng ký tài khoản</a>
		</div>



	</div>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	Validator({
		form : '.fromlogin',
		errorSelector : '.form-message',
		rules : [
				Validator.isRequired('#name_login',
						'Vui lòng nhập tên tài khoản hoặc email'),
				Validator.isRequired('#pass_login',
						'Vui lòng nhập mật khẩu của bạn'),
		// Validator.minLength('#pass_login', 6),
		]
	});
</script>


