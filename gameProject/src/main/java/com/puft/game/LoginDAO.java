package com.puft.game;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginDAO {

	@Autowired
	SqlSession ss;
	
	public void login(Login l, HttpServletRequest req, HttpServletResponse response) {
		List<Login> login = ss.getMapper(LoginMapper.class).getMemberById(l);
		
		  if (login.isEmpty()) {
		        req.setAttribute("isLogin", "아이디가 존재하지 않습니다.");
		        try {
		            req.getRequestDispatcher("landing.jsp").forward(req, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return; 
		    }
			Login lgn = login.get(0);
			
			if (lgn.getU_pw().equals(l.getU_pw())) {
				req.setAttribute("isLogin", "로그인 성공");
				
				req.getSession().setAttribute("loginMember", lgn);
				req.getSession().setMaxInactiveInterval(600);
				
			} else {
				req.setAttribute("isLogin", "비밀번호 오류");
				
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

   


	

