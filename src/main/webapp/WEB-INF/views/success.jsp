<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>Successfully</title>
<%@include file="/common/taglib.jsp"%>

</head>
<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;">
	<jsp:include page="_header.jsp" />


	<div class="c-layout-page background-success">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">

				<br>

				<h3 style="color: green ;">CHÚC MỪNG BẠN VỪA TẠO THÀNH CÔNG TÀI KHOẢN</h3>
				chỗ  này sẽ lưu thông tin vừa tạo thành công vào


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