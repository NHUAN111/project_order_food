<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>

<c:set var="currentDate" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy/MM/dd" value="${currentDate}"
	var="formattedDate" />






<div class="col-lg-10 stretch-card">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-12 stretch-card">
				<div class="card">
					<div class="card-body">
						<h1 class="card-title">Liệt kê mã giảm giá</h1>
						<table class="table-bordered table">
							<thead>
								<tr>
									<th style="font-weight: bold;">Tên mã giảm giá</th>
									<th style="font-weight: bold;">Mã giảm giá</th>
									<th style="font-weight: bold;">Số lượng</th>
									<th style="font-weight: bold;">Số giảm</th>
									<th style="font-weight: bold;">Tình trạng</th>
									<th style="font-weight: bold;">Ngày bắt đầu</th>
									<th style="font-weight: bold;">Ngày kết thúc</th>
									<th style="font-weight: bold;">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list_coupon }">
									<c:set var="currentDates" value="${currentDate }" />
									<tr>
										<td>${item.couponName}</td>
										<td>${item.couponCode}</td>
										<td>${item.couponQty}</td>

										<c:choose>
											<c:when test="${item.couponCondition == 1}">
												<td >${item.couponNumber}%</td>
											</c:when>
											<c:when test="${item.couponCondition == 2}">

												<td><fmt:formatNumber
														value="${item.couponNumber}" pattern="#,###.##" /> đ</td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${item.couponEnd >= formattedDate}">
												<td  style="color: green; font-weight: bold;">Còn hạn</td>
											</c:when>
											<c:when test="${item.couponStart <= formattedDate}">
												<td style="color: red; font-weight: bold;">Hết hạn</td>

											</c:when>
										</c:choose>
										<td>${item.couponStart}</td>
										<td>${item.couponEnd}</td>

										<td><c:url var="deleteCoupon"
												value="/admin/coupon/delete-coupon">
												<c:param name="coupon_id" value="${item.couponId}" />
											</c:url> <a href="${deleteCoupon}" class="delete-category"> <i
												class="mdi mdi mdi-delete-forever"
												style="color: red; margin-right: 10px; font-size: 1.4rem"></i>
										</a> <c:url var="editCoupon" value="/admin/coupon/edit-coupon">
												<c:param name="coupon_id" value="${item.couponId}" />
											</c:url> <a href="${editCoupon }"> <i class="mdi mdi-open-in-new"
												style="color: green; font-size: 1.2rem"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
