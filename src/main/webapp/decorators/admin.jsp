<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Trang quản lý</title>

<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">


<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/vendors/css/vendor.bundle.base.css'/>">

<!-- Layout styles -->
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/css/style.css'/>">

<!-- End layout styles -->
<link rel="shortcut icon"
	href="<c:url value='/template/admin/assets/images/favicon.ico'/>" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<!-- d -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
</head>


<body>

	<!-- header -->
	<%@ include file="/common/admin/header.jsp"%>
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
		<!-- partial:partials/_sidebar.html -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<ul class="nav">
				<li class="nav-item nav-profile"><a href="#" class="nav-link">
						<div class="nav-profile-image">
							<img
								src="<c:url value='/template/admin/assets/images/faces/face1.jpg'/>">
							<span class="login-status online"></span>
							<!--change to offline or busy as needed-->
						</div>
						<div class="nav-profile-text d-flex flex-column">
							<span class="font-weight-bold mb-2">Nhuận</span> <span
								class="text-secondary text-small">Quản lý dự án</span>
						</div> <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
				</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/admin/home'/>"> <span class="menu-title">Dashboard</span>
						<i class="mdi mdi-home menu-icon"></i>
				</a></li>

				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-order"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Quản lý đơn hàng</span> <i class="menu-arrow"></i>
						<i class="mdi mdi-clipboard-text menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-order">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/order/view-order'/>">Đơn hàng</a></li>

						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-category"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Thể loại</span> <i class="menu-arrow"></i> <i
						class="mdi mdi-seal menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-category">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/category/add'/>">Thêm thể loại</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/category/list'/>">Liệt kê thể
									loại</a></li>
						</ul>
					</div></li>



				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-food"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Sản phẩm</span> <i class="menu-arrow"></i> <i
						class="mdi mdi mdi-food menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-food">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/food/add-food'/>">Thêm sản phẩm</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/food/list-food'/>">Liệt kê sản
									phẩm</a></li>

							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/food/list-food-sale'/>">Sản phẩm
									giảm giá</a></li>

						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-coupon"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Mã giảm giá</span> <i class="menu-arrow"></i> <i
						class="mdi mdi-sale menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-coupon">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/coupon/add-coupon'/>">Thêm mã
									giảm</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/coupon/list-coupon'/>">Liệt kê mã
									giảm</a></li>
						</ul>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-slide"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Quản lý slide</span> <i class="menu-arrow"></i>
						<i class="mdi mdi-image-multiple menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-slide">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/slide/add-slide'/>">Thêm slide </a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/slide/list-slide'/>">Liệt slide </a></li>
						</ul>
					</div></li>


				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#ui-basic-feeship"
					aria-expanded="false" aria-controls="ui-basic"> <span
						class="menu-title">Phí vận chuyển</span> <i class="menu-arrow"></i>
						<i class="mdi mdi-truck-delivery menu-icon"></i>
				</a>
					<div class="collapse" id="ui-basic-feeship">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/feeship/add-feeship'/>">Thêm phí
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/admin/feeship/list-feeship'/>">Danh
									sách </a></li>
						</ul>
					</div></li>
		</nav>

		<dec:body />

		<!-- footer -->
		<%@ include file="/common/admin/footer.jsp"%>


		<script
			src="<c:url value='/template/admin/assets/vendors/js/vendor.bundle.base.js'/>"></script>
		<script
			src="<c:url value='/template/admin/assets/vendors/chart.js/Chart.min.js'/>"></script>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script
			src="<c:url value='/template/admin/assets/js/jquery.cookie.js'/>"
			type="text/javascript"></script>

		<script src="<c:url value='/template/admin/assets/js/off-canvas.js'/>">
			
		</script>
		<script
			src="<c:url value='/template/admin/assets/js/hoverable-collapse.js'/>"></script>
		<script src="<c:url value='/template/admin/assets/js/misc.js'/>"></script>

		<script src="<c:url value='/template/admin/assets/js/dashboard.js'/>"></script>
		<script src="<c:url value='/template/admin/assets/js/todolist.js'/>"></script>

		<script src="//code.jquery.com/jquery.min.js"></script>
		<script
			src="<c:url value='/template/admin/assets/paging/jquery.twbsPagination.js'/>"></script>
		<script
			src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>

		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.12.4.js"></script>
		<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


		<!-- {{-- Toastr --}} -->
		<script src="http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
		<!--   {!! Toastr::message() !!} -->
		<script>
        function message_toastr(type, content) {
            Command: toastr[type](content)
            toastr.options = {
                "closeButton": true,
                "debug": true,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": true,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>

		<script>
			$("#datepicker_start").datepicker({
				numberOfMonths : 1,
				dateFormat : 'yy/mm/dd',
				onSelect : function(selectdate) {
					var dt = new Date(selectdate);
					dt.setDate(dt.getDate() + 1)
					$("#datepicker_end").datepicker("option", "minDate", dt);
				}
			});

			$("#datepicker_end").datepicker({
				numberOfMonths : 1,
				dateFormat : 'yy/mm/dd',
				onSelect : function(selectdate) {
					var dt = new Date(selectdate);
					dt.setDate(dt.getDate() - 1)
					$("#datepicker_start").datepicker("option", "maxDate", dt);
				}
			});
		</script>
</body>
</html>