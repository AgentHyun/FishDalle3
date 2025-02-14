package com.beaver.feb102;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beaver.feb102.dog.Dog;
import com.beaver.feb102.human.Human;

	// Spring : Java에서 IoC로 DI해주는 Framework
	//		기존 : 객체를 .java에서 만들어서 사용
	//		Spring : 객체를 외부파일(.xml)에 만들기
	//				=> .java에서 불러서 사용하게끔
	
	// 제어의 역전(Inversion of Control)은 디자인 패턴 중 하나이고,
	//		프로그램의 제어 흐름을 직접 제어하는 것이 아니라
	//		외부(파일)에서 관리하는 것
	// 의존성 주입(Dependency Injection)은 IoC패턴을 달성하는 방법
	//		객체를 직접 생성하거나 관리하지 않고 외부에서 주입받는 것

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// 원래는 이렇게 객체를 만들었다면...
//		Dog d = new Dog("개", 3);
//		System.out.println(d.getName());
//		System.out.println(d.getAge());
		
		// feb102beans.xml 불러오기 => xml파일에 등록해놓은 객체
		// AbstractApplicationContext : Bean 객체를 생성하고 관리하는 기능
		AbstractApplicationContext aac =
				new ClassPathXmlApplicationContext("feb102beans.xml");
		
		// aac가 없어질 때 등록해놓은 객체들을 다 없애라
		aac.registerShutdownHook();
		
		// id가 d인 강아지 객체를 불러오기
//		Dog d = aac.getBean("d", Dog.class);
//		System.out.println(d);
//		
//		// DI (Dependency Injection - 의존성 주입)
//		//		xml에서 객체를 만들고, 속성값 넣고
//		//		java에서 가져다 쓰는
//		Dog d2 = aac.getBean("d2", Dog.class);
//		System.out.println(d2.getName());
//		System.out.println(d2.getAge());
//		System.out.println("----------------------------------");
//		Dog d3 = aac.getBean("d3", Dog.class);
//		System.out.println(d3.getName());
//		System.out.println(d3.getAge());
//		System.out.println("----------------------------------");
		
		Human h1 = aac.getBean("h1", Human.class);
		System.out.println(h1.getName());
		System.out.println(h1.getAge());
		
		for (String nn : h1.getNickname()) {
			System.out.println(nn);
		}
		
		for (String f : h1.getFriend()) {
			System.out.println(f);
		}
		
		System.out.println(h1.getFamily().get("아버지"));
		System.out.println(h1.getFamily().get("어머니"));
		System.out.println(h1.getPet().getName());
		System.out.println(h1.getPet().getAge());
		System.out.println(h1.getPet2().getName());
		System.out.println(h1.getPet2().getAge());
		System.out.println("-----------------------");
		
		// aac 없애기
		aac.close();
		
		
		return "home";
	}
}

// 우리 컨셉상 웹 화면에서 값들을 입력받아서 그것들 가지고
//		활용을 해야 하는데...
//	지금 이렇게 고정된 값드을 가지고는 어렵겠죠...?
// 그래서 지금과 같은 방식은 특정 기능이나 고정된 값으로
//	활용하고자 할 때 의존성주입을 활용하시면 좋습니다!
