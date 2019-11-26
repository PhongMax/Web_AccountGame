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
	<br><br>	
		<div class="container">
			<div class="col-md-12" style="min-height: 550px;">
				
				<div  class="center-form-createproduct">
				
				<form:form modelAttribute="productForm" method="POST"
					enctype="multipart/form-data">
					
					<table style="text-align: left;">
						<tr>
								<td>Code </td>
								<td style="color: #351594;">
									<c:if test="${not empty productForm.code}">
										<form:hidden path="code" />
                       					${productForm.code}
                  					</c:if>
                  					 <c:if test="${empty productForm.code}">
										<form:input path="code" />
											<br>
											<small  class="form-text text-muted">
												<form:errors path="code" class="error-message" />
											</small>
										<form:hidden path="newProduct" />
										
									</c:if>
									
								</td>
								
						</tr>
						

						<tr>
							<td>Name </td>
							<td>
								<form:input path="name" />
								<br>
									<small  class="form-text text-muted">
										<form:errors path="name" class="error-message" />
									</small> 
							</td>		
							
						</tr>
						
						

						<tr>
							<td>Price </td>
							<td>
								<form:input path="price" />
								<br>
									<small  class="form-text text-muted">
										<form:errors path="price" class="error-message" />
									</small> 
							</td>	
							
						</tr>
						
						
						<tr>
							<td>Hero Number </td>
							<td>
								<form:input path="nHeros" />
								<br>
									<small  class="form-text text-muted">
										<form:errors path="nHeros" class="error-message" />
									</small> 
							</td>	
						</tr>
					
						<tr>
							<td>Skin Number </td>
							<td>
								<form:input path="nSkins" />
								<br>
									<small  class="form-text text-muted">
										<form:errors path="nSkins" class="error-message" />
									</small> 
							</td>	
						</tr>
					
						<tr>
							<td>Round Number </td>
							<td>
								<form:input path="nRounds" />
								<br>
									<small  class="form-text text-muted">
										<form:errors path="nRounds" class="error-message" />
									</small> 
							</td>	
							
						</tr>
						
						
						<tr>
							<td>Gemstone </td>
							<td><select id="isGemstone" name="isGemstone" class="form-control" style=" width: 90px;">
								<option value="true">Có</option>
								<option value="false" selected="selected">Không</option>
							</select>
							</td>
							<td><form:errors path="isGemstone" class="error-message" /></td>
						</tr>
						<tr>
							<td>Image </td>
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