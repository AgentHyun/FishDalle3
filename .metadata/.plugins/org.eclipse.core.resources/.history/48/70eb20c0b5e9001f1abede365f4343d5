<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action = "student.reg">
 이름 : <input name = "s_name"> <p>
 별명 : <input name = "s_nickname"> <p>
 <button>등록</button>
 
 </form>
 
 <hr>
 <c:forEach var = "s" items = "${students }">
  ${s.s_name } - ${s.s_nickname } <p>
 
 </c:forEach>
 <hr>
 
 <form action = "test.reg">
 과목명 : <input name = "t_title"> <p>
시험날짜 :
<select name = "t_y">
 <c:forEach var = "y" begin = "2025" end = "2035">
     <option>${y }</option>
 
 </c:forEach>

</select>년
<select name = "t_m">
 <c:forEach var = "m" begin = "1" end = "12">
     <option>${m }</option>
 
 </c:forEach>

</select>월
<select name = "t_d">
 <c:forEach var = "d" begin = "1" end = "31">
     <option>${d }</option>
 
 </c:forEach>

</select>일<p>

<button>등록</button>

</form>
<hr>
<c:forEach var = "t" items="${tests }">
 ${t.t_title } - 
 <fmt:formatDate value="${t.t_when}" type = "date" dateStyle = "long"/>
  <p>
</c:forEach>



</body>
</html>