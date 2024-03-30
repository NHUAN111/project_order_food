<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container" style="margin-top: 100px">
	<div class="row g-lg-3 g-md-4 g-2 justify-content-center">
		<div class="col-12 col-md-12 col-lg-8">
			<div class="card pt-4 p-lg-2 p-md-2 p-2">
				<div class="mb-3">
					<h4 class="form-title text-center fs-4 text-dark">Lịch sử đặt hàng</h4>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Mã đơn</th>
							<th scope="col">Địa chỉ giao hàng</th>
							<th scope="col">Tình trạng</th>
							<th scope="col">Ngày đặt</th>
							<th scope="col">Chức năng</th>
							<th scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${all_orders }">
							<tr>
								<td class="align-middle">${item.orderCode}</td>
								<td class="align-middle text-address-ship">${item.shippingId.shippingAddress }</td>

								<c:url var="cancelOrder" value="/huy-don-hang">
									<c:param name="order_id" value="${item.orderId}" />
								</c:url>


								<c:url var="deleteOrder" value="/xoa-don-hang">
									<c:param name="order_id" value="${item.orderId}" />
								</c:url>

								<c:choose>
									<c:when test="${item.orderStatus == 0}">
										<td class="align-middle"
											style="color: green; font-weight: bold;">Đang Chờ Duyệt</td>
										<td class="align-middle">${item.createdAt }</td>
										<td class="align-middle" style="cursor: pointer"><i
											class="fa-solid fa-circle-xmark fw-border text-danger"></i> <a
											href="${cancelOrder}"
											style="color: #fff; text-decoration: none"
											class="btn-cancel-order text-danger fw-bold">Huỷ Đơn</a></td>
									</c:when>
									<c:when test="${item.orderStatus == 1}">
										<td class="align-middle"
											style="color: blue; font-weight: bold;">Đơn Đã Duyệt</td>
										<td class="align-middle">${item.createdAt }</td>
										<td class="align-middle" style="cursor: pointer"><i
											class="fa fa-trash-o" aria-hidden="true"></i> <a
											href="${deleteOrder}"
											style="color: #fff; text-decoration: none"
											class="btn-cancel-order text-danger fw-bold">Xóa đơn</a></td>
									</c:when>
									<c:when test="${item.orderStatus == 2}">
										<td class="align-middle"
											style="color: red; font-weight: bold;">Đơn Bị Huỷ</td>
										<td class="align-middle">${item.createdAt }</td>
										<td class="align-middle" style="cursor: pointer"><i
											class="fa fa-trash-o" aria-hidden="true"></i> <a
											href="${deleteOrder}"
											style="color: #fff; text-decoration: none"
											class="btn-cancel-order text-danger fw-bold">Xóa đơn</a></td>
									</c:when>
									<c:when test="${item.orderStatus == 3}">
										<td class="align-middle"
											style="color: red; font-weight: bold;">Đơn Bị Từ Chối</td>
										<td class="align-middle">${item.createdAt }</td>
										<td class="align-middle" style="cursor: pointer"><i
											class="fa fa-trash-o" aria-hidden="true"></i></i> <a
											href="${deleteOrder}"
											style="color: #fff; text-decoration: none"
											class="btn-cancel-order text-danger fw-bold">Xóa đơn</a></td>
									</c:when>
									<c:when test="${item.orderStatus == 4}">
										<td class="align-middle"
											style="color: green; font-weight: bold;">Đơn Giao Thành
											Công</td>
										<td class="align-middle">${item.createdAt }</td>
										<td class="align-middle" style="cursor: pointer"><i
											class="fa fa-trash-o" aria-hidden="true"></i> <a
											href="${deleteOrder}"
											style="color: #fff; text-decoration: none"
											class="btn-cancel-order text-danger fw-bold">Xóa đơn</a></td>
									</c:when>
								</c:choose>

								<c:url var="detailOrder" value="/chi-tiet-don-hang">
									<c:param name="order_code" value="${item.orderCode}" />
								</c:url>

								<td class="align-middle"><a style="text-decoration: none"
									href="${detailOrder }"> <i class="fa fa-info-circle"
										aria-hidden="true"></i> Xem
								</a></td>



							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


