package com.puft.feb122.score;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class ScoreController {

	@Autowired
	private ScoreDAO sDAO;
	
	@RequestMapping(value = "/score.reg", method = RequestMethod.GET)
	public String regScore(Score s, HttpServletRequest req) {
		System.out.println("과목 등록 요청"  + s);
		sDAO.regScore(s, req);
		sDAO.getAllScore(req);
		return "index";
	}
}
