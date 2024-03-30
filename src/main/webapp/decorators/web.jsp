<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="<c:url value='/template/web/assets/img/banner/logo.jpg'/>" sizes="32x32">
<!-- Css -->
<link rel="stylesheet"  href="<c:url value='/template/web/assets/css/main.css'/>">
<link rel="stylesheet"  href="<c:url value='/template/web/assets/css/responive.css'/>">

<link rel="stylesheet" href="<c:url value='/template/web/assets/owlcarousel/assets/owl.carousel.min.css'/>">

<!-- Icons -->
<link rel="stylesheet"  href="<c:url value='/template/web/assets/fonts/fontawesome-free-6.2.0-web/css/all.min.css'/>">

<!-- Bootstrap CSS v5.2.0-beta1 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body class="main">
	

	<!-- header -->
	<%@ include file="/common/web/header.jsp"%>

	<!-- body -->
	<dec:body/>
	
	<!-- footer -->
	<%@ include file="/common/web/footer.jsp"%>

	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk "
		crossorigin="anonymous ">
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js "
		integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK "
		crossorigin="anonymous ">
    </script>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="<c:url value='/template/web/assets/js/main.js'/>"></script>
	<script src="<c:url value='/template/web/assets/owlcarousel/owl.carousel.min.js'/>"></script>
	
	 <script>
        load_count_cart();

        function load_count_cart() {
            $.ajax({
                url: '/webfood/count-cart',
                method: 'GET',
                success: function(data) {
                    if (data == 0) {
                        $('#list-cart').html(
                            '<span style="position: absolute; top: -27px; right: 14px; padding: 1px 5px;font-size: 0.9rem; line-height: 1rem; border-radius: 10px; color: #fff; background-color: #dc3545; border: 2px solid #fff">0</span>'
                        );
                    } else {
                        $('#list-cart').html(
                            '<span style="position: absolute; top: -27px; right: 14px; padding: 1px 5px;font-size: 0.9rem; line-height: 1rem; border-radius: 10px; color: #fff; background-color: #dc3545; border: 2px solid #fff">' +
                            data + '</span>');
                    }
                },
                error: function() {
                    // alert("Bug Huhu :<<");
                }
            })
        }
    </script>
    
    

</body>
</html>