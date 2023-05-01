package com.green.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	// --------------------------- 양식을 위한 주소
	
	@RequestMapping("/board")
	public String board() {
		return "/board/list";
	}

}
