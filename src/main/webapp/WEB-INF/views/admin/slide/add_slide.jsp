<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col-lg-10 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Thêm Slide</h3>
		</div>
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<s:form class="forms-sample" action="/webfood/admin/slide/save-slide" modelAttribute="slideModel"
							method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputUsername1">Ảnh Slider</label> <input
									name="files" accept="image/*" multiple type="file"
									class="form-control" id="file exampleInputUsername1"> <span
									id="error_slider"></span>
							</div>
							<button type="submit" class="btn btn-gradient-primary me-2">Thêm
								slider</button>
							<button class="btn btn-light">Thoát</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>