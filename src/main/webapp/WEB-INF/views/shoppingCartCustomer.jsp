<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Enter Customer Information</title>
<%@include file="/common/taglib.jsp"%>
</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />


	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page background-shoppincart-customer">
		<!-- BEGIN: PAGE CONTENT -->
		<div class="login-box">

			<!-- /.login-logo -->
			<div class="login-box-body box-custom">
				<p class="login-box-msg">Enter Customer Information</p>

				<span class="help-block" style="text-align: center; color: #dd4b39">
				</span>
				<c:if test="${not empty errorMessage }">
					<div class="error-message">${errorMessage}</div>
				</c:if>


				<form:form method="POST" modelAttribute="customerForm"
					action="${pageContext.request.contextPath}/shoppingCartCustomer">

					<div class="form-group has-feedback  ">
						<form:input type="text" class="form-control" path="name" value=""
							placeholder="Enter name" />
						<span class="glyphicon glyphicon-user form-control-feedback"></span>
						<form:errors path="name" class="error-message" />
					</div>


					<div class="form-group has-feedback">
						<form:input path="email" type="text" class="form-control number"
							value="" placeholder="Enter Email" />
						<span class="glyphicon glyphicon-phone form-control-feedback"></span>
						<form:errors path="email" class="error-message" />
					</div>

					<div class="form-group has-feedback">
						<form:input path="phone" type="text" class="form-control "
							value="" placeholder="Enter phone" />
						<span class="glyphicon glyphicon-text-size form-control-feedback"></span>
						<form:errors path="phone" class="error-message" />
					</div>




					<div class="form-group has-feedback">
						<form:input class="form-control" 
							placeholder="Enter address" path="address" />
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						<form:errors path="address" class="error-message" />
					</div>


					<div class="row">
						<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-flat"
								style="margin: 0 auto;">Summit</button>
							
						</div>
					</div>
				</form:form>
			</div>

		</div>

	</div>


	<%--    <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>



</body>
</html>