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
 <script type="text/javascript" src="resources/js/BeaverValidChecker.js"></script>
 <script type="text/javascript" src="resources/js/isValid.js"></script>


</head>


<body>
<div class= "login-section">

<form action = "/game/signup" method = "post" name = "f" onsubmit="return check();">
ID : <input name = "u_id" class = "login-input-id" autofocus = "autofocus" placeholder = "영어 또는 숫자"><p>
PW : <input name = "u_pw" class = "login-input-pw" autofocus = "autofocus" placeholder = "7글자 이상" type = "password"><p>
PW Check: <input name = "u_pw_check" class = "login-input-pw" autofocus = "autofocus" placeholder = "PW Check" type = "password"><p>
<br>

<button class = "Signup-btn">SIGN UP</button>
</form>


</div>
</body>
</html>