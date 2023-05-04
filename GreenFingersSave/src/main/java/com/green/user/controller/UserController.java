package com.green.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@RequestMapping("/User")
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private MenuService menuService;
	// 로그인 화면으로 이동
	@RequestMapping("/Login")
	public String login() {
		return "/user/login";
	}
	
	// 로그인 할 user 정보 처리
	@RequestMapping("/LoginProcess")
	public ModelAndView loginprocess( HttpSession session,
			@RequestParam HashMap<String, Object> map ) {
		
		// 기존 login 정보가 존재한다면 
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		
		// 가입된 회원인지 체크
		UserVo vo = userService.getLogin(map);
		System.out.println(vo);
		if ( vo != null) {
			session.setAttribute("login", vo);
			mv.setViewName("home");
			mv.addObject("menuList", menuList);
			mv.addObject("submenuList", submenuList);
			mv.addObject("vo", vo);
		} else {
			mv.setViewName("user/login");
			mv.addObject("message", "fail");
		}
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("/Logout")
	public String logout(
			HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
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
