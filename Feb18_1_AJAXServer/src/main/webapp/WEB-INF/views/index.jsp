<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "resources/jQuery.js"></script>
<script type="text/javascript">
$(function() {

	
	
	
	
	
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 

   Mybatis활용



 -->

<c:forEach var = "e" items = "${errors }">
  ${e.e_what } - ${e.e_where }
  <p>
 
 </c:forEach>




</body>
</html>