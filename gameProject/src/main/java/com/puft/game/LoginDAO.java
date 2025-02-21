package com.puft.game;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginDAO {

	@Autowired
	SqlSession ss;
	
	public void login(Login l, HttpServletRequest req) {
		List<Login> login = ss.getMapper(LoginMapper.class).getMemberById(l);
		
			Login lgn = login.get(0);
			
			if (lgn.getU_pw().equals(l.getU_pw())) {
				req.setAttribute("r", "로그인 성공");
				req.getSession().setAttribute("loginMember", lgn);
				req.getSession().setMaxInactiveInterval(600);
				
			} else {
				req.setAttribute("r", "로그인 실패(PW 오류");
			}
		} 
		
	

	public void signUp(Login l, HttpServletRequest req) {
		   
		   l.setU_id(req.getParameter("u_id"));
		   l.setU_pw(req.getParameter("u_pw"));
		   
		   if (ss.getMapper(LoginMapper.class).signUp(l) == 1) {
				req.setAttribute("r", "가입 성공");
			}
		   
		   
	   }










}

   


	

