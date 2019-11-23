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
						<strong></strong>
					</span>

					<form action="${pageContext.request.contextPath}/signup" method="POST">
						<input type="hidden" name="_token"
							value="Jsw6miEDJ873hPv76KWrrXxci3qrC1NKKmLbinie">
						<div class="form-group has-feedback  ">
							<input type="text" class="form-control" name="username" value=""
								placeholder="Tài khoản"> <span
								class="glyphicon glyphicon-user form-control-feedback"></span>

						</div>


						<div class="form-group has-feedback">
							<input type="text" class="form-control number" maxlength="11"
								name="phone" value="" placeholder="Số điện thoại"> <span
								class="glyphicon glyphicon-phone form-control-feedback"></span>
						</div>


						<div class="form-group has-feedback">
							<input type="password" class="form-control" name="password"
								placeholder="Mật khẩu"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>

						</div>
						<div class="form-group has-feedback">
							<input type="password" class="form-control"
								name="password_confirmation" placeholder="Xác nhận mật khẩu">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>


						<div class="row">

							<!-- /.col -->
							<div class="col-xs-12">
								<button type="submit" class="btn btn-primary btn-block btn-flat"
									style="margin: 0 auto;">Đăng ký</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
				<!-- /.login-box-body -->
			</div>
			<!-- /.login-box -->
			<!-- END LOGIN CONTENT -->

		</div>

	</div>
	<!-- END: PAGE CONTENT -->
	<%--    <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>

</body>
</html>