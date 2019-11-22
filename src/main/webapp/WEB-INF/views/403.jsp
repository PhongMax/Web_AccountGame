<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">

   <title>Access Denied</title>

   <link href="<c:url value='/static/css/style.css' />" rel="stylesheet">
   </link>
   <link href="<c:url value='/static/css/ace.min.css' />" rel="stylesheet">
   </link>
   <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet">
   </link>
   <link href="<c:url value='/static/css/font-awesome.min.css' />" rel="stylesheet">
   </link>
</head>

<body>


   <jsp:include page="_header.jsp" />


   <div class="page-title">Access Denied!</div>

   <h3 style="color:red;">Sorry, you can not access this page!</h3>


   <!-- icon-arrow-up -->
   <div class="c-layout-go2top" style="display: block;">
      <i class="icon-arrow-up"></i>
   </div>




   <%--  <jsp:include page="_footer.jsp" /> --%>
   <%@include file="/WEB-INF/views/_footer.jsp" %>

</body>

</html>