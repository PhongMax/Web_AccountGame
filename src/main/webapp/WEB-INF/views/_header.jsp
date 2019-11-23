<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<link href="<c:url value='/static/css/header.css' />" rel="stylesheet" />

<!-- BEGIN: LAYOUT/HEADERS/HEADER-1 -->
<!-- BEGIN: HEADER -->

<header class="c-layout-header c-layout-header-4 c-layout-header-default-mobile" data-minimize-offset="80">

	<div class="c-topbar c-topbar-light">
		<div class="container">
			<!-- BEGIN: INLINE NAV -->
			<nav class="c-top-menu c-pull-left">
				<ul class="c-icons c-theme-ul">
					<li>
						<a href="https://www.facebook.com/thanhphong.nguyen.526875" target="_blank"> <i
								class="icon-social-facebook"></i>
						</a>
					</li>
					<li><a href="https://www.youtube.com/" target="_blank"> <i class="icon-social-youtube"></i>
						</a>
					</li>

				</ul>
			</nav>
			<!-- END: INLINE NAV -->
			<!-- BEGIN: INLINE NAV -->
			<nav class="c-top-menu c-pull-right m-t-10">
				<ul class="c-links c-theme-ul">
					<li><strong style="color: black;">
							<s:message code="index.hotline"></s:message>
						</strong> <a href="tel:"> 07:30 - 23:00 <strong style="color: black;">
								<s:message code="index.phone"></s:message>
							</strong> 0935.277.873
						</a></li>
				</ul>
			</nav>
			<!-- END: INLINE NAV -->
		</div>
	</div>


	<div class="c-navbar">
		<div class="container">
			<!-- BEGIN: BRAND -->
			<div class="c-navbar-wrapper clearfix">
				<div class="c-brand c-pull-left absolute_pos">
					<h1 style="margin: 0px; display: inline-block">
						<a href="${pageContext.request.contextPath}/" class="c-logo">
							<img height="35px" src="upload-usr/images/BnmbVPJOZ9_1558777047.png" alt=""
								class="c-desktop-logo"> <img height="29px"
								src="upload-usr/images/BnmbVPJOZ9_1558777047.png" alt="" class="c-desktop-logo-inverse">
							<img height="35px" src="upload-usr/images/BnmbVPJOZ9_1558777047.png" alt=""
								class="c-mobile-logo">
						</a>
					</h1>
					<button class="c-hor-nav-toggler" type="button" data-target=".c-mega-menu">
						<span class="c-line"></span> <span class="c-line"></span> <span class="c-line"></span>
					</button>
					<button class="c-topbar-toggler" type="button">
						<i class="fa fa-ellipsis-v"></i>
					</button>
					<button class="c-search-toggler" type="button">
						<i class="fa fa-search"></i>
					</button>

				</div>
				<!-- END: BRAND -->

				<!-- BEGIN: HOR NAV -->
				<!-- BEGIN: LAYOUT/HEADERS/MEGA-MENU -->
				<!-- BEGIN: MEGA MENU -->
				<!-- Dropdown menu toggle on mobile: c-toggler class can be applied to the link arrow or link itself depending on toggle mode -->

				<ul class=" hidden-md hidden-lg  nav navbar-nav c-theme-nav button_top">

					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li class="top_button"><a href="${pageContext.request.contextPath}/accountInfo"
								class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
								<i class="icon-user"></i>${pageContext.request.userPrincipal.name}</a>
						</li>


						<li class="top_button"><a href="${pageContext.request.contextPath}/logout"
								class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
								<s:message code="index.logout" />
							</a></li>

						<security:authorize access="hasRole('ROLE_MANAGER')">
							<li class="top_buttonfloat_right"><a href="${pageContext.request.contextPath}/signup"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<i class="icon-key icons"></i>
									<s:message code="index.login" />
								</a></li>
						</security:authorize>



					</c:if>


					<c:if test="${pageContext.request.userPrincipal.name == null}">
						<li class="top_button"><a href="${pageContext.request.contextPath}/login"
								class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
								<i class="icon-user"></i>
								<s:message code="index.login" />
							</a></li>
					</c:if>

				</ul>

				<nav
					class="c-mega-menu c-pull-right c-mega-menu-dark c-mega-menu-dark-mobile c-fonts-uppercase c-fonts-bold d-none hidden-xs hidden-sm">

					<ul class="nav navbar-nav c-theme-nav ">
						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/"
								class="c-link dropdown-toggle ">HOME</a></li>
						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/productList"
								class="c-link dropdown-toggle load-modal">
								<s:message code="index.product" />
							</a></li>

						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/shoppingCart"
								class="c-link dropdown-toggle ">
								<s:message code="index.mycart" />
							</a></li>


						<security:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
							<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/orderList"
									class="c-link dropdown-toggle ">
									<s:message code="index.OrderList" />

								</a></li>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_MANAGER')">
							<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/product"
									class="c-link dropdown-toggle ">
									<s:message code="index.CreateProduct" />
								</a></li>
						</security:authorize>



						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li class="float_right"><a href="${pageContext.request.contextPath}/accountInfo"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<i class="icon-user"></i>${pageContext.request.userPrincipal.name}</a>
							</li>


							<li class="float_right"><a href="${pageContext.request.contextPath}/logout"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<s:message code="index.logout" />
								</a></li>

							<security:authorize access="hasRole('ROLE_MANAGER')">
								<li class="float_right"><a href="${pageContext.request.contextPath}/signup"
										class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
										<i class="icon-key icons"></i>
										<s:message code="index.signup" />
									</a></li>
							</security:authorize>



						</c:if>


						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<li class="float_right"><a href="${pageContext.request.contextPath}/login"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<i class="icon-user"></i>
									<s:message code="index.login" />
								</a></li>
						</c:if>
					</ul>
				</nav>

				<nav
					class="menu-main-mobile c-mega-menu c-pull-right c-mega-menu-dark c-mega-menu-dark-mobile c-fonts-uppercase c-fonts-bold hidden-md hidden-lg">

					<ul class="nav navbar-nav c-theme-nav ">

						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/"
								class="c-link dropdown-toggle ">HOME</a></li>
						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/productList"
								class="c-link dropdown-toggle load-modal">
								<s:message code="index.product" />
							</a></li>

						<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/shoppingCart"
								class="c-link dropdown-toggle ">
								<s:message code="index.mycart" />
							</a></li>

						<security:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
							<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/orderList"
									class="c-link dropdown-toggle ">
									<s:message code="index.OrderList" />
								</a></li>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_MANAGER')">
							<li class="c-menu-type-classic"><a href="${pageContext.request.contextPath}/product"
									class="c-link dropdown-toggle ">
									<s:message code="index.CreateProduct" />
								</a></li>
						</security:authorize>


						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li class="float_right"><a href="${pageContext.request.contextPath}/accountInfo"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<i class="icon-user"></i>${pageContext.request.userPrincipal.name}</a>
							</li>


							<li class="float_right"><a href="${pageContext.request.contextPath}/logout"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<s:message code="index.logout" />
								</a></li>

							<security:authorize access="hasRole('ROLE_MANAGER')">
								<li class="float_right"><a href="${pageContext.request.contextPath}/signup"
										class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
										<i class="icon-key icons"></i>
										<s:message code="index.signup" />
									</a></li>
							</security:authorize>
						</c:if>

						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<li class="float_right"><a href="${pageContext.request.contextPath}/login"
									class="c-btn-border-opacity-04 c-btn btn-no-focus c-btn-header btn btn-sm c-btn-border-1x c-btn-dark c-btn-circle c-btn-uppercase c-btn-sbold">
									<i class="icon-user"></i>
									<s:message code="index.login" />
								</a></li>
						</c:if>
					</ul>


				</nav>
			</div>
		</div>
	</div>
</header>
<!-- END: HEADER -->
<!-- END: LAYOUT/HEADERS/HEADER-1 -->