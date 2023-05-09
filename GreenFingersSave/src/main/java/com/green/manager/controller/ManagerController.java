package com.green.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String managerMember() {
		
		UserVo vo = managerService.getAllUser();
		
		return "/admin/memberManagement";
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
