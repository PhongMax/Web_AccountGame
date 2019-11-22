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

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">

				<div class="page-title">Enter Customer Information</div>
				<div class="center-form-createproduct">
					<form:form method="POST" modelAttribute="customerForm"
						action="${pageContext.request.contextPath}/shoppingCartCustomer">

						<table>
							<tr>
								<td>Name *</td>
								<td><form:input path="name" /></td>
								<td><form:errors path="name" class="error-message" /></td>
							</tr>

							<tr>
								<td>Email *</td>
								<td><form:input path="email" /></td>
								<td><form:errors path="email" class="error-message" /></td>
							</tr>

							<tr>
								<td>Phone *</td>
								<td><form:input path="phone" /></td>
								<td><form:errors path="phone" class="error-message" /></td>
							</tr>

							<tr>
								<td>Address *</td>
								<td><form:input path="address" /></td>
								<td><form:errors path="address" class="error-message" /></td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Submit" /> <input
									type="reset" value="Reset" /></td>
							</tr>
						</table>

					</form:form>
				</div>

			</div>

		</div>

		<!-- END: PAGE CONTENT -->
	</div>



	<%--    <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>



</body>
</html>