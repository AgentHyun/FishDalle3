<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "resources/css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class= "login-section">

<form action = "/game/login" method = "post">
ID : <input name = u_id class = "login-input-id" autofocus = "autofocus"><br>
PW : <input name = u_pw class = "login-input-pw" autofocus = "autofocus" type = "password">
<br>


<button class = "login-btn">LOG IN</button>
</form>
<form action = "/game/signupGo" method = "post">
<button class = "Login-btn">SIGN UP</button>
</form>
</div>
</body>
</html>