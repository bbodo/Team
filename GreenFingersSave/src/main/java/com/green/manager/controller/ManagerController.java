package com.green.manager.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.service.ManagerService;
import com.green.user.vo.UserVo;

@RequestMapping("/Manager")
@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/Home")
	public String managerHome() {
		
		return "/admin/homeM";
	}
	@RequestMapping("/Menu")
	public String managerMenu() {
		
		return "/admin/menuManagement";
	}
	@RequestMapping("/Member")
	public ModelAndView managerMember() {
		
		// 유저 정보 가져오기
		List<UserVo> userList = managerService.getAllUser();
		System.out.println(userList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/memberManagement");
		mv.addObject("userList", userList);
		
		return mv;
	}
	// 유저 정보 수정화면 가기
	@RequestMapping("/memberUpdateForm")
	public ModelAndView memberUpdateForm(
			@RequestParam HashMap<String, Object> map
			) {
		
		UserVo vo = managerService.getUser(map);
		map.put("vo", vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/memberUpdate");
		mv.addObject("vo", vo);
		
		return mv;
	}
	// 유저 정보 수정하기
	@RequestMapping("/memberUpdate")
	public ModelAndView memberUpdate(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.updateUser(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Member");
		
		return mv;
	}
	
	@RequestMapping("/menuWrite")
	public String menuWrite() {
		return "/admin/menuWrite";
	}
	@RequestMapping("/subMenuManagement")
	public String subMenuManagement() {
		return "/admin/subMenuManagement";
	}
	@RequestMapping("/subMenuWrite")
	public String subMenuWrite() {
		return "/admin/subMenuWrite";
	}
	
}
