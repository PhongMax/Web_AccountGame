<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>Access Denied</title>
<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />


	<div class="c-layout-page ">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">

				<div class="page-title" style="color: red;" >Access Denied!</div>

				<h3 style="color: red;">Sorry, you can not access this page!</h3>


				<!-- icon-arrow-up -->
				<div class="c-layout-go2top" style="display: block;">
					<i class="icon-arrow-up"></i>
				</div>


			</div>

		</div>

		<!-- END: PAGE CONTENT -->
	</div>

	<%--  <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>