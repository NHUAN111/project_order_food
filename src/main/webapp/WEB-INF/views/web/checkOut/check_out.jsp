<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


    <div class="row gx-lg-5 gx-md-4 gx-2 justify-content-center mt-5">
        <div class="col-12 col-md-10 col-lg-6 p-3 p-md-5 p-lg-5 card mt-5">
            <div class=" ">
							
                     <s:form class="form-info-shipping" modelAttribute="shipping" action="/webfood/thong-tin-van-chuyen" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <h4 class="form-title text-center">Nhập Thông Tin Của Bạn</h4>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-md-6">
                                <input type="text" class="form-control p-2" id="name_user" aria-describedby="emailHelp"
                                    name="shippingName" placeholder="Tên của quý khách" value="" required>
                                <span class="form-message text-danger"></span>
                            </div>
                            <div class="mb-3 col-md-6">
                                <input type="text" class="form-control p-2" id="phone_user" aria-describedby="emailHelp"
                                    name="shippingPhone" placeholder="Số điện thoại của quý khách" value="" required>
                                <span class="form-message text-danger"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control p-2" id="email" aria-describedby="emailHelp"
                                name="shippingEmail" placeholder="Nhập Email để xem đơn hàng" required>
                            <span class="form-message text-danger"></span>
                        </div>
                       
                       
                        <div class="form-group mb-3">
                            <div>
                                <select name="city" id="city" class="form-control choose city p-2"
                                    id="exampleInputUsername1" required>
                                    <option value>--Chọn tỉnh thành phố--</option>
                                    <c:forEach var="item" items="${list_city }">
                                       <option value="${item.maTp }">${item.nameCity }</option>
                                    
                                    </c:forEach>
                                   	
                                </select>
                                <span class="form-message text-danger"></span>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div>
                                <select name="province" id="province" class="form-control choose province p-2"
                                    id="exampleInputUsername1" required>
                                    <option value="">--Chọn quận huyện--</option>
                                </select>
                                <span class="form-message text-danger"></span>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <div>
                                <select name="wards" id="wards" class="form-control wards p-2"
                                    id="exampleInputUsername1" required> 
                                    <option value="">--Chọn xã phường--</option>
                                </select>
                                <span class="form-message text-danger"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control p-2 calculate_delivery" id="address" aria-describedby="emailHelp"
                                name="shippingAddress" placeholder="Địa chỉ, số nhà..." required>
                            <span class="form-message text-danger"></span>
                        </div>
    
                        <div class="mb-3">
                            <textarea type="text" rows="5" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                name="shippingNotes" placeholder="Ghi chú của khách hàng *"></textarea>
                        </div>
                        <input type="submit" class="btn btn-danger w-100 p-2" id="submit-info-shipping"
                            value="Xác nhận đơn hàng">
                    </s:form>
                    
                    
                    
                    <%-- <c:url var="login" value="/dang-nhap" />
                    <div class="mb-3 text-center mt-3">
                        Bạn có tài khoản. Đăng nhập
                        <a type="submit" class="text-decoration-none" href="${login }">tại đây</a>
                    </div> --%>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        
        <script>
	$('.choose').on('change', function() {
		var action = $(this).attr('id');
		var matp = $(this).val();
		var result = '';

		if (action == 'city') {
			result = 'province';
		} else {
			result = 'wards';
		}

		var data = {
			action: action,
			maTp : matp
		};

		$.ajax({
			url : '/webfood/admin/feeship/select-delivery',
			method : 'POST',
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data) {
				$('#' + result).html(data);
			},
			error : function() {
				alert('lỗi 4');
			}
		});
	});

	
	 $(document).ready(function() {
         $('.calculate_delivery').click(function() {
             var fee_matp = $('.city').val();
             var fee_maqh = $('.province').val();
             var fee_xaid = $('.wards').val();
            	
             var url = '/webfood/calculate-fee?fee_matp='
					+ encodeURIComponent(fee_matp) 
					+ "&fee_maqh="+ fee_maqh
					+"&fee_xaid="+ encodeURIComponent(fee_xaid);
             
             $.ajax({
                 url: url,
                 method: 'GET',
                 success: function(data) {
                     
                 },
                 error: function() {
                     alert('error calculate-fee');
                 }
             });
         });
     });
</script>
        
        

   