<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "resources/jQuery.js"></script>
<script type = "text/javascript">
$(function(){
   $.ajax({
	  url : "k.weather.get",
	  success: function(kkk){
		  alert(kkk);
	  }
	   
   });
});

</script>
</head>
<body>

</body>
</html>