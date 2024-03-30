<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col-lg-10 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Cập nhật thể loại</h3>
		</div>
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<s:form class="forms-sample" id="form-category"
							modelAttribute="category" action="/webfood/admin/category/update"
							method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputUsername1">Tên thể loại</label> <input
									name="categoryName" type="text" class="form-control"
									value="${detail_category.categoryName }" id="name_category"
									placeholder="Điền tên thể loại"> <span
									class="form-message text-danger"></span>
							</div>
							<input hidden name="imagePhoto"
								value="${ detail_category.categoryImg }" />
							<input hidden name="categoryId" value="${ detail_category.categoryId }" />
							<div class="form-group">
								<label for="exampleInputUsername1">Hình ảnh sản phẩm</label> <input
									name="image" type="file" class="form-control"
									id="image_category"> <span
									class="form-message text-danger"></span> <img alt="" height="100px"
									src="<c:url value='/template/admin/assets/upload/TheLoai/${detail_category.categoryImg}' />">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Hiển thị</label>
								<div>
									<select name="categoryStatus" class="form-control"
										id="exampleInputUsername1">

										<option value="0">Hiển thị</option>

										<option value="1">Ẩn</option>


									</select>
								</div>
							</div>
							<button type="submit"
								class="btn btn-gradient-primary me-2 add-category">Cập nhật</button>
							<button class="btn btn-light">Thoát</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>