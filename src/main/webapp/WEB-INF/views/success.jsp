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
		<div class="c-layout-page">
					
		
			
				<div class="col-md-12" style="min-height: 350px;">

							
					
					<div class="container c-size-md ">
						<div class="col-md-12">
						<h2 style="color: green;">CHÚC MỪNG BẠN VỪA TẠO THÀNH CÔNG TÀI
						KHOẢN</h2>
						<br>
							<div class="text-center"
								style="text-align: center;  padding: 5px; border: 2px solid black;">
								<h3 class="c-font-bold c-font-28">
									<s:message code="accountInfo.title" />
								</h3>
								<h2 class="c-font-22">
									<s:message code="accountInfo.account" />
									${account.userName}

								</h2>
								<h2 class="c-font-22">
									<s:message code="accountInfo.role" />
									${account.userRole }
								</h2>
								<h2 class="c-font-22">
									<s:message code="accountInfo.fullName" />
									${account.fullName}
								</h2>
								<h2 class="c-font-22">
									<s:message code="accountInfo.phone" />
									${account.phone}
								</h2>

							</div>

						</div>
					</div>

					<!-- icon-arrow-up -->
					<div class="c-layout-go2top" style="display: block;">
						<i class="icon-arrow-up"></i>
					</div>


				</div>

			</div>
		</div>
		<!-- END: PAGE CONTENT -->


	<%--  <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>