<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="row gx-5 mt-5">
	<div class="col-12 col-md-12 col-lg-3"></div>
	<div class="col-12 col-md-12 col-lg-6 mt-5">
		<div class="card">
			<img
				src="<c:url value='/template/web/assets/img/banner/banner1.jpg'/>"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title text-center">GIỎ HÀNG CỦA BẠN</h5>
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<table class="table">
								<thead>
									<tr>
										<th>Ảnh</th>
										<th>Tên món</th>
										<th>Giá</th>
										<th>SL</th>
										<!-- <th>Tổng</th> -->
										<th></th>
									</tr>
								</thead>
								<tbody id="loading-cart">
									<c:set var="total" value="0" />
									<c:forEach var="item" items="${cartItems }">
										<c:set var="qty" value="${item.food_qty }" />
										<c:set var="price" value="${item.food_price }" />
										<c:set var="total" value="${ total + (qty * price) }" />

										<tr class="cart-items-info">

											<td class="cart-item-img"><img
												src="<c:url value='/template/admin/assets/upload/MonAn/${item.food_img }'/>"
												alt=""></td>

											<td class="cart-item-name ">${item.food_name }</td>
											<td class="cart-item-price"><fmt:formatNumber
													value="${item.food_price}" pattern="#,###.##" /> đ</td>
											<td class="cart-item-qty"><input type="number"
												class="btn-update-cart" value="${item.food_qty }"
												data-food_id="${item.food_id }" min="1"></td>

											<%-- <td id="load-price" class="cart-total-price">
												<p>${ qty * price }</p>
											</td> --%>

											<td class="cart-item-close"><c:url var="deleteCart"
													value="/xoa-san-pham">
													<c:param name="food_id" value="${item.food_id}" />
												</c:url> <a href="${ deleteCart}"> <i
													class="fa-regular fa-circle-xmark delete-cart"
													data-delete_id="${item.food_id }"></i>
											</a></td>
										</tr>
									</c:forEach>




									<c:if test="${ not empty sessionScope.cart}">
									
									
									<tr class="cart-total">
											<td colspan="2" class="cart-total-title">Tổng: <span
												style="color: #9c9c9c; font-size: 1rem; font-weight: 400">(Tạm
													tính)</span>
											</td>
											<td colspan="4" id="load-price" class="cart-total-price">
												<fmt:formatNumber value="${total }" pattern="#,###.##" /> đ

											</td>
										</tr>
										<tr>
											<c:choose>
												<c:when test="${coupon.couponCondition == 1}">
													<td colspan="6">
														<p style="border-style: dotted;" class="p-2 text-center">
															<i class="fa-solid fa-tags"></i> ${coupon.couponCode } -<span>
																${coupon.couponNumber } %</span>
														</p> <c:set var="total_coupon"
															value="${total * coupon.couponNumber / 100 }" />

														<p>Tổng giảm:
														<p id="total-coupon">
															<fmt:formatNumber value="${total_coupon }"
																pattern="#,###.##" />
															đ


														</p>
														</p>
													</td>
													<tr class="cart-total">
														<td colspan="2" class="cart-total-title">Tổng sau
															giảm: <span
															style="color: #9c9c9c; font-size: 1rem; font-weight: 400"></span>
														</td>
														<td colspan="4" id="load-total" class="cart-total-price">
															<fmt:formatNumber value="${total - total_coupon }"
																pattern="#,###.##" /> đ
														</td>
													</tr>
												</c:when>
											</c:choose>
										<tr>
											<c:choose>
												<c:when test="${coupon.couponCondition == 2}">
													<td colspan="6">
														<p style="border-style: dotted;" class="p-2 text-center">
															<i class="fa-solid fa-tags"></i> ${coupon.couponCode } -<span>
																<fmt:formatNumber value="${coupon.couponNumber }"
																	pattern="#,###.##" /> đ
															</span>
														</p> <c:set var="total_coupon"
															value="${total - coupon.couponNumber}" />

													</td>

													<tr class="cart-total">
														<td colspan="2" class="cart-total-title">Tổng sau
															giảm: <span
															style="color: #9c9c9c; font-size: 1rem; font-weight: 400"></span>
														</td>
														<td colspan="4" id="load-total" class="cart-total-price">
															<fmt:formatNumber value="${total_coupon }"
																pattern="#,###.##" /> đ
														</td>
													</tr>
												</c:when>
											</c:choose>
										</tr>

										

										<c:url var="checkOut" value="/thu-tuc-thanh-toan" />
										<td colspan="6"><a
											class="btn btn-danger check_out w-100 p-2"
											href="${checkOut }"> Thanh toán </a></td>


										<tr>
											<td colspan="6"><s:form modelAttribute="coupon"
													action="/webfood/kiem-tra-ma-giam" method="post"
													enctype="multipart/form-data">

													<div class="input-group mb-3 ">
														<span class="input-group-text" id="basic-addon1"> <i
															class="fa-solid fa-ticket"></i>
														</span> <input type="text" class="form-control" name="couponCode"
															placeholder="Nhập mã giảm giá">
														<button type="submit" class="btn btn-danger ">Tính</button>
													</div>
												</s:form></td>

										</tr>


									</c:if>



									<c:if test="${empty sessionScope.cart}">
										<tr>
											<td colspan="5"><img
												src="https://bizweb.dktcdn.net/100/368/281/themes/739953/assets/empty-cart.png?1661855650057"
												style="display: block; margin: auto" width="310px"></td>
										</tr>
									</c:if>




								</tbody>
							</table>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-12 col-lg-3"></div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script>
	$('.delete-cart').on('click', function() {
		var food_id = $(this).data('delete_id');
		var url = '/webfood/xoa-san-pham?food_id=' + encodeURIComponent(food_id);
	
		$.ajax({
			url : url,
			method : 'GET',
			success: function(data) {
		        message_toastr("success", "Xoá món thành công");
		    },
		    error: function(data) {
		        alert("Fix Bug Huhu :<");
		    },
		});
	});
</script> -->

<script>

	$('.btn-update-cart').on('click', function() {
		var food_id = $(this).data('food_id');
		var food_qty = $(this).val();
		var url = '/webfood/cap-nhat-gio-hang?food_id='
					+ encodeURIComponent(food_id) + "&food_qty="
					+ food_qty;
			$.ajax({
				url : url,
				method : 'GET',
				success : function(data) {
					var data_price = data.price
					var total = data.total;
					var coupon_price = data.coupon_price;
					
					// Định dạng số sử dụng hàm toLocaleString()
					var formattedPrice = parseFloat(data_price).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
					var totalFormatted = parseFloat(total).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
					var couponPriceFormatted = parseFloat(coupon_price).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
					$('#load-price').html('<p>'+formattedPrice+'</p>');		
					$('#load-total').html('<p>'+totalFormatted+'</p>');
					$('#total-coupon').html('<p>'+couponPriceFormatted+'</p>');
				               
				},
				error : function(data) {
					alert("Fix Bug Huhu :<");
				},
			});
		});

</script>



