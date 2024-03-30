<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<form action="{{ url('/dat-hang') }}" method="post">

	<div class="row gx-lg-5 gx-md-4 gx-2 justify-content-center">
		<div class="col-12 col-md-10 col-lg-6 p-3 p-md-5 p-lg-5 pt-4">
			<div class="card">
				<img
					src="{{ asset('public/frontend/assets/img/banner/banner1.jpg') }}"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title text-center">XEM LẠI ĐƠN CỦA BẠN</h5>
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
											<!-- 	<th>Tổng</th> -->
											<th></th>
										</tr>
									</thead>
									<tbody>


										<c:set var="total" value="0" />

										<c:forEach var="item" items="${cartItems }">
											<c:set var="qty" value="${item.food_qty }" />
											<c:set var="price" value="${item.food_price }" />
											<c:set var="total" value="${ total + (qty * price) }" />

											<tr class="cart-items-info">
												<input type="hidden" value="">
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


										<tr class="m-1">
											<td colspan="6"><label class="form-check-label"
												style="font-weight: bold" for="flexRadioDefault2"> <i
													class="fa-solid fa-truck-fast"></i> Phí Ship: <fmt:formatNumber
														value="${feeship.feeFeeship }" pattern="#,###.##" /> đ
											</label></td>
										</tr>



										<c:if test="${ not empty sessionScope.cart}">
											<tr class="cart-total">
												<td colspan="2" class="cart-total-title">Tổng cuối:</td>
												<td colspan="4" id="load-total" class="cart-total-price ">
													<fmt:formatNumber value="${total + feeship.feeFeeship}"
														pattern="#,###.##" /> đ

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

															<p>
																Tổng giảm:
																<fmt:formatNumber value="${total_coupon }"
																	pattern="#,###.##" />
																đ
															</p>
														</td>
														<tr class="cart-total">
															<td colspan="2" class="cart-total-title">Tổng cuối:
																<span
																style="color: #9c9c9c; font-size: 1rem; font-weight: 400"></span>
															</td>
															<td colspan="4" id="load-total" class="cart-total-price">
																<fmt:formatNumber
																	value="${total - total_coupon + feeship.feeFeeship}"
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
															<td colspan="2" class="cart-total-title">Tổng cuối:
																<span
																style="color: #9c9c9c; font-size: 1rem; font-weight: 400"></span>
															</td>
															<td colspan="4" id="load-total" class="cart-total-price">
																<fmt:formatNumber
																	value="${total_coupon + feeship.feeFeeship }"
																	pattern="#,###.##" /> đ
															</td>
														</tr>
													</c:when>
												</c:choose>
											</tr>
										</c:if>
									<tbody>


										<tr class="m-1">
											<td colspan="6" class="border border-0"><input
												class="form-check-input" type="radio" value="1"
												name="payment_method" id="flexRadioDefault2" checked>
												<label class="form-check-label" for="flexRadioDefault2">
													Thanh toán khi nhận hàng </label></td>
										</tr>
										<tr class="m-1">
											<td colspan="6"><input class="form-check-input"
												type="radio" value="2" name="payment_method"
												id="flexRadioDefault1"> <label
												class="form-check-label" for="flexRadioDefault1">
													Thanh toán trực tuyến </label></td>
										</tr>
										
										
										<tr>
										<c:url var="order" value="/dat-hang" />
											<td colspan="6" class="border border-0 text-center">
											<a type="submit" href="${order }" class="btn btn-danger w-100 p-2"  name="order">Đặt hàng</a>
												</td>
										</tr>
									</tbody>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	$('.btn-update-cart')
			.on(
					'click',
					function() {
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
								var formattedPrice = parseFloat(data_price)
										.toLocaleString('vi-VN', {
											style : 'currency',
											currency : 'VND'
										});
								var totalFormatted = parseFloat(total)
										.toLocaleString('vi-VN', {
											style : 'currency',
											currency : 'VND'
										});
								var couponPriceFormatted = parseFloat(
										coupon_price).toLocaleString('vi-VN', {
									style : 'currency',
									currency : 'VND'
								});
								$('#load-price').html(
										'<p>' + formattedPrice + '</p>');
								$('#load-total').html(
										'<p>' + totalFormatted + '</p>');
								$('#total-coupon').html(
										'<p>' + couponPriceFormatted + '</p>');

							},
							error : function(data) {
								alert("Fix Bug Huhu :<");
							},
						});
					});
</script>


