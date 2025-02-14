package com.puft.feb122.score;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ScoreDAO {

	
	
	@Autowired
	private SqlSession ss;
	
	
	
	public void regScore(Score s, HttpServletRequest req) {
		try {
			
		   ScoreMapper sm = ss.getMapper(ScoreMapper.class);
		   

			if(sm.regScore(s) == 1) {
				req.setAttribute("r", "과목 등록 성공");
			
			}
		   
		   
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "과목 등록 실패");
		}
		
	
	}
public void getAllScore(HttpServletRequest req) {
		
		try {
			List<Score> scores = ss.getMapper(ScoreMapper.class).getAllScore();
			req.setAttribute("scores", scores);
			
			//req.setAttribute("students", ss.getMapper(StudentMapper.class).getAllStudent(););
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
