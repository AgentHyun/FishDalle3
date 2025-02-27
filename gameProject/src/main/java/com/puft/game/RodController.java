package com.puft.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RodController {

	
	@Autowired
	InventoryDAO iDAO = new InventoryDAO();
	
	@Autowired
	RodDAO rDAO = new RodDAO();
	
	
	 @RequestMapping(value = "/buyRod", method = RequestMethod.POST)
	    public String addInventory(@RequestParam("r_name") String r_name, @RequestParam("r_price") int r_price,@RequestParam("r_damage") int r_damage, HttpServletRequest req) {
	        try {
	            rDAO.buyRod(r_name, r_price, r_damage);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	       
	        return "main";  
	    }
}
