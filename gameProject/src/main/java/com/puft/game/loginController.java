package com.puft.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	
	@Autowired
	fishDAO fDAO;
	@Autowired
	InventoryDAO iDAO;
	@RequestMapping(value = "/loginComplete", method = RequestMethod.GET)
	public String loginComplete(HttpServletRequest req) {
		fDAO.getAllFish(req);
		iDAO.selectAllInventory(req);
		return "main";
	}
}
