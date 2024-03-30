<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="col-lg-12 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Quản lý phí vận chuyển</h3>
		</div>
		<div class="row">
			<div class="col-md-10 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<table class="table-bordered table">
							<thead>
								<tr>
									<th style="font-weight: bold;">Thành phố</th>
									<th style="font-weight: bold;">Quân huyện</th>
									<th style="font-weight: bold;">Xã phường</th>
									<th style="font-weight: bold;">Phí vận chuyển</th>
									<th style="font-weight: bold;">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list_feeship}">
									<tr class="table">
										<td>${item.citys.nameCity}</td>
										<td>${item.districts.nameQuanhuyen}</td>
										<td>${item.wards.nameXaphuong}</td>
										<td><fmt:formatNumber value="${item.feeFeeship}"
												pattern="#,###.##" /> đ</td>
										<td><c:url var="deleteFeeship"
												value="/admin/feeship/delete-feeship">
												<c:param name="fee_id" value="${item.feeId}" />
											</c:url> <a href="${deleteFeeship}" class="delete-category"> <i
												class="mdi mdi mdi-delete-forever"
												style="color: red; margin-right: 10px; font-size: 1.4rem"></i>
										</a>
										
										 <c:url var="editFeeship" value="/admin/feeship/edit-feeship">
												<c:param name="fee_id" value="${item.feeId}" />
											</c:url> <a href="${editFeeship }"> <i class="mdi mdi-open-in-new"
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