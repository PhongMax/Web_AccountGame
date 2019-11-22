
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart</title>

<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />


	<div class="c-layout-page background-shoppingCart">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">
				<div class="page-title">My Cart</div>

				<c:if test="${empty cartForm or empty cartForm.cartLines}">
					<h2>There is no items in Cart</h2>
					<a href="${pageContext.request.contextPath}/productList">Show
						Product List</a>
				</c:if>

				<c:if
					test="${not empty cartForm and not empty cartForm.cartLines   }">
					<form:form method="POST" modelAttribute="cartForm"
						action="${pageContext.request.contextPath}/shoppingCart">

						<c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
							varStatus="varStatus">
							<div class="product-preview-container">
								<ul>
									<li><img class="product-image"
										src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
									</li>
									<li>Code: ${cartLineInfo.productInfo.code} <form:hidden
											path="cartLines[${varStatus.index}].productInfo.code" />

									</li>
									<li>Name: ${cartLineInfo.productInfo.name}</li>
									<li>Price: <span class="price"> <fmt:formatNumber
												value="${cartLineInfo.productInfo.price}" type="currency" />

									</span></li>
									<li>Quantity: <form:input
											path="cartLines[${varStatus.index}].quantity" /></li>
									<li>Subtotal: <span class="subtotal"> <fmt:formatNumber
												value="${cartLineInfo.amount}" type="currency" />

									</span>
									</li>
									<li><a
										href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
											Delete </a></li>
								</ul>
							</div>
						</c:forEach>
						<div style="clear: both"></div>
						<input class="button-update-sc" type="submit"
							value="Update Quantity" />
						<a class="navi-item"
							href="${pageContext.request.contextPath}/shoppingCartCustomer">Enter
							Customer Info</a>
						<a class="navi-item"
							href="${pageContext.request.contextPath}/productList">Continue
							Buy</a>
					</form:form>


				</c:if>


			</div>

		</div>

		<!-- END: PAGE CONTENT -->
	</div>




	<%--  <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>