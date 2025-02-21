package com.beaver.feb191mp.member;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	public void signup(Member m, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path);
			
			MultipartRequest mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			m.setGs_id(mr.getParameter("gs_id"));
			m.setGs_pw(mr.getParameter("gs_pw"));
			m.setGs_name(mr.getParameter("gs_name"));
			m.setGs_role(mr.getParameter("gs_role"));
			
			String gs_addr1 = mr.getParameter("gs_addr1");
			String gs_addr2 = mr.getParameter("gs_addr2");
			String gs_addr3 = mr.getParameter("gs_addr3");
			String gs_addr = gs_addr2 + "!" + gs_addr3 + "!" + gs_addr1;
			m.setGs_addr(gs_addr);
			
			String gs_photo = mr.getFilesystemName("gs_photo");
			String gs_photo_kor = URLEncoder.encode(gs_photo, "UTF-8").replace("+", " ");
			m.setGs_photo(gs_photo_kor);
			
			if (ss.getMapper(MemberMapper.class).signupMember(m) == 1) {
				req.setAttribute("r", "가입 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");
		}
		
	}
	
	
	public Members memberIdCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getMemberById(m));
	}
	
	public void login(Member m, HttpServletRequest req) {
		try {
			List<Member> members = ss.getMapper(MemberMapper.class).getMemberById(m);
			if (members.size() != 0) {
				Member dbM = members.get(0);
				// System.out.println(dbM.getGs_id());
				
				if (dbM.getGs_pw().equals(m.getGs_pw())) {
					req.setAttribute("r", "로그인 성공");
					req.getSession().setAttribute("loginMember", dbM);
					req.getSession().setMaxInactiveInterval(600);
					
				} else {
					req.setAttribute("r", "로그인 실패(PW 오류");
				}
			} else {
				req.setAttribute("r", "로그인 실패(ID 없음)");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "로그인 실패(DB서버)");
		}
	}
	
	public void logout(HttpServletRequest req) {
		try {
			req.getSession().setAttribute("loginMember", null);
			req.setAttribute("r", "로그아웃 성공");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "로그아웃 성공");
		}
	}
	
	public void delete(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			if (ss.getMapper(MemberMapper.class).deleteMember(m) == 1) {
				req.setAttribute("r", "탈퇴 성공");
				req.getSession().setAttribute("loginMember", null);
				
				String gs_photo = m.getGs_photo();
				gs_photo = URLDecoder.decode(gs_photo, "UTF-8");
				String path = req.getSession().getServletContext().getRealPath("resources/img");
				File f = new File(path + "/" + gs_photo);
				f.delete();
			} else {
				req.setAttribute("r", "이미 탈퇴처리 됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴 실패(DB서버)");
		}
	}
	
	public void update(HttpServletRequest req) {
		String path = null;
		Member m = (Member) req.getSession().getAttribute("loginMember");
		MultipartRequest mr = null;
		String old_gs_photo = m.getGs_photo();
		String new_gs_photo = null;
		try {
			path = req.getSession().getServletContext().getRealPath("resources/img");
			mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			
			new_gs_photo = mr.getFilesystemName("gs_photo");
			if (new_gs_photo != null) {
				new_gs_photo = URLEncoder.encode(new_gs_photo, "UTF-8").replace("+", " ");
			} else {
				new_gs_photo = old_gs_photo;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		try {
			m.setGs_pw(mr.getParameter("gs_pw"));
			m.setGs_name(mr.getParameter("gs_name"));
			m.setGs_role(mr.getParameter("gs_role"));
			m.setGs_photo(new_gs_photo);
			
			String gs_addr1 = mr.getParameter("gs_addr1");
			String gs_addr2 = mr.getParameter("gs_addr2");
			String gs_addr3 = mr.getParameter("gs_addr3");
			String gs_addr = gs_addr2 + "!" + gs_addr3 + "!" + gs_addr1;
			m.setGs_addr(gs_addr);
			if (ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				req.setAttribute("r", "정보 수정 성공");
				if (!new_gs_photo.equals(old_gs_photo)) {
					new File(path + "/" + URLDecoder.decode(old_gs_photo, "UTF-8")).delete();
				}
				req.getSession().setAttribute("loginMember", m);
			} else {
				req.setAttribute("r", "정보 수정 실패");
				if (!new_gs_photo.equals(old_gs_photo)) {
					new File(path + "/" + URLDecoder.decode(old_gs_photo, "UTF-8")).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "정보 수정 실패");
			if (!new_gs_photo.equals(old_gs_photo)) {
				try {
					new File(path + "/" + URLDecoder.decode(old_gs_photo, "UTF-8")).delete();
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			}
		}
		
	}
	
	
	
	
}















