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


    <!-- BEGIN: PAGE CONTAINER -->
    <div class="c-layout-page background-productlist">
        <!-- BEGIN: PAGE CONTENT -->

        <div class="container  ">
            <div class="col-md-12" style="min-height: 550px;  ">
                <div class="page-title" >Product List</div>
                <div class="page-title" style="text-align: center;" >${message }</div>
                <c:forEach items="${paginationProducts.list}" var="prodInfo">
                    <div class="product-preview-container" >
                        <ul>
                            <li><img class=" product-image"
                        src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" />
                    </li>
                    <li>Code: ${prodInfo.code}</li>
                    <li>Name: ${prodInfo.name}</li>
                    <li>Price:
                       <b style =" color: green;">${prodInfo.price} đ</b>
                    </li>
                    
                     <li>Hero : ${prodInfo.nHeros}
                    </li>
                     <li>Skin : ${prodInfo.nSkins}
                    </li>
                     <li>Round : ${prodInfo.nRounds}
                    </li>
					<li>Gemstone :
							 <c:if
									test="${prodInfo.isGemstone eq true}">
									Yes
							</c:if>
							<c:if test="${prodInfo.isGemstone eq false}">
									No
							</c:if>
					</li>


					<li><a href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
                            Buy Now</a></li>




                    <!-- For Manager edit Product -->
                    <security:authorize access="hasRole('ROLE_MANAGER')">
                        <li>
                        		<a style="color:red;"
                                href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                                Edit Product
                                </a>
                        </li>
                                
                        <li>
                        		<a style="color:red;" onclick="if (!(confirm('Are you sure want to delete this product?'))) return false"
                                href="${pageContext.request.contextPath}/deleteProduct?code=${prodInfo.code}">
                                Delete Product
                                </a>
                       </li>
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