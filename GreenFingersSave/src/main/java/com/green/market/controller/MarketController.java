package com.green.market.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.market.service.MarketService;
import com.green.market.vo.MarketVo;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

@Controller
@RequestMapping("/Market")
public class MarketController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MarketService marketService;
	
	
	// 마켓 메인 홈
	@RequestMapping("/Main")
	public ModelAndView main(
			@RequestParam HashMap<String, Object> map
			) {
		
	// 메뉴 목록	
	List<MenuVo> menuList   = menuService.getMenuList();
	List<SubmenuVo> submenuList = menuService.getSubmenuList1();
	
	// 페이징 정보 준비
	int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
	int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  

	// sql 사용할 변수 : 조회할 레코드 번호
	int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
	int           endnum    =  nowpage  *  pagecount;

	map.put("pagecount", pagecount );
	map.put("startnum",  startnum );
	map.put("endnum",    endnum );		
	// ---------------------------------------------------------------------

	// 게시글 목록 불러오기
	String 		  submenu_id = (String) map.get("submenu_id");
	List<MarketVo> marketList  = marketService.getMarketList(map);
	
	MarketVo marketVo = (MarketVo) map.get("marketVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	System.out.println("마켓리스트" + marketList);
	System.out.println("마켓맵" + map);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("market/main");
	mv.addObject("marketList", marketList);
	mv.addObject("menuList", menuList);
	mv.addObject("submenuList", submenuList);
	mv.addObject("marketVo", marketVo);
	mv.addObject("map", map);
	return mv;
	}
	
	
	//----------------------------------------------------------------------
	// 마켓 리스트
	@RequestMapping("/List")
	public ModelAndView list(
			@RequestParam HashMap<String, Object> map
			) {
		
	// 메뉴 목록	
	List<MenuVo> menuList   = menuService.getMenuList();
	List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
	// ---------------------------------------------------------------------
	// 페이징 정보 준비
	int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
	int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  

	// sql 사용할 변수 : 조회할 레코드 번호
	int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
	int           endnum    =  nowpage  *  pagecount;

	map.put("pagecount", pagecount );
	map.put("startnum",  startnum );
	map.put("endnum",    endnum );		
	// ---------------------------------------------------------------------
	
	// 게시글 목록 불러오기
	String 		  submenu_id = (String) map.get("submenu_id");
	List<MarketVo> marketList  = marketService.getMarketList(map);
	
	MarketVo marketVo = (MarketVo) map.get("marketVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	//System.out.println("마켓리스트" + adoptList);
	//System.out.println("마켓맵" + map);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("market/list");
	mv.addObject("marketList", marketList);
	mv.addObject("menuList", menuList);
	mv.addObject("submenuList", submenuList);
	mv.addObject("marketVo", marketVo);
	mv.addObject("map", map);
	
    return mv;
    }
    

	// 새글쓰기
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
		@RequestParam HashMap<String, Object> map
		) {
		
		// 메뉴 목록	
		List<MenuVo> menuList   = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		// 메뉴 이름
		String submenu_id = String.valueOf( map.get("submenu_id") );
		String submenu_name = menuService.getMenuName(submenu_id);
		map.put("submenu_name", submenu_name);
		
		// 답글구분
		int      idx      = 0;
		MarketVo  marketVo  = null;
		if( map.get("board_idx") != null  ) {
			idx    =  Integer.parseInt( String.valueOf( map.get("board_idx") ) );
			marketVo  =  marketService.getBoard( map );
			String title  =  marketVo.getBoard_title();
			String cont   =  ">> " + marketVo.getBoard_cont().replace("\n", "\n >> ");
			cont         +=  "\n==============================\n"; 
			marketVo.setBoard_title( title );
			marketVo.setBoard_cont( cont );			
		}
		map.put("idx", idx);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("market/write");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("vo",      marketVo);
		mv.addObject("map",     map);
		
		return mv;
	}
	
    @RequestMapping("/Write")
    public ModelAndView write(
    		@RequestParam HashMap<String, Object> map,
    		HttpServletRequest request
    		) {
    	
    	String submenu_id = String.valueOf( map.get("submenu_id") );
		int    nowpage    = Integer.parseInt( String.valueOf( map.get("nowpage") ) );
    	
		// 글쓰기 및 파일 저장
		marketService.setWrite( map, request );
		
		String fmt = "redirect:/market/list?menu_id=%s&submenu_id=%s&nowpage=%d";
		String loc = String.format( fmt, submenu_id, nowpage );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject( "map", map );
		mv.setViewName( loc );
		
		return mv;
    }
  

  /*  
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
