package com.puft.game;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = "/loginComplete", method = RequestMethod.GET)
	public String loginComplete() {
	    return "main";
	}
}
