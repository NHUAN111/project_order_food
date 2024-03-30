<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Trang quản lý</title>

</head>


<body>
	<div class="col-lg-10 stretch-card">
		<div class="content-wrapper">
			<div class="card">
				<div class="card-body">
					<h1 class="card-title">Liệt kê đơn hàng</h1>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="font-weight: bold;">STT</th>
								<th style="font-weight: bold;">Mã đơn hàng</th>
								<th style="font-weight: bold;">Tên người đặt</th>
								<th style="font-weight: bold;">Tình trạng</th>
								<th style="font-weight: bold;">Hình thức thanh toán</th>
								<th style="font-weight: bold;">Thời gian đặt</th>
								<th style="font-weight: bold;">Thời gian duyệt</th>
								<th style="font-weight: bold;">Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
								int i = 1;
							%>
							<c:forEach var="item" items="${list_order}">
								<c:set var="created_at" value="${item.createdAt }" />
								<tr class="table">
									<td><%=i++%></td>
									<td>${item.orderCode}</td>
									<c:choose>
										<%-- <c:when test="${item.customerId.customerId == 0}">
											<td>Khách vãng lai</td>
										</c:when> --%>
										
										<c:when test="${item.customerId.customerId != 0}">
											<td>${item.customerId.customerName}</td>
										</c:when>
									</c:choose>
										
									
									<c:choose>
										<c:when test="${item.orderStatus == 0}">
											<td>Đang Chờ Duyệt</td>
										</c:when>

										<c:when test="${item.orderStatus == 1}">
											<td>Đơn Đã Duyệt</td>
										</c:when>

										<c:when test="${item.orderStatus == 2}">
											<td>Đơn Bị Huỷ</td>
										</c:when>

										<c:when test="${item.orderStatus == 3}">
											<td>Đơn Bị Từ Chối</td>
										</c:when>

										<c:when test="${item.orderStatus == 4}">
											<td>Đơn Giao Thành Công</td>
										</c:when>

									</c:choose>

									<c:choose>
										<c:when test="${item.paymentId.paymentMethod == 1}">
											<td>Thanh toán khi nhận hàng</td>
										</c:when>

										<c:when test="${item.paymentId.paymentMethod == 0}">
											<td>Thanh toán trực tuyến</td>
										</c:when>
									</c:choose>

									<td>${item.createdAt }</td>

									<td>${item.updatedAt }</td>

									<td>
										<!-- Xem chi tiết đơn hàng qua orderCode --> 
										<c:url
											var="viewOrderDetail" value="/admin/order/view-order-detail">
											<c:param name="order_code" value="${item.orderCode}" />
										</c:url> 
										
											<c:url
											var="cancelOrder" value="/admin/order/cancel-order">
											<c:param name="order_id" value="${item.orderId}" />
										</c:url>
										
										
										<c:url
											var="deleteOrder" value="/admin/order/delete-order">
											<c:param name="order_id" value="${item.orderId}" />
										</c:url>
										
										
										<c:url
											var="confirmOrder" value="/admin/order/confirm-order">
											<c:param name="order_id" value="${item.orderId}" />
											<c:param name="order_status" value="${item.orderStatus }"/>
										</c:url>
										
										<c:choose>
											<c:when test="${item.orderStatus == 0}">
												<div>
													<a href="${viewOrderDetail }" class="btn btn-gradient-info">
														<i class="mdi mdi-eye"></i> Xem đơn
													</a> <br> <br> 
													<a data-item_id="" href="${cancelOrder }"
														data-item_status="0"
														class="btn btn-gradient-danger cancel-order"> <i
														class="mdi mdi-close-circle"></i> Từ chối
													</a> <br> <br> <a href="${confirmOrder }"
												
														class="btn btn-gradient-success update-status"> <i
														class="mdi mdi-check-circle"></i> Duyệt đơn
													</a>
												</div>

											</c:when>
											<c:when test="${item.orderStatus == 1}">

												<div>
													<a href="${viewOrderDetail }" class="btn btn-gradient-info">
														<i class="mdi mdi-eye"></i> Xem đơn
													</a> <br> <br> <a data-item_id="" href="${deleteOrder }"
														class="btn btn-gradient-danger btn-delete-order"> <i
														class="mdi mdi-delete-sweep"></i> Xóa đơn
													</a> <br> <br> <a 
														 href="${confirmOrder }"
														class="btn btn-gradient-success btn-success-order update-status-success-order">
														<i class="mdi mdi-checkbox-marked-circle"></i> Hoàn thành
													</a>
												</div>
											</c:when>
											
											<c:when test="${item.orderStatus == 2}">
												<div>
													<a href="${viewOrderDetail }" class="btn btn-gradient-info">
														<i class="mdi mdi-eye"></i> Xem đơn
													</a> <br> <br> <a data-item_id="" href="${deleteOrder }"
														class="btn btn-gradient-danger btn-delete-order"> <i
														class="mdi mdi-delete-sweep"></i> Xóa đơn
													</a>
												</div>


											</c:when>
											<c:when test="${item.orderStatus == 3}">

												<div>
													<a href="${viewOrderDetail }" class="btn btn-gradient-info">
														<i class="mdi mdi-eye"></i> Xem đơn
													</a> <br> <br> <a data-item_id="" href="${deleteOrder }"
														class="btn btn-gradient-danger btn-delete-order"> <i
														class="mdi mdi-delete-sweep"></i> Xóa đơn
													</a>
												</div>



											</c:when>
											<c:when test="${item.orderStatus == 4}">

												<div>
													<a href="${viewOrderDetail }" class="btn btn-gradient-info">
														<i class="mdi mdi-eye"></i> Xem đơn
													</a> <br> <br> <a data-item_id="" href="${deleteOrder }"
														class="btn btn-gradient-danger btn-delete-order"> <i
														class="mdi mdi-delete-sweep"></i> Xóa đơn
													</a>
												</div>


											</c:when>
										</c:choose>
									</td>
								</tr>


							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<c:if test="${not empty successMessage}">
        <script>
        message_toastr("error", "Đơn hàng  Đã Từ Chối Thành Công");
        </script>
    </c:if>
</html>




