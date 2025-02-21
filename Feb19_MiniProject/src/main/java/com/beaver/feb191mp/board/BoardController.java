package com.beaver.feb191mp.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String goBoard(HttpServletRequest req) {
		req.setAttribute("cp", "board/boardList.jsp");
		return "index";
	}
	
}
