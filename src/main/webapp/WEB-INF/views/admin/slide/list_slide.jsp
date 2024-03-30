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
				<h1 class="card-title">Liệt kê món ăn</h1>
				<table class="table-bordered table">
					<thead>
						<tr>
							<th style="font-weight: bold;">#ID</th>
							<th style="font-weight: bold;">Tên hình ảnh</th>
							<th style="font-weight: bold;">Hình ảnh</th>
							<th style="font-weight: bold;">Thời gian tạo</th>
							<th style="font-weight: bold;">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list_slide }">
							<tr>
								<td>${item.sliderId}</td>
								<td>${item.sliderName}</td>
								<td>
									<img src="<c:url value='/template/admin/assets/upload/slider/${item.sliderImg}' />">
								</td>
								<td>${item.createdAt}</td>
								<td>
									<c:url var="deleteSlide" value="/admin/slide/delete-slide">
												<c:param name="slider_id" value="${item.sliderId}" />
											</c:url>
											<a href="${deleteSlide}" class="delete-category"> <i
												class="mdi mdi mdi-delete-forever"
												style="color: red; margin-right: 10px; font-size: 1.4rem"></i>
											</a>
								
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>