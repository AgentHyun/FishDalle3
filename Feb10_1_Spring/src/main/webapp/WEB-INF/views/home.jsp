<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>Hello world!</h1>

	[JSP] - http://IP:Port/ProjectName/FileName
	[Spring] - http://IP:Port/top-level package의 마지막자리/FileName
	
	package 명이 같으면 프로젝트가 달라도 주소가 같아질 수 있어서
	에러발생할 확률이 높으니 top-level package는 이름이 중복되지 않도록 주의!
	
	Spring 프로그램 실행 => 프로젝트 저채를 선택 후
					=> ctrl + f11 => Run on Server
	
	Spring 이전에
	애플리케이션 구현 => EJB(Enterprise JavaBeans)
	EJB의 기술이 점점 발전하면서 성능이 그만큼 느려지게 되었고,
	프로젝트에 기능을 추가할수록 더욱더 복잡해지게 되었는데...
	개발자들은 'EJB' 사용 시절을 '겨울'에 빗대어서 표현
	'겨울'이 끝나고 '봄'이 찾아왔다해서 Spring이라 이름짓게 되었음
		(낭만 한스푼)
	Spring이 등장 : Java의 문법을 사용해서 기능을 구현하자
	Java의 문법을 사용하기 때문에 '간단해서 진입장벽이 낮다'
	POJO - Plain Old Java Object : Java의 기본으로 돌아가자!!!
		(객체지향을 기초로 한 설계)
		
	Spring Framework
	사실상 Spring없이도 웹구현이 가능함
	기능 구현에만 집중해서 빠르게 개발할 수 있도록
	기본적으로 필요한 '뼈대'를 제공해주는 것
	vs
		Library : 프로그램을 제작시에 필요한 기능  //면접 질문으로도 등장 
			우리가 사용하고 싶을 때 찾아서 사용하면 됨!
			(ex: json-simple.jar, cos.jar, ...)
	Framework : 도구(라이브러리)를 틀 안에서 개발자가 이용할 수 있도록 함
	Library : 사용자가 필요할 때 직접 호출해서 쓸 수 있는 도구
	
	
	Spring 구조
	
	- Java Resources
		자바의 영역(src/main/java) : Java코드를 작성
		자원의 영역(src/main/resources) : DB(SQL) 파일, MyBatis(XML) 파일, ...
		
	- src - main - webapp - WEB-INF 폴더
		(웹의 중요한 파일들이 노출되지 않도록 만든 폴더)
	
		spring이라는 폴더 안에 root-context.xml
			: 워크스페이스 전체에 대한 설정
			appServlet폴더 안에 servlet-context.xml
				: 이 프로젝트에 대한 설정
				
		views 폴더 : 말 그대로 눈으로 볼 수 있는 View를 작성하는 공간
					(.jsp, .html)	
					
		web.xml : 프로그램 실행시 함께 따라가는 설정들을 모아둔 파일
			클라이언트의 요청을 처리하는 [DispatcherServlet],
			웹 애플리케이션 단위 설정을 불러오는 [ContextLoaderListener],
			클라이언트의 요청을 DispatcherServlet으로 가기전에
				거치는 부분[Filter]
		pom.xml : 필요한 라이브러리들을 maven의 중앙저장소에서
				가져와서 관리해주는 파일


</body>
</html>
























