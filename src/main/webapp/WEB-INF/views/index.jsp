<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<title>Mobile Moba Việt Shop</title>
	<%@include file="/common/taglib.jsp" %>

</head>

<body class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse">

	<jsp:include page="_header.jsp" />

	<!-- END: HEADER -->
	<!-- END: LAYOUT/HEADERS/HEADER-1 -->
	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page">
		<!-- BEGIN: PAGE CONTENT -->
		<div class="c-content-box">
			<div id="slider" class="owl-theme section section-cate slideshow_full_width ">
				<div id="slide_banner" class="owl-carousel">
					<div class="item">
						<a href="#" >
							<img src="upload-usr/images/pAdLWkTeVY_1558777957.jpg" alt="tc">
						</a>
					</div>

				</div>
			</div>
		</div>
		<div class="c-content-box c-size-md c-bg-white">
			<div class="container-flex">
				<!-- Begin: Testimonals 1 component -->
				<div class="c-content-client-logos-slider-1  c-bordered" data-slider="owl">
					<!-- Begin: Title 1 component -->
					<div class="c-content-title-1">
						<h3 class="c-center c-font-uppercase c-font-bold">
							<s:message code="index.main"/>
						</h3>
						<div class="c-line-center c-theme-bg"></div>
					</div>
					<div class="owl-carousel owl-theme c-theme owl-bordered1 c-owl-nav-center" data-items="6"
						data-desktop-items="4" data-desktop-small-items="3" data-tablet-items="3" data-mobile-items="2"
						data-slide-speed="5000" data-rtl="false">

						<div class="item" id="77063">
							<a href="#"><img src="upload-usr/images/XVxGO1WpMH_1564133031.jpg" alt="tcn" /></a>
						</div>
						<div class="item" id="77063">
							<a href="#"><img src="upload-usr/images/YRc8wINEep_1566223224.png" alt="tcn" /></a>
						</div>
						<div class="item" id="88845">
							<a href="#"><img src="upload-usr/images/e6JmMG4AqF_1565269892.gif" alt="Quân huy" /></a>
						</div>

						<div class="item" id="77063">
							<a href="#"><img src="upload-usr/images/YRc8wINEep_1566223224.png" alt="tcn" /></a>
						</div>

						<div class="item" id="15">
							<a href="#"><img src="upload-usr/images/Wow2ESUTUw_1558166274.jpg" alt="Lịch Sử" /></a>
						</div>

						<div class="item" id="15">
							<a href="#"><img src="upload-usr/images/zzqUIL1Mcw_1566566124.jpg" alt="Lịch Sử" /></a>
						</div>

						<div class="item" id="72406">
							<a href="#"><img src="upload-usr/images/91ILdMsuw9_1564150769.jpg"
									alt="Mua Nick Liên Quân Mobile Giá Rẻ" /></a>
						</div>

					</div>
					<!-- End-->
				</div>
				<!-- End-->
			</div>
		</div>

		<div class="c-layout-go2top" style="display: block;">
			<i class="icon-arrow-up"></i>
		</div>
	</div>

	<%@include file="/WEB-INF/views/_footer.jsp" %>

</body>

</html>