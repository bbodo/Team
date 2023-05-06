package com.green.myPage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.myPage.service.MyPageService;
import com.green.myPage.vo.MyPageVo;
import com.green.user.vo.UserVo;
@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	MyPageService myPageService;

	@RequestMapping("/myNoteWriteForm")
	public ModelAndView myNoteWriteForm(@RequestParam HashMap<String, Object> map) {
		
		// 메뉴 목록	
		/*
		 * List<MenuVo> menuList = menuService.getMenuList(); List<SubmenuVo>
		 * submenuList = menuService.getSubmenuList1();
		 */

		/* System.out.println("쪽지GET확인:" + map.toString()); */

		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteForm =  myPageService.getmyNoteForm(map);

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
		int myNoteInsertCheck = myPageService.insertMyNote(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("myNoteInsertCheck", myNoteInsertCheck);

		return mv;
	}
	
	@RequestMapping("/myNote")
	public ModelAndView myNoteList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		System.out.println("mylist" + session.getAttribute("login"));
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		
		//쪽지 목록
		List<MyPageVo> myPageVo = myPageService.getRecSendNote(usercode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("userVo", userVo);
		mv.addObject("myPageVo", myPageVo);
		return mv;
	}

}
