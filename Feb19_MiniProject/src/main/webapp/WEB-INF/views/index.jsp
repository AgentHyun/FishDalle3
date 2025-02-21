<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOLF</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/signup.css">
<script  type="text/javascript"  charset="utf-8">  
    (function(w,d,t,f){  w[f]=w[f]||function(c,k,n){s=w[f],k=s['k']=(s['k']||(k?('&k='+k):''));s['c']=  
    c=(c  instanceof  Array)?c:[c];s['n']=n=n||0;L=d.createElement(t),e=d.getElementsByTagName(t)[0];  
    L.async=1;L.src='//feed.aqicn.org/feed/'+(c[n].city)+'/'+(c[n].lang||'')+'/feed.v1.js?n='+n+k;  
    e.parentNode.insertBefore(L,e);  };  })(  window,document,'script','_aqiFeed'  );    
</script>
<script  type="text/javascript"  charset="utf-8">  
    _aqiFeed({  
    	container: "city-aqi-container",  
    	city: "seoul",
    	lang: "kr",
    	display: "<span style='%style;font-size:12px;padding:5px 10px;'>공기: %aqi (%impact)</span>"
    });  
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/golf_jQuery.js"></script>
<script type="text/javascript" src="resources/js/board_jQuery.js"></script>
</head>
<body>
	<table id="siteTitleArea">
		<tr>
			<td align="center">
				<table id="siteTitleArea2">
					<tr>
						<td id="siteTitle">
							<a href="index.go">
								G<span id="G"></span>O<span id="O"></span>L<span id="L"></span>F<span id="F"></span>!
							</a>
						</td>
					</tr>
					<tr>
						<td id="greetMsg">
							<c:if test="${sessionScope.loginMember.gs_id != null }">
								${sessionScope.loginMember.gs_name}(${sessionScope.loginMember.gs_id})님 환영합니다.
							</c:if>
						</td>
					</tr>
					<tr>
						<td id="resultTd">${r }</td>
						<span id="city-aqi-container"></span>  
					</tr>
					<tr>
						<td id="siteSubTitle" align="right">
							<marquee behavior="alternate">백돌이에서 벗어나자!</marquee>
						</td>
					</tr>
				</table>
				<table id="siteMenuArea">
					<tr>
						<td align="center">
							<table id="siteMenuArea2">
								<tr>
									<td><a href=""><img src="resources/img/golf.png"></a></td>
									<td><a href=""><img src="resources/img/golf-club.png"></a></td>
									<td><a href=""><img src="resources/img/golf-cart.png"></a></td>
									<td><a href=""><img src="resources/img/clothes.png"></a></td>
									<td><a href="board.go"><img src="resources/img/board.png"></a></td>
								</tr>
							</table>
							<table id="siteLoginArea">
								<tr>
									<td>
										<c:choose>
											<c:when test="${sessionScope.loginMember.gs_id == null }">
												<a href="member.login.go">
													<img src="resources/img/login.png">
												</a>
											</c:when>
											<c:otherwise>
												<a id="logoutBtn" href="#">
													<img src="resources/img/exit.png">
												</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
							<table id="siteSignupArea">
								<tr>
									<td>
										<c:choose>
											<c:when test="${sessionScope.loginMember.gs_id == null }">
												<a href="member.signup.go">
													<img src="resources/img/signUp.png">
												</a>
											</c:when>
											<c:otherwise>
												<a href="member.info.go">
													<img src="resources/img/membership.png">
												</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<table id="siteNoticeArea">
		<tr>
			<td id="noticeTitle" align="center" colspan="2">공지사항</td>
			<td id="noticeHandle"><img src="resources/img/notice.png"></td>
		</tr>
		<tr>
			<td id="noticeContext" colspan="2" valign="top">
				1. 방역수칙 준수 <br>
				2. 매너플레이 <br>
				3. 준비운동 필수 <br>
			</td>
		</tr>
	</table>
	
	<table id="siteContextArea">
		<tr>
			<td align="center">
				<jsp:include page="${cp }"/>
			</td>
		</tr>
	</table>
</body>
</html>