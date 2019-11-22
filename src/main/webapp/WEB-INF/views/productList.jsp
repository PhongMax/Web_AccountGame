<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <%@include file="/common/taglib.jsp"%>
</head>

<body class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
    style="background-image: none;">

    <jsp:include page="_header.jsp" />

    <!-- set sang vietnam
    <fmt:setLocale value="en_US" scope="session" /> -->


    <!-- BEGIN: PAGE CONTAINER -->
    <div class="c-layout-page background-productlist">
        <!-- BEGIN: PAGE CONTENT -->

        <div class="container  ">
            <div class="col-md-12" style="min-height: 550px;  ">
                <div class="page-title" >Product List</div>
                <c:forEach items="${paginationProducts.list}" var="prodInfo">
                    <div class="product-preview-container" >
                        <ul>
                            <li><img class=" product-image"
                        src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" />
                    </li>
                    <li>Code: ${prodInfo.code}</li>
                    <li>Name: ${prodInfo.name}</li>
                    <li>Price:
                        <fmt:formatNumber value="${prodInfo.price}" type="currency" />
                    </li>
                    <li><a href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
                            Buy Now</a></li>




                    <!-- For Manager edit Product -->
                    <security:authorize access="hasRole('ROLE_MANAGER')">
                        <li><a style="color:red;"
                                href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                                Edit Product</a></li>
                    </security:authorize>
                    </ul>

            </div>

            </c:forEach>
            <br />

            <c:if test="${paginationProducts.totalPages > 1}">
                <div class="page-navigator">
                    <c:forEach items="${paginationProducts.navigationPages}" var="page">
                        <c:if test="${page != -1 }">
                            <a href="productList?page=${page}" class="nav-item">${page}</a>
                        </c:if>
                        <c:if test="${page == -1 }">
                            <span class="nav-item"> ... </span>
                        </c:if>
                    </c:forEach>

                </div>
            </c:if>

        </div>

    </div>

    <!-- END: PAGE CONTENT -->
    </div>
    <%@include file="/WEB-INF/views/_footer.jsp" %>
</body>

</html>