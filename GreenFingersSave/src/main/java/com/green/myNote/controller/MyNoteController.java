package com.green.myNote.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.myNote.service.MyNoteService;
import com.green.myNote.vo.MyNoteVo;
@Controller
@RequestMapping("/myNoteWrite") 
public class MyNoteController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	MyNoteService myNoteService;

	@RequestMapping("/myNoteWriteForm")
	public ModelAndView myNoteWriteForm(@RequestParam HashMap<String, Object> map) {
		
		// 메뉴 목록	
		/*
		 * List<MenuVo> menuList = menuService.getMenuList(); List<SubmenuVo>
		 * submenuList = menuService.getSubmenuList1();
		 */

		/* System.out.println("쪽지GET확인:" + map.toString()); */

		//쪽지등록 전 필요한 값 들고오기
		MyNoteVo myNoteForm =  myNoteService.getmyNoteForm(map);

		/* System.out.println("쪽지FORM확인:" + myNoteForm); */

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myNoteWrite");
		mv.addObject("myNoteVo", myNoteForm);
		/*
		 * mv.addObject("myNoteVo", menuList); mv.addObject("myNoteVo", submenuList);
		 */
		return mv;
	}


	@RequestMapping("/myNoteWrite") 
	public ModelAndView myNoteWrite( @RequestParam HashMap<String, Object> map ) {
		
		//쪽지 등록 
		int myNoteInsertCheck = myNoteService.insertMyNote(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("myNoteInsertCheck", myNoteInsertCheck);

		return mv;
	}

}
