<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container" style="margin-top: 100px">
	<div class="row g-lg-3">
		<div class="col-12 col-md-12 col-lg-3">
			<div class="list-group card p-2 mb-3 mt-5" id="list-tab"
				role="tablist">
				<h5 class="text-center"
					style="color: #53382c; font-size: 1.2rem; font-weight: bold;">
					TÌM KIẾM</h5>
				<div class="input-group">
					<input id="search" type="text" class="form-control" name="search"
						placeholder="Tìm Kiếm Món Ăn, Đồ Uống...">
					<button type="button"
						class="btn-md btn-inverse-success btn-icon border border-0 p-2 rounded-end">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</div>
			<div class="list-group card p-2 mb-3">
				<p>
				<h5 class="text-center"
					style="color: #53382c; font-size: 1.2rem; font-weight: bold;">
					TÌM KIẾM THEO GIÁ</h5>
				<input type="text" id="amount" readonly
					style="border: 0; color: #dc3545; font-weight: bold;">
				</p>
				<input type="hidden" name="start_price" id="start_price"> <input
					type="hidden" name="end_price" id="end_price">
				<div id="slider-range"></div>
				{{-- Thanh Trượt --}}
			</div>
			<div class="list-group card p-2" id="list-tab" role="tablist">
				<h5 class="text-center"
					style="color: #53382c; font-size: 1.2rem; font-weight: bold;">
					DANH MỤC CÁC MÓN</h5>
				<c:forEach var="item" items="${category_model }">
					<div class="m-2">
						<i class="fa-solid fa-jar"></i> <span style="cursor: pointer"
							class="btn-category">${item.categoryName }</span>
					</div>

				</c:forEach>

			</div>
		</div>
		<div class="col-12 col-md-12 col-lg-9">
			<div style="margin-bottom: 20px">
				<h4 class="text-center fw-bolder"
					style="font-size: 26px; color: #53382c">KHÁM PHÁ THỰC ĐƠN</h4>
			</div>
			<div class="row g-2 g-lg-3 row-cols-2 row-cols-lg-5"
				id="loading-category-menu">
				<c:forEach var="item" items="${food_model }">
				<c:url var="detailFood" value="/chi-tiet">
								<c:param name="food_id" value="${item.foodId }" />
							</c:url>
				
				<div class="col-6 col-md-4 col-lg-4" >
                        <div class="card">
						  <a class="kham-pha-thuc-don-link item-food" href="${detailFood }">
						<img src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg }'/>"
								class="card-img-top"
								  style="height: 230px; object-fit: cover;"
								alt="">
								
							<div class="card-body">
								<h5 class="card-title ">${item.foodName}</h5>
								
								<p class="card-text" name="price"
									style="font-weight: 400; color: #000"> <fmt:formatNumber value="${item.foodPrice }" pattern="#,###.##" />đ</p>
							</div>
							
							<s:form id="form-category" modelAttribute="food"
									action="/webfood/them-san-pham" method="POST"
									enctype="multipart/form-data">
									
									<input hidden name="foodId" value="${item.foodId }">
									<input hidden name="foodName" value="${item.foodName }">
									<input hidden name="foodImg" value="${item.foodImg }">
									<input hidden name="food_Qty" value="1">
									<input hidden name="foodPrice" value="${item.foodPrice }">
									
									<button type="submit"  class="btn btn-danger add-to-cart d-block m-auto">Chọn
										mua</button>
								</s:form>
						</a>
					</div>
				</div>
				</c:forEach>

			</div>
		</div>
	</div>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>




