package com.green.menus.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView list(@PathVariable String menu_id,
			@RequestParam HashMap<String, Object> map) {
		System.out.println(menu_id);
		System.out.println(map);
		// 메뉴 목록 가져오기
		List<MenuVo> menuList = menuService.getMenuList();
		
		// 서브메뉴 목록 가져오기
		List<SubmenuVo> submenuList = menuService.getSubmenuList(map);
		System.out.println("submenuList: " + submenuList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminUpperMenuManagement");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		return mv;
	}

	
	
}
