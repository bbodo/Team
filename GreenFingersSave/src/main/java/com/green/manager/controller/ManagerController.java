package com.green.manager.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.service.ManagerService;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.vo.UserVo;

@RequestMapping("/Manager")
@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/Home")
	public String managerHome() {
		
		return "/admin/homeM";
	}
	
	//-------------- 메뉴 --------------
	@RequestMapping("/Menu")
	public ModelAndView managerMenu() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuManagement");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		return mv;
	}
	@RequestMapping("/menuWriteForm")
	public ModelAndView menuWriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuWrite");
		
		return mv;
	}
	@RequestMapping("/menuSimpleWriteForm")
	public ModelAndView menuSimpleWriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuSimpleWrite");
		
		return mv;
	}
	@RequestMapping("/menuWrite")
	public ModelAndView menuWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.addMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Menu");
		
		return mv;
	}
	@RequestMapping("/menuSimpleWrite")
	public ModelAndView menuSimpleWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.addSimpleMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Menu");
		
		return mv;
	}
	
	@RequestMapping("/subMenuManagement")
	public String subMenuManagement() {
		return "/admin/subMenuManagement";
	}
	@RequestMapping("/subMenuWrite")
	public String subMenuWrite() {
		return "/admin/subMenuWrite";
	}
	
	//-------------- 멤버 --------------
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
	
	// 유저 탈퇴 시켜버리기
	@ResponseBody
	@RequestMapping("/memberDelete")
	public int memberDelete(
			@RequestParam HashMap<String, Object> map
			) {

		int cnf = managerService.deleteUser(map);
		
		return cnf;
	}
	
}
