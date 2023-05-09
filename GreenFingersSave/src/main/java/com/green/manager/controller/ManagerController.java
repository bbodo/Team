package com.green.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/memberManagement");
		mv.addObject(userList);
		
		return mv;
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate() {
		return "/admin/memberUpdate";
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
