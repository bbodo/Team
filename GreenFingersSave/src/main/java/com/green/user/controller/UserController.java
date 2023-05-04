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
	
	
	// 로그인 화면으로 이동
	@RequestMapping("/Login")
	public String login() {
		return "/user/login";
	}
	
	// 로그인 할 user 정보 처리
	@RequestMapping("/LoginProcess")
	public ModelAndView loginprocess( HttpSession session,
			@RequestParam HashMap<String, Object> map ) {
		System.out.println("1" + map + session);
		// 기존 login 정보가 존재한다면 
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		ModelAndView mv = new ModelAndView();
		
		// 가입된 회원인지 체크
		UserVo vo = userService.getLogin(map);
		
		if ( vo != null) {
			session.setAttribute("login", vo);
			mv.setViewName("redirect:/");
			mv.addObject("vo", vo);
		} else {
			mv.setViewName("redirect:/User/Login");
		}
		
		return mv;
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
