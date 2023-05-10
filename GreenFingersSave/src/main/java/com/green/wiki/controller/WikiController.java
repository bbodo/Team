package com.green.wiki.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.wiki.service.WikiService;

@Controller
@RequestMapping("/Wiki")
public class WikiController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private WikiService wikiService;
	
	// wikiList 화면으로 이동
	@RequestMapping("/List")
	public  ModelAndView  wikiList(
			@RequestParam HashMap<String, Object> map) {
		System.out.println("map1" + map);
		
		// 메뉴, 서브메뉴 목록 가져오기
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/wiki/wikiList");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("map", map);
		return mv;
	}
	
	// Api data 받아오기
	@RequestMapping("/Service")
	@ResponseBody
	public  void service(
		String   keyword, int pageNo,
		HttpServletResponse  response) {
		System.out.println("1111===" + pageNo);
		PrintWriter out = null;
		
		try {
			response.setContentType("application/json; charset=utf-8");
			String json = wikiService.search(keyword, 10, pageNo);
			out = response.getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
