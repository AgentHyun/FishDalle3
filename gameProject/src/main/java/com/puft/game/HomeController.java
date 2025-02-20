package com.puft.game;





import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	
	@Autowired
	fishDAO fDAO;
	@Autowired
	InventoryDAO iDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		fDAO.getAllFish(req);
		iDAO.selectAllInventory(req);
	  
		req.setAttribute("lp", "login.jsp");
	
		return "landing";
	}

	
}
