<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart Finalize</title>

<%@include file="/common/taglib.jsp"%>

</head>
<body>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />

	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">
				<div >
				
				
					<br>
					<h3>We have sent order information to the Email address. To be sure, please check !</h3>
					<h3>Thank you for Order</h3>
					Your order number is: ${lastOrderedCart.orderNum}
				</div>

				

			</div>

		</div>

		<!-- END: PAGE CONTENT -->
	</div>

<%--  <jsp:include page="_footer.jsp" /> --%>
				<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>