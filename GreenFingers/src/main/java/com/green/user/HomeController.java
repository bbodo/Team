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
	// --------------------------- 그림 다그리고 컨트롤러 다시 만들죠~
	
	@RequestMapping("/board")
	public String board() {
		return "/board/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("view")
	public String view() {
		return "/board/view";
	}
	
	@RequestMapping("login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping("/update")
	public String update() {
		return "/board/update";
	}
}
