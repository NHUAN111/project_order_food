<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<div class="container" style="margin-top: 100px">
	<div class="row g-lg-3 g-md-4 g-2 justify-content-center">
		<div class="col-12 col-md-12 col-lg-6">
			<div class="card pt-4 p-lg-2 p-md-2 p-2">
				<div class="mb-3">
					<h4 class="form-title text-center fs-4 text-dark">Đơn Hàng Của
						Bạn</h4>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Ảnh</th>
							<th scope="col">Tên Món</th>
							<th scope="col">SL</th>
							<th scope="col">Giá</th>
							<th scope="col">Tổng</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0" />
						<c:forEach var="item" items="${order_detail}">
							<c:set var="qty" value="${item.foodSalesQuantity }" />
							<c:set var="price" value="${item.foodPrice }" />
							<c:set var="total" value="${ total + (qty * price) }" />
							<tr class="table">
								<td class="align-middle"><img height="40" alt=""
									src="<c:url value='/template/admin/assets/upload/MonAn/${item.food.foodImg}' />">
								</td>
								<td class="align-middle">${item.foodName }</td>
								<td class="align-middle">${item.foodSalesQuantity }</td>



								<td class="align-middle"><fmt:formatNumber
										value="${item.foodPrice}" pattern="#,###.##" /> đ</td>


								<td class="align-middle"><fmt:formatNumber
										value="${item.foodPrice * item.foodSalesQuantity }"
										pattern="#,###.##" /> đ</td>

							</tr>
							<tr>

							</tr>
						</c:forEach>

						<c:set var="couponPriceNumber" value="${order_byId.couponPrice}" />
						<fmt:parseNumber var="parsedcouponPrice"
							value="${couponPriceNumber}" type="number" />

						<c:choose>
							<c:when test="${order_byId.orderCoupon == '0'}">
								<tr>
									<th colspan=5>Mã Giảm: Không Có</th>
								</tr>
								<tr>
									<th colspan=5>Phí Vận Chuyển: <fmt:formatNumber
											value="${order_byId.orderFeeship }" pattern="#,###.##" /> đ
									</th>
								</tr>
								<tr>
									<th colspan=5 class="border-bottom-0">Tổng Đơn: <fmt:formatNumber
											value="${total + order_byId.orderFeeship }"
											pattern="#,###.##" /> đ
									</th>
								</tr>


							</c:when>

							<c:when test="${order_byId.orderCoupon != '0'}">
								<c:choose>
									<c:when test="${ parsedcouponPrice < 100 }">
										<tr>
											<th colspan=5>Mã Giảm: ${order_byId.orderCoupon }</th>
										</tr>

										<c:set var="total_coupon"
											value="${(total * order_byId.couponPrice) / 100 }" />
										
										<tr>
											<th colspan=5>Số Giảm: ${order_byId.couponPrice} %</th>
										</tr>
										<tr>
											<th colspan=5 class="border-bottom-0">Tổng Đơn: <fmt:formatNumber
											value="${ (total - total_coupon) +  order_byId.orderFeeship}"
											pattern="#,###.##" />
											đ
											</th>
										</tr>

									</c:when>

									<c:when test="${ parsedcouponPrice > 100 }">
										<tr>
											<th colspan=5>Mã Giảm: ${order_byId.orderCoupon }</th>

										</tr>

										<tr>
											<th colspan=5>Số Giảm: <c:set var="couponPriceNumber"
													value="${order_byId.couponPrice}" /> <fmt:parseNumber
													var="parsedCouponPrice" value="${couponPriceNumber}"
													type="number" /> <fmt:formatNumber
													value="${parsedCouponPrice}" pattern="#,###.##"
													var="formattedCouponPrice" /> ${formattedCouponPrice } đ
											</th>
										</tr>

										<tr>
											<th colspan=5 class="border-bottom-0">Tổng Đơn: <fmt:formatNumber
													value="${ (total - order_byId.couponPrice) + order_byId.orderFeeship}"
													pattern="#,###.##" /> đ
											</th>

										</tr>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>

					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
