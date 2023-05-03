package com.green.market.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.market.service.MarketService;
import com.green.market.vo.MarketVo;
import com.green.menus.service.MenuService;

@Controller
@RequestMapping("/Market")
public class MarketController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MarketService marketService;
	
	
	
	@RequestMapping("/List")
	public ModelAndView list(
			@RequestParam HashMap<String, Object> map
			) {
		
	// ---------------------------------------------------------------------
	// 페이징 정보 준비
	int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
	int           pagecount =  2;    // 한페이지 당 출력할 줄(row)수  

	// sql 사용할 변수 : 조회할 레코드 번호
	int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
	int           endnum    =  nowpage  *  pagecount;

	map.put("pagecount", pagecount );
	map.put("startnum",  startnum );
	map.put("endnum",    endnum );		
	// ---------------------------------------------------------------------
	
	// 게시글 목록 불러오기
	String 		  submenu_id = (String) map.get("submenu_id");
	List<MarketVo> adoptList  = marketService.getAdoptList(map);
	
	MarketVo marketVo = (MarketVo) map.get("marketVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	System.out.println("마켓리스트" + adoptList);
	System.out.println("마켓맵" + map);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("market/list");
	mv.addObject("adoptList", adoptList);
	mv.addObject("marketVo", marketVo);
	mv.addObject("map", map);
	
    return mv;
    }
    
	/*
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
		@RequestParam HashMap<String, Object> map
		) {
		//메뉴 목록
		List<MenuVo> menuList   = menuService.getMenuList();
		
		String       menu_id    = String.valueOf( map.get("menu_id") );
		String       submenu_id = String.valueOf( map.get("submenu_id") );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("market/write");           
		mv.addObject("menuList", menuList);
		mv.addObject("map",      map);
		
		return mv;
	}
	
	
    @RequestMapping("/Write")
    public ModelAndView marketWrite(
    		@RequestParam HashMap<String, Object> map,
    		HttpServletRequest request
    		) {
    	
    	String menu_id    = String.valueOf( map.get("menu_id") );
    	String submenu_id = String.valueOf( map.get("submenu_id") );
		int    nowpage    = Integer.parseInt( String.valueOf( map.get("nowpage") ) );
    	
		// 글쓰기 및 파일 저장
		marketService.setWrite( map, request );
		
		String fmt = "redirect:/market/list?menu_id=%s&submenu_id=%s&nowpage=%d";
		String loc = String.format( fmt, menu_id, submenu_id, nowpage );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject( "map", map );
		mv.setViewName( loc );
		
		return mv;
    }
    
    
    @RequestMapping("/marketUpdate")
    public String marketUpdate() {
    	return "/market/update";
    }
    
    @RequestMapping("/marketView")
    public String marketView() {
    	return "/market/view";
    }
    
    @RequestMapping("/marketPointList")
    public String marketPointList() {
    	return "/market/pointList";
    }
*/
}
