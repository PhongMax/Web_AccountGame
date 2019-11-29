	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart Confirmation</title>
<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />

	<fmt:setLocale value="en_US" scope="session" />
	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page background-shoppingcart-confirm">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">

				<div class="page-title" style="color: green">Confirmation</div>



				<div class="customer-info-container">
					<h3>Customer :</h3>
					<ul>
						<li>Name: ${myCart.customerInfo.name}</li>
						<li>Email: ${myCart.customerInfo.email}</li>
						<li>Phone: ${myCart.customerInfo.phone}</li>
						<li>Address: ${myCart.customerInfo.address}</li>
					</ul>
					<h3>Cart Summary:</h3>
					<ul>
						<li>Quantity: ${myCart.quantityTotal}</li>
						<li>Total: <span class="total">${myCart.amountTotal} đ
						</span></li>
					</ul>
				</div>

				<form method="POST"
					action="${pageContext.request.contextPath}/shoppingCartConfirmation">

					<!-- Edit Cart -->
					<a class="navi-item"
						href="${pageContext.request.contextPath}/shoppingCart">Edit
						Cart</a>

					<!-- Edit Customer Info -->
					<a class="navi-item"
						href="${pageContext.request.contextPath}/shoppingCartCustomer">Edit
						Customer Info</a>

					<!-- Send/Save -->
					<input type="submit" value="Send" class="button-send-sc" />
				</form>

				<div class="container">

					<c:forEach items="${myCart.cartLines}" var="cartLineInfo">
						<div class="product-preview-container">
							<ul>
								<li><img class="product-image"
									src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></li>
								<li>Code: ${cartLineInfo.productInfo.code} <input
									type="hidden" name="code"
									value="${cartLineInfo.productInfo.code}" />
								</li>
								<li>Name: ${cartLineInfo.productInfo.name}</li>
								<li>Price: <span class="price"> <fmt:formatNumber
											value="${cartLineInfo.productInfo.price}" type="currency" />
								</span>
								</li>
								<li>Quantity: ${cartLineInfo.quantity}</li>
								<li>Subtotal: <span class="subtotal">${cartLineInfo.amount} đ 
								</span>
								</li>
							</ul>
						</div>
					</c:forEach>

				</div>

			</div>

		</div>

		<!-- END: PAGE CONTENT -->
	</div>




	<%-- <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>