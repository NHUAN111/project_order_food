<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

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
				<h1 class="card-title">Liệt kê thể loại</h1>
				<table class="table-bordered table">
					<thead>
						<tr>
							<th style="font-weight: bold;">#ID</th>
							<th style="font-weight: bold;">Tên danh mục</th>
							<th style="font-weight: bold;">Hình ảnh</th>
							<th style="font-weight: bold;">Hiển thị</th>
							<th style="font-weight: bold;">Chức năng</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${list_category}">
							
							<tr>
								<td>${item.categoryId}</td>
								<td>${item.categoryName}</td>
								<td><img alt=""
									src="<c:url value='/template/admin/assets/upload/TheLoai/${item.categoryImg}' />">
								</td>
								<td>
									<c:url var="updateStatus"
										value="/admin/category/update-status">
										<c:param name="category_id" value="${item.categoryId}" />
									</c:url> <c:choose>
										<c:when test="${item.categoryStatus == 0}">
											<a href="${updateStatus }"> <i class="mdi mdi-lock-open"
												style="color: green; font-size: 1.2rem;"></i>
											</a>
										</c:when>

										<c:when test="${item.categoryStatus == 1}">
											<a href="${ updateStatus}"> <i class="mdi mdi-lock-open"
												style="color: red; font-size: 1.2rem;"></i>
											</a>
										</c:when>

									</c:choose></td>
								<td>
									<div>
									<c:url var="deleteCategory" value="/admin/category/delete">
								<c:param name="category_id" value="${item.categoryId}" />
							</c:url>
										<a href="${deleteCategory}" class="delete-category"> <i
											class="mdi mdi mdi-delete-forever"
											style="color: red; margin-right: 10px; font-size: 1.4rem"></i>
										</a> 
										
										<c:url var="editCategory" value="/admin/category/edit">
											<c:param name="category_id" value="${item.categoryId}" />
										</c:url> 
										<a href="${editCategory }"> <i class="mdi mdi-open-in-new"
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
	</div>

</div>
