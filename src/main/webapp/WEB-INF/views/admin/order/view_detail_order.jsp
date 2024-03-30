<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<div class="content-wrapper">

	<div class="col-lg-12 stretch-card">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">Thông tin người mua (Tài khoản khách)</h1>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="font-weight: bold;">#ID</th>
							<th style="font-weight: bold;">Tên khách hàng</th>
							<th style="font-weight: bold;">Email khách hàng</th>
							<th style="font-weight: bold;">Số điện thoại</th>
						</tr>
					</thead>
					<tbody>

						<tr class="table">

							<c:choose>
								<c:when test="${order_byId.customerId.customerId == 0}">
									<td>#0</td>
									<td>Khách vãng lai</td>
									<td>Trống</td>
									<td>Trống</td>
								</c:when>


								<c:when test="${order_byId.customerId.customerId != 0}">

									<td>${order_byId.customerId.customerName }</td>
									<td>${order_byId.customerId.customerName }</td>
									<td>${order_byId.customerId.customerEmail }</td>
									<td>${order_byId.customerId.customerPhone }</td>
								</c:when>
							</c:choose>


						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<br> <br>

	<div class="col-lg-12 stretch-card">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">Thông tin giao hàng (Khách hàng)</h1>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="font-weight: bold;">#ID</th>
							<th style="font-weight: bold;">Tên</th>
							<th style="font-weight: bold;">Địa chỉ</th>
							<th style="font-weight: bold;">Số điện thoại</th>
							<th style="font-weight: bold;">Email khách hàng</th>
							<th style="font-weight: bold;">Ghi chú *</th>
						</tr>
					</thead>
					<tbody>

						<tr class="table">
							<td>${order_byId.shippingId.shippingId }</td>
							<td>${order_byId.shippingId.shippingName }</td>
							<td>${order_byId.shippingId.shippingAddress }</td>
							<td>${order_byId.shippingId.shippingPhone }</td>
							<td>${order_byId.shippingId.shippingEmail }</td>

							<c:choose>
								<c:when test="${order_byId.shippingId.shippingNotes == 0}">
									<td>Không yêu cầu</td>
								</c:when>

								<c:when test="${order_byId.shippingId.shippingNotes != 0}">
									<td>${order_byId.shippingId.shippingNotes}</td>
								</c:when>
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<br> <br>

	<div class="col-lg-12 stretch-card">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">Liệt kê chi tiết đơn hàng</h1>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="font-weight: bold;">#Mã đơn hàng</th>
							<th style="font-weight: bold;">Tên sản phẩm</th>
							<th style="font-weight: bold;">Số lượng</th>
							<th style="font-weight: bold;">Mã giảm</th>
							<th style="font-weight: bold;">Giá</th>
							<th style="font-weight: bold;">Tổng</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0" />
						<c:forEach var="item" items="${order_detail}">
							<c:set var="qty" value="${item.foodSalesQuantity }" />
							<c:set var="price" value="${item.foodPrice }" />
							<c:set var="total" value="${ total + (qty * price) }" />
							<tr class="table">
								<td>${item.orderCode }</td>
								<td>${item.foodName }</td>
								<td>${item.foodSalesQuantity }</td>

								<c:choose>
									<c:when test="${order_byId.orderCoupon == '0'}">
										<td>Không có mã giảm</td>
									</c:when>

									<c:when test="${order_byId.orderCoupon != '0'}">
										<td>${order_byId.orderCoupon }</td>
									</c:when>
								</c:choose>


								<td><fmt:formatNumber value="${item.foodPrice}"
										pattern="#,###.##" /> đ</td>


								<td><fmt:formatNumber
										value="${item.foodPrice * item.foodSalesQuantity }"
										pattern="#,###.##" /> đ</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row">
					<div class="col-md-12 mt-3">
						<div
							style="display: flex; justify-content: flex-start; margin-top: 10px;">
							<span style="color: red; font-weight: bold">Tổng các món:
								&nbsp; </span>
							<fmt:formatNumber value="${total }" pattern="#,###.##" />
							đ
						</div>

						<!-- chuyển string -> number -->
						<c:set var="couponPriceNumber" value="${order_byId.couponPrice}" />
						<fmt:parseNumber var="parsedcouponPrice"
							value="${couponPriceNumber}" type="number" />

						<c:choose>
							<c:when test="${order_byId.orderCoupon == '0'}">
								<div
									style="display: flex; justify-content: flex-start; margin-top: 10px;">
									<span style="color: red; font-weight: bold">Số giảm:
										&nbsp; </span> Không có mã giảm
								</div>
							</c:when>

							<c:when test="${order_byId.orderCoupon != '0'}">
								<c:choose>
									<c:when test="${ parsedcouponPrice < 100 }">
										<div
											style="display: flex; justify-content: flex-start; margin-top: 10px;">
											<span style="color: red; font-weight: bold">Số giảm:
												&nbsp</span> ${order_byId.couponPrice} %
										</div>
									</c:when>

									<c:when test="${parsedcouponPrice > 100}">
										<div
											style="display: flex; justify-content: flex-start; margin-top: 10px;">
											<span style="color: red; font-weight: bold">Số giảm:
												&nbsp</span>
											<c:set var="couponPriceNumber"
												value="${order_byId.couponPrice}" />

											<fmt:parseNumber var="parsedCouponPrice"
												value="${couponPriceNumber}" type="number" />
											<fmt:formatNumber value="${parsedCouponPrice}"
												pattern="#,###.##" var="formattedCouponPrice" />
											${formattedCouponPrice } đ
										</div>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>


						<!-- Tính phí ship -->
						<c:set var="feeShipNumber" value="${order_byId.orderFeeship}" />
						<fmt:parseNumber var="parsedFeeShipPrice" value="${feeShipNumber}"
							type="number" />
						<fmt:formatNumber value="${parsedFeeShipPrice}" pattern="#,###.##"
							var="formattedFeeShipPrice" />

						<div
							style="display: flex; justify-content: flex-start; margin-top: 10px;">
							<span style="color: red; font-weight: bold">Phí vận
								chuyển: &nbsp; </span> ${formattedFeeShipPrice } đ
						</div>


						<!-- Tính tống đơn hàng -->
						<c:choose>

							<c:when test="${order_byId.orderCoupon == '0'}">
								<div
									style="display: flex; justify-content: flex-start; margin-top: 10px;">
									<span style="color: red; font-weight: bold">Tổng Đơn
										Hàng: &nbsp; </span>
									<fmt:formatNumber value="${total + order_byId.orderFeeship }"
										pattern="#,###.##" />
									đ
								</div>
							</c:when>


							<c:when test="${order_byId.orderCoupon != '0'}">
								<c:choose>
									<c:when test="${parsedcouponPrice < 100}">
										<div
											style="display: flex; justify-content: flex-start; margin-top: 10px;">
											<span style="color: red; font-weight: bold">Tổng Đơn
												Hàng: &nbsp; </span>
											<c:set var="total_coupon"
												value="${(total * order_byId.couponPrice) / 100 }" />
											<fmt:formatNumber
												value="${ (total - total_coupon) +  order_byId.orderFeeship}"
												pattern="#,###.##" />
											đ
										</div>
									</c:when>


									<c:when test="${parsedcouponPrice> 100}">
										<div
											style="display: flex; justify-content: flex-start; margin-top: 10px;">
											<span style="color: red; font-weight: bold">Tổng Đơn
												Hàng: &nbsp; </span>

											<fmt:formatNumber
												value="${ (total - order_byId.couponPrice) + order_byId.orderFeeship}"
												pattern="#,###.##" />
											đ
										</div>
									</c:when>
								</c:choose>
							</c:when>

						</c:choose>


						<div class="mt-2">
							<a
								href="{{ url('/admin/order/print-order?order_code='.$order_byId->order_code) }}">
								<button type="button"
									class="btn-sm btn-gradient-info btn-icon-text">
									<i class="mdi mdi-printer"></i> In Hoá Đơn
								</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>