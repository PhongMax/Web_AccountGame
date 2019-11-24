<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<%@include file="/common/taglib.jsp"%>


</head>

<body
	class="c-layout-header-fixed c-layout-header-mobile-fixed c-layout-header-topbar c-layout-header-topbar-collapse"
	style="background-image: none;"><jsp:include page="_header.jsp" />


	<fmt:setLocale value="en_US" scope="session" />
	<div class="c-layout-page background-orderList">
		<!-- BEGIN: PAGE CONTENT -->

		<div class="container c-size-md ">
			<div class="col-md-12" style="min-height: 550px;">
				<div class="page-title"><s:message code="orderList.title" /></div>
 
   <div><s:message code="orderList.TotalOrderCount" /> : ${paginationResult.totalRecords}</div>
  
   <table border="1" style="width:100%">
       <tr>
           <th><s:message code="orderList.orderNum" /></th>
           <th><s:message code="orderList.orderDate" /></th>
           <th><s:message code="orderList.customerName" /></th>
           <th><s:message code="orderList.customerAddress" /></th>
           <th><s:message code="orderList.customerEmail" /></th>
           <th><s:message code="orderList.phone" /></th>
           <th><s:message code="orderList.total" /></th>
           <th><s:message code="orderList.view" /></th>
       </tr>
       <c:forEach items="${paginationResult.list}" var="orderInfo">
           <tr>
               <td>${orderInfo.orderNum}</td>
               <td>
                  <fmt:formatDate value="${orderInfo.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
               </td>
               <td>${orderInfo.customerName}</td>
               <td>${orderInfo.customerAddress}</td>
               <td>${orderInfo.customerEmail}</td>
               <td>${orderInfo.customerPhone }</td>
               <td style="color:red;">
                  <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
               </td>
               <td><a href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">
                  View</a></td>
           </tr>
       </c:forEach>
   </table>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
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



	<%--    <jsp:include page="_footer.jsp" /> --%>
	<%@include file="/WEB-INF/views/_footer.jsp"%>


</body>
</html>