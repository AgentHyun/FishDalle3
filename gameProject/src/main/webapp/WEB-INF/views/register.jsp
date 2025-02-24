<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel = "stylesheet" href = "resources/css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
<div class= "login-section">

<form action = "/game/signup" method = "post">
ID : <input name = u_id class = "login-input-id" autofocus = "autofocus"><br>
PW : <input name = u_pw class = "login-input-pw" autofocus = "autofocus" type = "password">
<br>

<button class = "Signup-btn">SIGN UP</button>
</form>


</div>
</body>
</html>