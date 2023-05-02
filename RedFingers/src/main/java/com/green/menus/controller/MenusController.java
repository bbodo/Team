package com.green.menus.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

@Controller
@RequestMapping("/Menus")
public class MenusController {

	@Autowired
	private MenuService menuService;
	
	// 메뉴,서브메뉴 목록 가져오기
	@RequestMapping("/List")
	public ModelAndView list(@RequestParam HashMap<String, Object> map) {
		
		// 메뉴 목록 가져오기
		List<MenuVo> menuList = menuService.getMenuList();
		
		// 서브메뉴 목록 가져오기
		List<SubmenuVo> submenuList = menuService.getSubmenuList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminUpperMenuManagement");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		System.out.println(menuList);
		return mv;
	}
	
	
}
