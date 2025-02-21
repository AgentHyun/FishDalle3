package com.puft.game;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





@Service
public class fishDAO {

	
	@Autowired
	SqlSession ss;
	
	public void getAllFish(HttpServletRequest req) {
		
		try {
			List<Fish> fishes = ss.getMapper(FishMapper.class).getAllFish();
			req.setAttribute("fishes", fishes);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	public Fishes getJSON(HttpServletRequest req) {
		   return new Fishes(ss.getMapper(FishMapper.class).getAllFish());
	   }

	public Fishes searchJSON(Fish f, HttpServletRequest req) {
		return new Fishes(ss.getMapper(FishMapper.class).searchFish(f));
	}
	
	
}
