package com.beaver.feb101;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController { // 자바의 클래스 어떤 메소드를 활용
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home"; // home.jsp를 리턴, 문자열인데 How?
	}
	
	// servlet-context.xml의 <beans>에서
	//	prefix인 "WEB-INF/views/"와
	//	메소드에서 리턴한 중간 경로인 "home"과
	//	suffix인 ".jsp"가 합쳐져
	//	WEB-INF/views/home.jsp 라는 View 파일 경로로 이동해서
	//		클라이언트에게 응답해주는 형태
	
	// @ : Annotation
	//	사전적 의미 : '주석'
	//		코드사이에 주석처럼 쓰이며 기능을 수행하도록 하는 기술
	//		- 코드 작성 문법 에러를 체크하도록 정보를 제공
	//		- 이 개발 툴이 코드를 자동으로 생성할 수 있도록 도와줌
	//		- 실행시에 특정한 기능을 수행하도록 도와줌
	
	// 종류
	//		1. @Bean : 개발자가 직접 제어가 불가능한 외부 라이브러리 등을
	//				Bean으로 만들때 사용
	//		2. @Autowired : 속성, setter, 생성자에서 사용하며,
	//				타입에 따라서 Bean을 주입해줌(도와준다)
	//		3. @Controller : Spring의 Controller
	//				view(화면, .jsp)를 return해주는게 목적!
	//		4. @RestController : Controller 중에서 View 쪽으로
	//				응답하지 않는 Controller
	//				주 목적은 data(xml, json)들을 return해주는게 묵적!
	//				Spring 4.x.x에서부터 제공
	//				(우리가 사용하는것은 3버전대, 지금쓰는 jdk가 1.8.버전인데 더 높은 자바 버전을 요구해서 3버전을)
	//		5. @ResponseBody :
	//				자바 객체를 HTTP 요청의 body 내용으로 매핑을 하는 역할
	//				RestController = Controller + ResponseBody
	//		6. @Service : 비즈니스 로직을 수행하는 Class임을 나타낼 때
	//				비즈니스 로직 (Business Losic) :
	//				사용자 눈에는 안보이지만, 사용자가 원하는 결과물을
	//				올바르게 도출할 수 있도록 짜여진 코드
	//				(ex: DAO에서의 기능)
	//		7. @XmlRootElement / @XmlElement
	//				OXM(Object XML Mapping)을 하기 위해 사용
	//				특정 데이터를 XML 형태로 만들어주는 것
	//					: 마샬링(mashalling)
	//				XML데이터를 특정 데이터로 만들어주는 것
	//					: 언마샬링(unmashalling)
	//			XmlRootElement : Javabeen의 Class명 위 명시 O
	//			XmlElement : Javabeen의 setter에 명시 O
	//		8. @RequestMapping
	//			: 요청에 따라 어떤 Controller, 어떤 Method가 처리될지
	//				매핑하기 위해서 사용
	//			value : 요청받을 주소(url)을 설정
	//			method : 어떤 요청으로 받을지 설정
	//				(GET, POST, PUT, DELETE, PATCH)
	//			W3C(표준 개발 기구, World Wide Web Consortium) 에서
	//				PUT, DELETE, PATCH... => 과연 유용한가 ?
	//		9. @RequestParam : 요청파라미터 설정
	
	
	
}


















