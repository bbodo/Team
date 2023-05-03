package com.green.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.board.vo.BoardVo;
import com.green.menus.service.MenuService;
import com.green.user.service.UserService;

@RequestMapping("/Board")
@Controller
public class BoardController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MenuService menuService;
	
	// 게시물 목록 보기
	// http://localhost:9090/Board/List?submenu_id=SUBMENU01&nowpage=1
	@RequestMapping("/List")
	public ModelAndView list(
			@RequestParam HashMap<String, Object> map
			) {
		
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
		List<BoardVo> boardList  = boardService.getBoardList(map);
		
		
		BoardVo boardVo = (BoardVo) map.get("boardVo");
		
		// 메뉴 이름 알아오기
		String submenu_name = menuService.getMenuName(submenu_id);
		
		map.put("submenu_name", submenu_name);

		System.out.println("리스트" + boardList);
		System.out.println("맵" + map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("boardList", boardList);
		mv.addObject("boardVo", boardVo);
		mv.addObject("map", map);
		
		return mv;
	}
	
}
