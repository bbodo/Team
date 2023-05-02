package com.green.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.service.UserService;

@RequestMapping("/User")
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() {
		ModelAndView mv = new ModelAndView("/user/userwrite");
		
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(
			@RequestParam HashMap<String, Object> map) {
		
		System.out.println(map);
		
		userService.userWrite(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		
		return mv;
	}
}
