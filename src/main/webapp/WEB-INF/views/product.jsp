<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>

<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">

	<jsp:include page="_header.jsp" />
	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page background-product">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container">
			<div class="col-md-12" style="min-height: 550px;">
				<div class="page-title">Product</div>
				<div  class="center-form-createproduct">
				
					<c:if test="${not empty errorMessage }">
					<div class="error-message">${errorMessage}</div>
				</c:if>

				<form:form modelAttribute="productForm" method="POST"
					enctype="multipart/form-data">
					<table style="text-align: left;">
						<tr>
								<td>Code *</td>
								<td style="color: red;">
									<c:if test="${not empty productForm.code}">
										<form:hidden path="code" />
                       					${productForm.code}
                  					</c:if>
                  					 <c:if test="${empty productForm.code}">
										<form:input path="code" />
										<form:hidden path="newProduct" />
									</c:if>
								</td>
								<td><form:errors path="code" class="error-message" /></td>
						</tr>

						<tr>
							<td>Name *</td>
							<td><form:input path="name" /></td>		
							<td><form:errors path="name" class="error-message" /></td>
						</tr>

						<tr>
							<td>Price *</td>
							<td><form:input path="price" /></td>
							<td><form:errors path="price" class="error-message" /></td>
						</tr>
						
						<tr>
							<td>Hero Number *</td>
							<td><form:input path="nHeros" /></td>
							<td><form:errors path="nHeros" class="error-message" /></td>
						</tr>
						<tr>
							<td>Skin Number *</td>
							<td><form:input path="nSkins" /></td>
							<td><form:errors path="nSkins" class="error-message" /></td>
						</tr>
						<tr>
							<td>Round Number *</td>
							<td><form:input path="nRounds" /></td>
							<td><form:errors path="nRounds" class="error-message" /></td>
						</tr>
						<tr>
							<td>Gemstone *</td>
							<td><form:select class="form-control" path="isGemstone">
								<form:option value="true" label="Có" />
								<form:option value="false" label="Không" />
							</form:select>
							</td>
							<td><form:errors path="isGemstone" class="error-message" /></td>
						</tr>
						<tr>
							<td>Image *</td>
							<td><img
								src="${pageContext.request.contextPath}/productImage?code=${productForm.code}"
								width="100" /></td>
							<td></td>
						</tr>
						<tr>
							<td>Upload Image</td>
							<td><form:input type="file" path="fileData" /></td>
							<td></td>
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