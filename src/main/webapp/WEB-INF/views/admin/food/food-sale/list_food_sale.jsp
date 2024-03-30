<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


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
					<div class="col-sm-2" style="float: right; margin-bottom: 33px;">
						<div class="input-group">
							<a style="text-decoration: none" href="">
								<button id="bin" type="button"
									class="btn btn-gradient-danger btn-icon-text"></button>
							</a>
						</div>
					</div>
					<h1 class="card-title">Liệt kê món ăn giảm giá</h1>
					<table class="table-bordered table">
						<thead>
							<tr>
								<th style="font-weight: bold;">#ID</th>
								<th style="font-weight: bold;">Tên món ăn</th>
								<th style="font-weight: bold;">Hình ảnh</th>
								<th style="font-weight: bold;">Giá</th>
								<th style="font-weight: bold;">Danh mục</th>
								<th style="font-weight: bold;">Số giảm</th>
								<th style="font-weight: bold;">Giá cuối</th>
								<th style="font-weight: bold;">Hiển thị</th>
								<th style="font-weight: bold;">Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list_food}">

								<tr>
									<td>${item.foodId}</td>
									<td>${item.foodName}</td>
									<td><img alt=""
										src="<c:url value='/template/admin/assets/upload/MonAn/${item.foodImg}' />">
									</td>
									<td><fmt:formatNumber value="${item.foodPrice}"
											pattern="#,###.##" /></td>
									<td>${item.category.categoryName}</td>

									<c:choose>
										<c:when test="${item.foodCondition == 2}">
											<c:set var="foodNumber" value="${item.foodNumber}" />
											<td class="card-text " name="price "><fmt:formatNumber
													value="${foodNumber }" pattern="#,###.##" /> đ</td>
										</c:when>

										<c:when test="${item.foodCondition == 1}">
											<td>${item.foodNumber}%</td>

										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${item.foodCondition == 2}">
											<c:set var="foodPrice"
												value="${item.foodPrice - item.foodNumber}" />
											<td class="card-text " name="price "><fmt:formatNumber
													value="${foodPrice }" pattern="#,###.##" /> đ</td>
										</c:when>

										<c:when test="${item.foodCondition == 1}">
											<c:set var="foodPrice"
												value="${item.foodPrice - ((item.foodPrice * item.foodNumber) / 100)}" />
											<td class="card-text " name="price "><fmt:formatNumber
													value="${foodPrice }" pattern="#,###.##" /> đ</td>
										</c:when>
									</c:choose>





									<td><c:url var="updateStatus"
											value="/admin/food/update-status">
											<c:param name="food_id" value="${item.foodId}" />
										</c:url> <c:choose>
											<c:when test="${item.foodStatus == 0}">
												<a href="${updateStatus }"> <i class="mdi mdi-lock-open"
													style="color: green; font-size: 1.2rem;"></i>
												</a>
											</c:when>

											<c:when test="${item.foodStatus == 1}">
												<a href="${ updateStatus}"> <i class="mdi mdi-lock-open"
													style="color: red; font-size: 1.2rem;"></i>
												</a>
											</c:when>

										</c:choose></td>
									<td>
										<div>
											<c:url var="deleteFood" value="/admin/food/delete-food">
												<c:param name="food_id" value="${item.foodId}" />
											</c:url>
											<a href="${deleteFood}" class="delete-category"> <i
												class="mdi mdi mdi-delete-forever"
												style="color: red; margin-right: 10px; font-size: 1.4rem"></i>
											</a>

											<c:url var="editFood" value="/admin/food/edit-food">
												<c:param name="food_id" value="${item.foodId}" />
											</c:url>
											<a href="${editFood }"> <i class="mdi mdi-open-in-new"
												style="color: green; font-size: 1.2rem"></i>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>




					</table>
				</div>
			</div>
			<ul id="pagination" class="pagination-lg"></ul>

		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 35,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					console.info(page + '(from options)');
				}
			});
		});
	</script>

</body>
</html>