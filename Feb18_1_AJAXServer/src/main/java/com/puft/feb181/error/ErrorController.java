package com.puft.feb181.error;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class ErrorController {

	@Autowired
	private ErrorDAO eDAO;
	
	@RequestMapping(value = "/error.getJSON", method = RequestMethod.GET,
		 produces = "application/json; charset=UTF-8")
	public @ResponseBody Errors getErrorJSON(HttpServletRequest req, HttpServletResponse res) {
		// 이 사이트 외부에서 AJAX가 가능하게 하려면...
		// 응답 파라미터 추가하고 (HttpServletResponse)
		//코드에 헤더를 추가
		
		res.addHeader("Access-Control-Allow-Origin", "*");
		
		return eDAO.getJSON(req);
	}
	
	@RequestMapping(value = "/error.searchJSON", method = RequestMethod.GET, 
			produces = "application/json; charset=UTF-8")
	public @ResponseBody Errors searchErrorJSON(Error e, HttpServletRequest req) {
		return eDAO.searchJSON(e, req);
		
	}
	
	
}
