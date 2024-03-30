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
	<!-- Banner -->
	<div id="carouselExampleCaptions " class="carousel slide "
		data-bs-ride="carousel " style="margin-top: 90px;">
		<div class="carousel-inner ">
			<div class="carousel-item active ">
				<img
					src="<c:url value='/template/web/assets/img/banner/banner1.jpg'/>"
					class="d-block w-100 " alt="... ">
				<div class="carousel-caption d-none d-md-block ">
					<h1 style="color: #000; font-weight: 800; font-size: 2.8rem;">ĐẶT
						MÓN NÀO</h1>
					<h1 style="color: red; font-weight: 800; font-size: 2.8rem;">CŨNG
						FREESHIP</h1>
					<form class="d-flex " style="justify-content: center;">
						<input class="form-control " type="search "
							style="border-radius: 12px; width: 50%; padding: 10px;"
							placeholder="Tìm món ăn, đồ uống yêu thích nào "
							aria-label="Search ">
						<button class="btn btn-outline-drak" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Slider -->
	<div class="container " style="margin-top: 20px;">
		<div class="slider ">
			<div class="slider-box ">
				<div class="slider-js owl-carousel owl-theme ">
					<c:forEach var="item" items="${slider_model}">
						<div class="item ">
							<img width="465px " height="220px "
								style="object-fit: cover; border-radius: 8px;"
								src="<c:url value='/template/admin/assets/upload/slider/${item.sliderImg}' />">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- Thể loại -->
	<div class="container ">
		<div class="the-loai-title ">
			<h4>CHỌN THEO THỂ LOẠI</h4>
		</div>
		<div class="row ">
			<c:forEach var="item" items="${category_model}">
				<div class="col-md-2">
					<a href="" class="the-loai-link ">
						<div class="the-loai-img ">
							<img
								src="<c:url value='/template/admin/assets/upload/TheLoai/${item.categoryImg}' />">
						</div>
						<h5 class="the-loai-ten ">Cafe</h5>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Coupon -->
	<div class="container mt-5">
		<div class="row overflow-hidden">
			<h2 class="fs-5 fw-bold text-uppercase" style="color: #53382c">Mã
				giảm giá dành cho bạn</h2>
			<c:forEach var="item" items="${coupon_model}">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="p-2 rounded-3">
						<div class="card mb-3"
							style="border-color: #dc3545; position: relative; border-left: 0;">
							<div class="row g-0">
								<div
									style="position: absolute; width: 34px; height: 34px; border-radius: 50%; background-color: #f6f6f6; top: 50%; transform: translateY(-50%); left: -18px">
								</div>
								<div
									class="col-4 col-md-4 col-lg-4 rounded-start d-flex justify-content-center align-items-center"
									style="background-image: linear-gradient(#de1c2f, #da6b76);">
									<div class="" style="color: #fff">
										<c:choose>
											<c:when test="${item.couponCondition == 1}">
												<h4 class="card-text d-flex justify-content-center">${item.couponNumber}%</h4>
											</c:when>
											<c:when test="${item.couponCondition == 2}">

												<h4 class="card-text d-flex justify-content-center">
													<fmt:formatNumber value="${item.couponNumber}"
														pattern="#,###.##" />
													đ
												</h4>
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class="col-8 col-md-8 col-lg-8">
									<div class="card-body">
										<p class="card-text" style="font-weight: 600">
											${item.couponName}</p>
										<h5 class="card-title p-2 rounded-3 text-center"
											style="background-image: linear-gradient(#de1c2f, #da6b76); color: #fff">
											${item.couponCode }</h5>
										<p class="card-text">
											<small class=" text-muted ">Từ ${item.couponStart}
												đến ${item.couponEnd}</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	

	<div class="container ">
		<div class="kham-pha-thuc-don-title">
			<h4 style="margin-bottom: 8px">MÓN MỚI NHẤT</h4>
		</div>
		<div class="row g-2 g-lg-3 row-cols-2 row-cols-lg-5">
			<c:forEach var="item" items="${food_new}">
				<div class="col-6 col-md-4">
					<div class="card ">
						<c:url var="detailFood" value="/chi-tiet">
							<c:param name="food_id" value="${item.foodId }" />
						</c:url>
						<a href='${detailFood }' class="kham-pha-thuc-don-link"> <img
							src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
							style="height: 280px; object-fit: cover;" class="card-img-top "
							alt="... ">
							<div class="card-body ">
								<h5 class="card-title" style="color: #dc3545">${item.foodName}</h5>
								<p class="card-text " name="price ">
									<fmt:formatNumber value="${item.foodPrice}" pattern="#,###.##" />
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

									<button type="submit" class="btn btn-light ">Chọn mua</button>
								</s:form>
								<div class="promotion_img-icon">
									<img
										src="https://static.wixstatic.com/media/2e960e_fa7140c43f3743ce8e4ccaddf860f47f~mv2.gif"
										alt="" style="border-bottom: 0" width="45px" srcset="">
								</div>

							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



	<!-- Khám phá thực đơn -->
	<div class="container ">
		<div class="kham-pha-thuc-don-title">
			<h4 style="margin-bottom: 8px">KHÁM PHÁ THỰC ĐƠN</h4>
		</div>
		<div class="row g-2 g-lg-3 row-cols-2 row-cols-lg-5">
			<c:forEach var="item" items="${food_model}">
				<div class="col-6 col-md-4">
					<div class="card ">
						<c:url var="detailFood" value="/chi-tiet">
							<c:param name="food_id" value="${item.foodId }" />
						</c:url>
						<a href='${detailFood }' class="kham-pha-thuc-don-link"> <img
							src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
							style="height: 280px; object-fit: cover;" class="card-img-top "
							alt="... ">
							<div class="card-body ">
								<h5 class="card-title ">${item.foodName}</h5>
								<p class="card-text " name="price ">
									<fmt:formatNumber value="${item.foodPrice}" pattern="#,###.##" />
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

									<button type="submit" class="btn btn-light ">Chọn mua</button>
								</s:form>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="kham-pha-thuc-don-footer ">
			<div class="row ">
				<div class="col-md-12 ">
					<a href=" " class="kham-pha-thuc-don-all ">XEM TẤT CẢ <i
						class="fa-solid fa-angle-right "></i>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!--  Bán chạy nhất  -->
	<div class="container">
		<div>
			<div class="d-flex">
				<h4 class="fs-5 fw-bold"
					style="color: #53382c; font-size: 1.2rem; font-weight: bold; margin-top: 40px;">BÁN
					CHẠY NHẤT</h4>
			</div>
			<div class="row g-2 g-lg-3">
				<c:forEach var="item" items="${food_best_seller }">
					<c:url var="detailFood" value="/chi-tiet">
						<c:param name="food_id" value="${item.foodId }" />
					</c:url>
					<div class="col-6 col-md-4 col-lg-3 flex justify-content-center">
						<div class="card kham-pha-thuc-don-link item-food">
							<a class="text-decoration-none" href="${detailFood }"> <img
								src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
								style="height: 230px; object-fit: cover;" class="card-img-top"
								alt="... ">
							</a>
							<div class="card-body">
								<h5 class="card-title">${item.foodName}</h5>
								<p class="card-text" style="font-weight: 400; color: #000"
									name="price ">
									<fmt:formatNumber value="${item.foodPrice}" pattern="#,###.##" />
									đ
								</p>
								<p>Đã bán ${item.foodSalesQuantity}</p>
								<button type="submit " href="# " class="btn btn-light ">Chọn
									mua</button>
							</div>

							<div class="promotion_img-icon">
								<img
									src="https://uploads.documents.cimpress.io/v1/uploads/81901466-1a04-40fc-bbb5-40c7d1c7e57f~110/original?tenant=vbu-digital"
									alt="" style="border-bottom: 0" width="45px" srcset="">
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>  




	<!-- Đang khuyến mãi -->
	<div class="container ">
		<div class="row g-2 g-lg-3 ">
			<div class="khuyen-mai-title ">
				<h4>ĐANG KHUYẾN MÃI</h4>
			</div>
			<c:forEach var="item" items="${food_sale}">
				<c:url var="detailFood" value="/chi-tiet">
					<c:param name="food_id" value="${item.foodId }" />
				</c:url>
				<div class="col-md-2 ">
					<a href="${detailFood }" class="khuyen-mai-link ">
						<div class="card ">
							<img
								src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
								style="height: 230px; object-fit: cover;" class="card-img-top "
								alt="... ">
							<div class="card-body ">
								<h5 class="card-title ">${item.foodName }</h5>
								<c:choose>
									<c:when test="${item.foodCondition == 2}">
										<c:set var="food_price"
											value="${item.foodPrice - item.foodNumber}" />
										<p class="card-text " name="price ">
											<fmt:formatNumber value="${food_price }" pattern="#,###.##" />
											đ
										</p>
									</c:when>

									<c:when test="${item.foodCondition == 1}">
										<c:set var="food_price"
											value="${item.foodPrice - ((item.foodPrice * item.foodNumber) / 100)}" />
										<p class="card-text " name="price ">
											<fmt:formatNumber value="${food_price }" pattern="#,###.##" />
											đ
										</p>
									</c:when>

								</c:choose>

								<s:form id="form-category" modelAttribute="food"
									action="/webfood/them-san-pham" method="POST"
									enctype="multipart/form-data">

									<input hidden name="foodId" value="${item.foodId }">
									<input hidden name="foodName" value="${item.foodName }">
									<input hidden name="foodImg" value="${item.foodImg }">
									<input hidden name="food_Qty" value="1">

									<input hidden name="foodPrice" value="${food_price }">

									<button type="submit" class="btn btn-light ">Chọn mua</button>
								</s:form>
								<!-- <button type="submit " href="# " class="btn btn-light ">Chọn
									mua</button> -->

								<c:choose>
									<c:when test="${item.foodCondition == 1}">
										<span class="khuyen-mai-percent"> <i
											class="fa-solid fa-percent "></i> <span name=" "> Giảm
												${item.foodNumber} %</span>
										</span>
									</c:when>
									<c:when test="${item.foodCondition == 2}">
										<span class="khuyen-mai-percent"> <i
											class="fa-solid fa-percent "></i> <span name=" "> Giảm
												<fmt:formatNumber value="${item.foodNumber}"
													pattern="#,###.##" /> đ
										</span>
										</span>
									</c:when>
								</c:choose>


							</div>
						</div>
					</a>
				</div>

			</c:forEach>

		</div>
	</div>

	<!-- Thành viên -->
	<div class="container ">
		<div class="thanh-vien ">
			<h4>TRỞ THÀNH CHIẾN BINH LOSHIP NGAY HÔM NAY!</h4>
		</div>
		<div class="row ">
			<div class="col-md-12 ">
				<div class="thanh-vien-img ">
					<div class="linear-bg "></div>
					<div class="thanh-vien-content ">
						<h3>Trở thành chiến binh Loship - nhanh và miễn phí</h3>
						<p>Dễ dàng trở thành chiến binh của Loship</p>
						<p>Loship - ứng dụng giao trà sữa trong vòng 1 giờ - với xe
							máy của chính mình và điện thoại Android hoặc iPhone.</p>
					</div>
					<div>
						<button class="btn btn-danger btn-banner "
							href="http://chienbinhloship.com " target="_blank ">Đăng
							ký ngay!</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>