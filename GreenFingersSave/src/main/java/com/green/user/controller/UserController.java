package com.green.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@RequestMapping("/User")
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	// ---------user---------
	@RequestMapping("/Login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping("/LoginProcess")
	public String loginprocess(
			HttpSession session,
			@RequestParam HashMap<String, Object> map
			) {
		String returnURL = "";
		
		if(session.getAttribute("login") != null) {
			// 기존 login 정보가 존재한다면 
			session.removeAttribute("login");
		}
		
		// 로그인 성공하면
		UserVo vo = userService.getLogin(map);
		if ( vo != null) {
			session.setAttribute("login", vo);
			returnURL = "redirect:/";
		} else {
			returnURL = "redirect:/login";
		}
		
		return returnURL;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(
			HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@RequestMapping("/userwrite")
	public String userwrite() {
		return "/user/userwrite";
	}	
	
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
