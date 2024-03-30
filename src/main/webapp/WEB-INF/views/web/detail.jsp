<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="main">
	<!-- Chi tiết -->
	<div class="container" style="margin-top: 100px">
		<div class="row ">
			<div class="col-lg-6 col-md-12 col-12 hidden-imgs">
				<div class="card mb-3">
					<div class="d-flex border-2 border-bottom border-danger">
						<img
							src="<c:url value='/template/web/assets/img/AnhChiTiet/logo-png-01.png'/>"
							style="width: 25%; height: 130px; object-fit: cover;"
							class="card-img-top" alt="..."> <img
							src="<c:url value='/template/web/assets/img/AnhChiTiet/mok-4-scaled.jpg'/>"
							style="width: 25%; height: 130px; object-fit: cover;"
							class="card-img-top" alt="..."> <img
							src="<c:url value='/template/web/assets/img/AnhChiTiet/mok-2-scaled.jpg'/>"
							style="width: 25%; height: 130px; object-fit: cover;"
							class="card-img-top" alt="..."> <img
							src="<c:url value='/template/web/assets/img/AnhChiTiet/mok-4-scaled.jpg'/>"
							style="width: 25%; height: 130px; object-fit: cover;"
							class="card-img-top" alt="...">
					</div>
					<div class="d-flex">
						<div class="card-body">
							<h3 class="card-title">Trùm Ẩm Thực</h3>
							<div class="d-inline-flex align-items-center">
								<i class="fa-solid fa-location-dot"></i>
								<p class="card-text" style="color: #7ed321; padding-left: 8px;">
									Đang mở cửa</p>
							</div>
							<p class="card-text">470 Đường Trần Đại Nghĩa, Khu đô thị,
								Ngũ Hành Sơn, Đà Nẵng</p>
						</div>
						<div class="card-body">
							<h4 class="card-title fs-5">Thanh Toán Trực Tuyến</h4>
							<div class="row">
								<div class="col-lg-3">
									<img
										src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2018/10/logo-ninja-van.jpg"
										alt="" style="width: 52px;">
								</div>
								<div class="col-lg-3">
									<img
										src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2018/10/logo-techcombank.jpg"
										alt="" style="width: 52px;">
								</div>
								<div class="col-lg-3">
									<img
										src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2018/10/logo-paypal.jpg"
										alt="" style="width: 52px;">
								</div>
								<div class="col-lg-3">
									<img
										src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2018/10/logo-mastercard.jpg"
										alt="" style="width: 52px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 col-md-12 col-12">
				<div class="card mb-3">
					<div class="row gx-0">
						<div class="col-lg-6 col-md-12 col-12">
							<img
								src="<c:url value='/template/admin/assets/upload/MonAn/${food_detail.foodImg }'/>"
								class="img-food"
								style="width: 279px; object-fit: cover; border-radius: 6px;"
								alt="">
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="card-body lh-lg">

								<h5 class="card-title lh-lg">${ food_detail.foodName }</h5>


								<c:choose>
									<c:when test="${food_detail.foodCondition == 2}">
										<c:set var="food_price"
											value="${ food_detail.foodPrice - food_detail.foodNumber}" />
										<h6 class="card-text" name="price ">
											Giá:
											<fmt:formatNumber value="${food_price}" pattern="#,###.##" />
											đ
											</p>
									</c:when>

									<c:when test="${food_detail.foodCondition == 1}">
										<c:set var="food_price"
											value="${food_detail.foodPrice - ((food_detail.foodPrice * food_detail.foodNumber) / 100)}" />
										<h6 class="card-text " name="price ">
											Giá:
											<fmt:formatNumber value="${food_price }" pattern="#,###.##" />
											đ
											</p>
									</c:when>

									<c:when test="${food_detail.foodCondition == 0}">
										<h6 class="card-text " name="price ">
										<c:set var="food_price"
											value="${food_detail.foodPrice }" />
											Giá:
											<fmt:formatNumber value="${food_detail.foodPrice }"
												pattern="#,###.##" />
											đ
									</c:when>
									

								</c:choose>

								<p class="card-text lh-lg" style="font-weight: lighter;">${food_detail.foodContent }</p>
									<s:form id="form-category" modelAttribute="food"
									action="/webfood/them-san-pham" method="POST"
									enctype="multipart/form-data">
									
									<input hidden name="foodId" value="${food_detail.foodId }">
									<input hidden name="foodName" value="${food_detail.foodName }">
									<input hidden name="foodImg" value="${food_detail.foodImg }">
									<input hidden name="food_Qty" value="1">
									<input hidden name="foodPrice" value="${food_price }">
									
									<button type="submit"  class="btn btn-danger add-to-cart  w-100 d-block m-auto ">Chọn
										mua</button>
								</s:form>
								
									
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<h4 class="my-3">Mô Tả Sản Phẩm</h4>
				<div class="col-12 ">
					<p class="card-text lh-lg">${food_detail.foodDesc}</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container my-5" style="margin-top: 20px;">
		<h4 class="fs-4">Sản Phẩm Liên Quan</h4>
		<div class="slider ">
			<div class="slider-box ">
				<div class="food-deatil-js owl-carousel owl-theme ">
					<c:forEach var="item" items="${food_similarly }">
						<div class="item card">
							<c:url var="detailFood" value="/chi-tiet">
								<c:param name="food_id" value="${item.foodId }" />
							</c:url>
							<a class="text-decoration-none" href="${detailFood }"> <img
								width="465px " height="220px "
								style="height: 230px; object-fit: cover; border-radius: 6px"
								src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
								alt=" ">
							</a>
							<div class="card-body">
								<p class="card-title" style="color: #000; font-size: 18px">${item.foodName}
								</h5>
								<p class="card-text" style="font-weight: 400; color: #000"
									name="price ">
									<fmt:formatNumber value="${item.foodPrice }" pattern="#,###.##" />
									đ
								</p>
								
								<s:form id="form-category" modelAttribute="food"
									action="/webfood/them-san-pham" method="POST"
									enctype="multipart/form-data">
									
									<input hidden name="foodId" value="${item.foodId }">
									<input hidden name="foodName" value="${item.foodName }">
									<input hidden name="foodImg" value="${item.foodImg }">
									<input hidden name="food_Qty" value="1">
									<input hidden name="foodPrice" value="${item.foodPrice }">
									
									<button type="submit"  class="btn btn-danger add-to-cart  w-100 d-block m-auto ">Chọn
										mua</button>
								</s:form>
								<!-- <button type="button"
									class="btn btn-danger add-to-cart d-block m-auto"
									data-id_food="">Chọn mua</button> -->
									
									
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

