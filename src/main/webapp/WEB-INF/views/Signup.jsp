<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>

<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="background-singup c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse">

	<jsp:include page="_header.jsp" />

	<!-- BEGIN: PAGE CONTAINER -->
	<div class="c-layout-page background-singup">
		<div class="col-md-12" style="min-height: 600px;">

			<!-- BEGIN: LOGIN CONTENT -->
			<div class="login-box">

				<!-- /.login-logo -->
				<div class="login-box-body box-custom">
					<p class="login-box-msg">Đăng ký tài khoản</p>

					<span class="help-block" style="text-align: center; color: #dd4b39">
					</span>
					<c:if test="${not empty errorMessage }">
					<div class="error-message">${errorMessage}</div>
					</c:if>
					
					
					<form:form action="${pageContext.request.contextPath}/signup"
						method="POST" modelAttribute="account">

						<div class="form-group has-feedback  ">
							<form:input type="text" class="form-control" path="userName"
								value="" placeholder="Tài khoản" />
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
							<form:errors path="userName" class="error-message" />
						</div>


						<div class="form-group has-feedback">
							<form:input path="phone" type="text" class="form-control number"
								maxlength="11" value="" placeholder="Số điện thoại" />
							<span class="glyphicon glyphicon-phone form-control-feedback"></span>
							<form:errors path="phone" class="error-message" />
						</div>

						<div class="form-group has-feedback">
							<form:input path="fullName" type="text" class="form-control "
								value="" placeholder="Họ và tên" />
							<span class="glyphicon glyphicon-text-size form-control-feedback"></span>
							<form:errors path="fullName" class="error-message" />
						</div>

						<div class="form-group has-feedback">

							<form:select class="form-control" path="userRole">
								<form:option value="EMPLOYEE" />
								<form:option value="MANAGER" />
							</form:select>
						</div>


						<div class="form-group has-feedback">
							<form:password class="form-control" placeholder="Mật khẩu" id="myPass"
								 value="123" path="password" />
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
							<form:errors path="password" class="error-message" />
							<input type="checkbox" onclick="fnShowPassword()">Hiển thi mật khẩu
						</div>

						
						<div class="row">

							<!-- /.col -->
							<div class="col-xs-12">
								<button type="submit" class="btn btn-primary btn-block btn-flat"
									style="margin: 0 auto;">Đăng ký</button>
							</div>
							<!-- /.col -->
						</div>
					</form:form>
				</div>
				<!-- /.login-box-body -->
			</div>
			<!-- /.login-box -->
			<!-- END LOGIN CONTENT -->

		</div>

	</div>

	<script>
		function fnShowPassword() {
			var x = document.getElementById("myPass");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>

	<!-- END: PAGE CONTENT -->
	<%--    <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>

</body>
</html>