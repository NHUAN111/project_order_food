<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="col-lg-12 stretch-card">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Cập nhật món</h3>
		</div>
		<div class="row">
			<div class="col-md-10 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<s:form class="forms-sample" id="form-food"
							modelAttribute="food-model"
							action="/webfood/admin/food/update-food" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputUsername1">Tên món ăn</label> <input
									value="${food_detail.foodName}" data-validation="length"
									data-validation-length="min3"
									data-validation-error-msg="Bạn chưa điền thông tin"
									name="foodName" type="text" class="form-control" id="name_food"
									placeholder="Điền tên món ăn"> <span
									class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Giá món ăn</label> <input
									value="${food_detail.foodPrice }" name="foodPrice" type="text"
									class="form-control" id="price_food"
									placeholder="Điền giá món ăn"> <span
									class="form-message text-danger"></span>
							</div>
							
							<input hidden name="imagePhoto"
								value="${ food_detail.foodImg }" />
							<input hidden name="foodId" value="${ food_detail.foodId }" />
							
							<div class="form-group">
								<label for="exampleInputUsername1">Hình ảnh món ăn</label> <input
									name="image" type="file" class="form-control" id="image_food">
									<img alt="" height="100px"
									src="<c:url value='/template/admin/assets/upload/MonAn/${food_detail.foodImg}' />">
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Mô tả món ăn</label>
								<textarea name="foodDesc" rows="10" type="text"
									class="form-control" id="desc_food"
									placeholder="Điền mô tả món ăn">${food_detail.foodDesc }</textarea>
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Nội dung món ăn</label>
								<textarea name="foodContent" rows="5" type="text"
									class="form-control" id="content_food"
									placeholder="Điền nội dung món ăn">${ food_detail.foodContent}</textarea>
								<span class="form-message text-danger"></span>
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">Thể loại món ăn</label> <select
									name="categoryId">
									<c:forEach var="item" items="${list_category}">
										<c:choose>
											<c:when
												test="${item.categoryStatus == 0 && item.categoryId == food_detail.category.categoryId}">
												<!-- Hiển thị danh mục của món ăn đó lên đầu -->
												<option value="${item.categoryId}" selected>${item.categoryName}</option>
											</c:when>
											<c:otherwise>
												<!-- Hiển thị các danh mục còn lại -->
												<option value="${item.categoryId}">${item.categoryName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>


							<div class="form-group">
								<label for="exampleInputUsername1">Cấu hình cho món ăn</label> <select
									name="foodCondition" class="form-control btn-food-sale"
									id="exampleInputUsername1">
									<c:choose>
									
										<c:when test="${food_detail.foodCondition == 0}">
											<option value="0" selected>Không giảm giá</option>
											<option value="1">Giảm giá theo %</option>
											<option value="2">Giảm giá theo tiền</option>
										</c:when>

										<c:when test="${food_detail.foodCondition == 1}">
											<option value="0">Không giảm giá</option>
											<option value="1" selected>Giảm giá theo %</option>
											<option value="2">Giảm giá theo tiền</option>
										</c:when>

										<c:when test="${food_detail.foodCondition == 2}">
											<option value="0">Không giảm giá</option>
											<option value="1">Giảm giá theo %</option>
											<option value="2" selected>Giảm giá theo tiền</option>
										</c:when>
									</c:choose>
									
								</select>
							</div>


							<div class="form-group form-group-sale" style="display: none">
								<label for="exampleInputUsername1">Số giảm</label> <input value="${food_detail.foodNumber }"
									name="foodNumber" class="form-control" id="number_food">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Hiển thị</label>
								<div>
									<select name="foodStatus" id="" class="form-control"
										id="exampleInputUsername1">
										<option value="0">Hiển thị</option>
										<option value="1">Ẩn</option>
									</select>
								</div>
							</div>
							<button type="submit"
								class="btn btn-gradient-primary me-2 add-food">Cập nhật</button>
							<button class="btn btn-light">Cancel</button>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$('.btn-food-sale').click(function() {
		var food_condition = $(this).val();
		if (food_condition == 0) {
			$('.form-group-sale').hide();
		} else {
			$('.form-group-sale').show();
		}
	});
</script>

