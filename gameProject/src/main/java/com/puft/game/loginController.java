package com.puft.game;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@Autowired
	LoginDAO lDAO;
	@Autowired
	fishDAO fDAO;
	@Autowired
	InventoryDAO iDAO;

	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(Login l, HttpServletRequest req, HttpServletResponse res) {
		lDAO.login(l, req, res);
		fDAO.getAllFish(req);
		iDAO.selectAllInventory(req);
		String id = req.getParameter("u_id");
		req.setAttribute("ID", id);
		 if(req.getAttribute("r").equals("로그인 성공")) {
		return "main";
		 }else {
				req.setAttribute("lp", "login.jsp");
				req.setAttribute("isLogin", "로그인 실패");
			 return "landing";
		 }
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Login l, HttpServletRequest req) {
		lDAO.signUp(l, req);
		req.setAttribute("lp", "login.jsp");
		return "landing";
	}
	
	@RequestMapping(value = "/signupGo", method = RequestMethod.POST)
	public String signupGo( HttpServletRequest req) {
		
		req.setAttribute("lp", "register.jsp");
		return "landing";
	}
	
}
