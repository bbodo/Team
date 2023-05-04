package com.green.event.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;
import com.green.event.service.EventService;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.service.UserService;

@RequestMapping("/Event")
@Controller
public class EventController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private MenuService menuService;
	
	// 게시물 목록 보기
	// http://localhost:9090/Board/List?submenu_id=SUBMENU01&nowpage=1
	@RequestMapping("/eventList")
	public ModelAndView eventList(
			@RequestParam HashMap<String, Object> map
			) {
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;

		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );	
	
		// ---------------------------------------------------------------------
		
		// 게시글 목록 불러오기
		String 		  submenu_id = (String) map.get("submenu_id");
		List<EventVo> eventList  = eventService.getEventList(map);
		
		
		EventVo eventVo = (EventVo) map.get("eventVo");
		// 메뉴 이름 알아오기
		String submenu_name = menuService.getMenuName(submenu_id);
		
		map.put("submenu_name", submenu_name);

		
		System.out.println("리스트" + eventList);
		System.out.println("맵" + map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/eventList");
		mv.addObject("eventList", eventList);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("eventVo", eventVo);
		mv.addObject("map", map);
		
		return mv;
	}
	
}
