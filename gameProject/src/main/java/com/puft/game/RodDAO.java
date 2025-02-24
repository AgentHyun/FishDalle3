package com.puft.game;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RodDAO {

	
	@Autowired
	SqlSession ss;
	
	
	
	 public void buyRod(String r_name, int r_price,int r_damage) {
	        try {
	            Rod r = new Rod();
	            r.setR_name(r_name);
	           r.setR_price(r_price);
	           r.setR_damage(r_damage);
	            RodMapper mapper = ss.getMapper(RodMapper.class);
	            mapper.buyRod(r); 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
