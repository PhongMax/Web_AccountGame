<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>Account Info</title>

    <%@include file="/common/taglib.jsp"%>
</head>

<body class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
    style="background-image: none;">

    <jsp:include page="_header.jsp" />

    <!-- BEGIN: PAGE CONTAINER -->
    <div class="c-layout-page" style=" height: 445px;">
        <!-- BEGIN: PAGE CONTENT -->
        <div class="c-layout-page">
            <!-- BEGIN: PAGE CONTENT -->
            <div class="m-t-20 visible-sm visible-xs"></div>
            <div class="container c-size-md ">
                <div class="col-md-12">
                
                <br>
                <br>
      
            
                    <div class="text-center" style="text-align: center; margin-top: -128px;padding: 5px;
                    border: 2px solid black;">
                        <h3 class="c-font-bold c-font-28">
                            <s:message code="accountInfo.title" />
                        </h3>
                        <h2 class="c-font-22">
                            <s:message code="accountInfo.account" />
                            ${userDetails.userName}

                        </h2>
                        <h2 class="c-font-22">
                            <s:message code="accountInfo.role" />
                        </h2>
                        <h2 class="c-font-22">
<%--                             <c:forEach items="${userDetails.authorities}" var="auth">
                                <li>${auth.authority }</li>
                            </c:forEach> --%>
                             ${userDetails.userRole }
                        </h2>
						 <h2 class="c-font-22">
						 		<s:message code="accountInfo.fullName" />
                             ${userDetails.fullName}
                        </h2>
                         <h2 class="c-font-22">
                         	<s:message code="accountInfo.phone" />
                            ${userDetails.phone}
                        </h2>

                    </div>

                </div>
            </div>

            <!-- END: PAGE CONTENT -->
        </div>
        <!-- END: PAGE CONTENT -->
    </div>

    <%--  <jsp:include page="_footer.jsp" /> --%>
    <%@include file="/WEB-INF/views/_footer.jsp" %>

</body>

</html>