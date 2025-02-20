package com.puft.game;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;






@Controller
public class FishController {

	@Autowired
	private fishDAO fDAO;
	
	@RequestMapping(value = "/fish.getAllFish", method = RequestMethod.GET)
	public String getAllFish(HttpServletRequest req) {
	    fDAO.getAllFish(req);
	    return "main";
	}
	@RequestMapping(value = "/fish.getJSON", method = RequestMethod.GET,
			 produces = "application/json; charset=UTF-8")
		public @ResponseBody Fishes getFishJSON(HttpServletRequest req, HttpServletResponse res) {
		
			
			res.addHeader("Access-Control-Allow-Origin", "*");
			
			return fDAO.getJSON(req);
		}
	@RequestMapping(value = "/fish.searchJSON", method = RequestMethod.GET, 
			produces = "application/json; charset=UTF-8")
	public @ResponseBody Fishes searchErrorJSON(Fish f, HttpServletRequest req) {
		return fDAO.searchJSON(f, req);
		
	}
	
	
	

}
