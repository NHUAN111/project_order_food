<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<c:url var="login" value="/dang-nhap" />
<c:url var="home" value="/trang-chu" />
<c:url var="logout" value="/dang-xuat" />
<c:url var="cart" value="/gio-hang-cua-ban" />
<c:url var="menu" value="/thuc-don" />
<c:url var="orderInfo" value="/thong-tin-don-hang" />
<c:url var="orderInfoNotAccount" value="/kiem-tra-don-hang" />

<div id="header">
	<ul id="nav">
		<li class=""><a href="${home }"> <img
				src="<c:url value='/template/web/assets/img/banner/logo.jpg'/>"
				alt="" class="img__about-logo">
		</a></li>
		<li class="list-group-item"><a class="navbar-item-link"
			href="${home }">Trang Chủ</a></li>
		<li class="list-group-item"><a class="navbar-item-link"
			href="${menu }">Thực Đơn</a></li>
		<li class="list-group-item"><a class="navbar-item-link"
			href="#resume__me">Đang Khuyến Mãi</a></li>
		<li class="list-group-item"><a class="navbar-item-link"
			href="#photo__me">Món Mới </a></li>
		<li class="list-group-item"><a class="navbar-item-link"
			href="#blog__me">Về Chúng Tôi </a></li>


		<li class="list-group-item"><a
			class="navbar-item-link btn btn-outline-light" href="${cart }"> <i
				class="fa-solid fa-cart-shopping" style="color: rgb(144, 143, 143);"></i>

				<div id="list-cart"
					style="position: relative; display: inline-block; padding: 0 12px; cursor: pointer;">
				</div>
		</a></li>



		<li class="list-group-item"><c:if
				test="${ not empty sessionScope.customer}">
				<a class="navbar-item-link" href="${orderInfo }"> <svg
						width="20" height="20" style="color: rgb(144, 143, 143);"
						fill="none">
                        <path
							d="M9.2 1.6v3.022a.756.756 0 00.755.755h3.022" stroke="#1A202C"
							stroke-linecap="round" stroke-linejoin="round"></path>
                        <path
							d="M11.467 15.2H3.91A1.511 1.511 0 012.4 13.689V3.11A1.511 1.511 0 013.91 1.6H9.2l3.778 3.777v8.311a1.511 1.511 0 01-1.511 1.512zM5.422 6.133h.756M5.422 9.155h4.534M5.422 12.178h4.534"
							stroke="#1A202C" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg> <span>Đơn Hàng</span>
				</a>
			</c:if> <c:if test="${empty sessionScope.customer}">
				<a class="navbar-item-link" href="${orderInfoNotAccount }"> <svg
						width="20" height="20" style="color: rgb(144, 143, 143);"
						fill="none">
                        <path
							d="M9.2 1.6v3.022a.756.756 0 00.755.755h3.022" stroke="#1A202C"
							stroke-linecap="round" stroke-linejoin="round"></path>
                        <path
							d="M11.467 15.2H3.91A1.511 1.511 0 012.4 13.689V3.11A1.511 1.511 0 013.91 1.6H9.2l3.778 3.777v8.311a1.511 1.511 0 01-1.511 1.512zM5.422 6.133h.756M5.422 9.155h4.534M5.422 12.178h4.534"
							stroke="#1A202C" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg> <span>Đơn Hàng</span>
				</a>
			</c:if></li>

		<li class="list-group-item"><a class="navbar-item-link"> <c:if
					test="${ not empty sessionScope.customer}">
					<i class="fa-solid fa-user" style="color: rgb(144, 143, 143);"></i>

				</c:if> <c:if test="${empty sessionScope.customer}">
					<i class="fa-solid fa-user-slash"
						style="color: rgb(144, 143, 143);"></i>

				</c:if>

		</a></li>


		<c:if test="${not empty sessionScope.customer}">

			<a href="${logout }">
				<button type="submit" class="btn btn-danger">Đăng xuất</button>
			</a>
		</c:if>
		<c:if test="${empty sessionScope.customer}">

			<li class=""><a class="" href="${login }">
					<button type="submit" class="btn btn-danger">Đăng nhập</button>
			</a></li>
		</c:if>






	</ul>
	<li class="nav__responive" id="modal__nav-bar"><i
		class="fa-solid fa-bars"></i></li>
</div>


