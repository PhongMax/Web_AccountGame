<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<%@include file="/common/taglib.jsp" %>
	<link href="<c:url value='/static/css/LoginForm.css' />" rel="stylesheet">
</head>

<body class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse">
	<jsp:include page="_header.jsp" />



	<div class="c-layout-page">
		<!-- BEGIN: PAGE CONTENT -->
		<div class="login-box">

			<div class="login-box-body box-custom">
				<p class="login-box-msg">Đăng nhập (NHÂN VIÊN, ADMIN)</p>

				<!-- /login?error=true -->
				<c:if test="${param.error == 'true'}">
					<span class="help-block" style="text-align: center;color: greenyellow;">
						<strong> Thất bại!!!<br> Bản hãy xem lại tài khoản và mật khẩu

						</strong>
					</span>
				</c:if>



				<form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
					<input type="hidden" name="_token" value="begixXfYxpvV5QEy3ziVdGW3wuff4yLSbBxgTTO2">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="userName" value=""
							placeholder="Tài khoản của Web">

					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="password" placeholder="Mật khẩu">
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="checkbox icheck">
								<label style="color: floralwhite;"> <input type="checkbox" name="remember"
										id="remember"> Ghi nhớ
								</label>
							</div>
						</div>

						<div class="col-xs-6" style="text-align: right">
							<a href="#"
								style="color: floralwhite;margin-top: 10px;margin-bottom: 10px;display: block;font-style: italic;">Quên
								mật khẩu?</a><br>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-flat"
								style="margin: 0 auto;">Đăng nhập</button>
						</div>
					</div>
				</form>
			</div>
		</div>


	</div>
	<!-- 	END: PAGE CONTENT -->

	<%@include file="/WEB-INF/views/_footer.jsp" %>


</body>

</html>