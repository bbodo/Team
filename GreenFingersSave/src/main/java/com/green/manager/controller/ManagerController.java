package com.green.manager.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;
import com.green.manager.service.ManagerService;
import com.green.manager.vo.AdminEventVo;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.vo.FileVo;
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
		
		return "/admin/managerHome";
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
	
	// 메뉴 상세 추가창으로 가기
	@RequestMapping("/menuWriteForm")
	public ModelAndView menuWriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuWrite");
		
		return mv;
	}
	
	// 메뉴 간단 추가창으로 가기
	@RequestMapping("/menuSimpleWriteForm")
	public ModelAndView menuSimpleWriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuSimpleWrite");
		
		return mv;
	}
	
	// 메뉴 상세 추가
	@RequestMapping("/menuWrite")
	public ModelAndView menuWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.addMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Menu");
		
		return mv;
	}
	
	// 메뉴 간단 추가
	@RequestMapping("/menuSimpleWrite")
	public ModelAndView menuSimpleWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.addSimpleMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Menu");
		
		return mv;
	}
	
	// 메뉴 수정 창으로 가기
	@RequestMapping("/menuUpdateForm")
	public ModelAndView menuUpdateForm(
			@RequestParam HashMap<String, Object> map
			) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/menuUpdate");
		mv.addObject("map", map);
		
		return mv;
	}
	
	// 메뉴 수정
	@RequestMapping("/menuUpdate")
	public ModelAndView menuUpdate(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.updateMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/Menu");
		
		return mv;
	}
	// 메뉴 삭제
	@ResponseBody
	@RequestMapping("/menuDelete")
	public int menuDelete(
			@RequestParam HashMap<String, Object> map
			) {
		
		int cnf = managerService.deleteMenu(map);
		
		return cnf;
	}
	
	// 서브메뉴관리로 가기
	@RequestMapping("/subMenu")
	public ModelAndView subMenuManagement() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/subMenuManagement");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		return mv;
	}
	
	// 서브메뉴 추가 창으로
	@RequestMapping("/subMenuWriteForm")
	public ModelAndView subMenuWriteForm() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/subMenuWrite");
		mv.addObject("menuList", menuList);
		
		return mv;
	}
	
	// 서브메뉴 추가
	@RequestMapping("/subMenuWrite")
	public ModelAndView subMenuWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		managerService.addSubMenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/subMenu");
		
		return mv;
	}

	// 서브메뉴 삭제
	@ResponseBody
	@RequestMapping("/submenuDelete")
	public int submenuDelete(
			@RequestParam HashMap<String, Object> map
			) {
		
		int cnf = managerService.deleteSubmenu(map);
		
		return cnf;
	}
	
	// 서브메뉴 수정 창으로
	@RequestMapping("/submenuUpdateForm")
	public ModelAndView submenuUpdateForm(
			@RequestParam HashMap<String, Object> map
			) {
		
		System.out.println(map);
		
		List<MenuVo> menuList = menuService.getMenuList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/subMenuUpdate");
		mv.addObject("menuList", menuList);
		mv.addObject("map", map);
		
		return mv;
	}
	
	// 서브메뉴 수정
	@RequestMapping("/subMenuUpdate")
	public ModelAndView subMenuUpdate(
			@RequestParam HashMap<String, Object> map
			) {
		
		System.out.println(map);
		
		managerService.updateSubmenu(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Manager/subMenu");
		
		return mv;
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
	
	
	//-------------- 포인트 스토어  --------------------------------------------
	
	@RequestMapping("/Store")
	public ModelAndView store() {
		
		// 게시글 목록 불러오기
		List<StoreVo> storeList = managerService.getStoreList();
		
		//System.out.println("스토어목록" + storeList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/storeManagement");
		mv.addObject("storeList", storeList);
		
		return mv;
	}
	
	// 스토어 상품 등록 창
	@RequestMapping("/storeWriteForm")
	public ModelAndView storeWriteForm() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/storeWrite");
		mv.addObject("menuList", menuList);
		
		return mv;
	}
		
	// 스토어 상품 등록
	@RequestMapping("/storeWrite")
	public ModelAndView storeWrite(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		managerService.addStore(map, request);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject( "map", map );
		mv.setViewName("redirect:/Manager/Store");
		
		return mv;
	}
	
	// 스토어 상품 상세 보기
    @RequestMapping("/View")
    public ModelAndView view(
    		@RequestParam HashMap<String, Object> map
    			) {
    	
    	// 보여줄 상품 상세 내용
		StoreVo storeVo = managerService.getBoard(map);
		
		System.out.println("스토어뷰 :" + map );
    	
    	String content = storeVo.getBoard_cont();
		if(content == null) {
			storeVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
		} else {
			String cont = content.replace("\n", "<br>");
			storeVo.setBoard_cont(cont);
		}
		
		List<FileVo> fileList = managerService.getFileList(map);
    	
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/storeView");
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", storeVo);
		
    	return mv;
    }
	
	// 스토어 수정창
	@RequestMapping("/storeUpdateForm")
    public ModelAndView storeUpdateForm(
    		@RequestParam	HashMap<String, Object>  map
    		) {
		StoreVo storeVo = managerService.getBoard(map);
		
		// fileList
		List<FileVo>  fileList =  managerService.getFileList( map );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/storeUpdate");
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", storeVo);
		
		return mv;
	}
	
	// 스토어 상품 수정
	// 게시글 수정  
    @RequestMapping("/Update")
    public ModelAndView update(
    		@RequestParam  HashMap<String, Object> map,
			HttpServletRequest request
    		) {
    	
    managerService.setUpdate(map, request);
    
	
	ModelAndView mv = new ModelAndView();
	mv.addObject("map", map);
	mv.setViewName("redirect:/Manager/Store");
    
	return mv;
    }
    
    // 스토어 상품 삭제
    @RequestMapping("/storeDelete")
    public ModelAndView delete(
    		@RequestParam   HashMap<String,  Object>  map
    			) {
    	
    	managerService.deleteStore(map);
    	
    	ModelAndView   mv  = new ModelAndView();
		mv.setViewName("redirect:/Manager/Store");
		mv.addObject("map", map);

		return mv;	
    }
    
    
 	
 	 // 이벤트-----------------------------------------------
    
    // 게시물 목록 보기
  	@RequestMapping("/EventList")
  	public ModelAndView list(
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
  		
        
  		
  	
  		//--------------------------------------------------------------------------------------
  	
  	
 	// 게시글 목록 불러오기
 	List<AdminEventVo> eventList = managerService.getEventList(map);
 	
 	AdminEventVo adminEventVo = (AdminEventVo) map.get("adminEventVo");   
 	
 	
 	ModelAndView mv = new ModelAndView();
 	mv.setViewName("admin/adminEventList");
 	mv.addObject("menuList", menuList);
 	mv.addObject("submenuList", submenuList);
 	mv.addObject("adminEventVo", adminEventVo);
 	mv.addObject("eventList", eventList);
 	mv.addObject("map", map);
 	return mv;
     
      
  	
  	}
  	
          // 내용 보기
  		// /Event/View?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}
  		@RequestMapping("/EventView")
  		public ModelAndView eventView(
  				@RequestParam HashMap<String, Object> map
  					) {
  				
  		// 메뉴이름
  					String  submenu_id   =  (String) map.get("submenu_id");
  					map.put("submenu_id", submenu_id);
  					
  					// 보여줄 게시글 내용
  					AdminEventVo eventVo = managerService.getEventBoard(map);
  					
  					String content = eventVo.getBoard_cont();
  					if(content == null) {
  						eventVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
  					} else {
  						String cont = content.replace("\n", "<br>");
  						eventVo.setBoard_cont(cont);
  					}
  					
  					System.out.println( eventVo );
  					
  					List<MenuVo> menuList = menuService.getMenuList();
  					List<SubmenuVo> submenuList = menuService.getSubmenuList1();
  					
  					List<FileVo> fileList = managerService.getFileList(map);
  					
  					ModelAndView mv = new ModelAndView();
  					mv.setViewName("admin/adminEventView");
  					mv.addObject("map", map);
  					mv.addObject("fileList", fileList);
  					mv.addObject("vo", eventVo);
  					
  					return mv;
  				}		 		
  	     // 새글쓰기
  		@RequestMapping("/EventWriteForm")
  		public ModelAndView writeForm(
  			@RequestParam HashMap<String, Object> map
  			) {
  			
  			// 메뉴 이름 알아오기
  			String submenu_id   = (String) map.get("submenu_id");
  			String submenu_name = menuService.getMenuName(submenu_id);
  			map.put("submenu_name", submenu_name);
  			
  			// 답글구분
  			int      idx      = 0;
  			AdminEventVo  eventVo  = null;
  			if( map.get("board_idx") != null  ) {
  				idx    =  Integer.parseInt( String.valueOf( map.get("board_idx") ) );
  				eventVo  =  managerService.getEventBoard( map );
  				String title  =  eventVo.getBoard_title();
  				String cont   =  ">> " + eventVo.getBoard_cont().replace("\n", "\n >> ");
  				cont         +=  "\n==============================\n"; 
  				eventVo.setBoard_title( title );
  				eventVo.setBoard_cont( cont );			
  			}
  			map.put("idx", idx);
  			
  			List<MenuVo> menuList = menuService.getMenuList();
  			List<SubmenuVo> submenuList = menuService.getSubmenuList1();
  			
  			
  			ModelAndView mv = new ModelAndView();
  			mv.setViewName("admin/adminEventWrite");
  			mv.addObject("menuList", menuList);
  			mv.addObject("submenuList", submenuList);
  			mv.addObject("vo", eventVo);
  			mv.addObject("map", map);
  			
  			return mv;
  		}
  		
  		@RequestMapping("/EventWrite")
  		public ModelAndView write(
  				@RequestParam HashMap<String, Object> map,
  				HttpServletRequest request
  				) {
  			
  			
  			String  submenu_id  =  (String) map.get("submenu_id");
  			int     nowpage  =  Integer.parseInt(String.valueOf(map.get("nowpage")));
  			// 글쓰기 및 파일저장
  			managerService.setEventWrite(map, request);
  			
  			String fmt = "redirect:/Manager/EventList?submenu_id=%s&nowpage=%d";
  			String loc = String.format(fmt, submenu_id, nowpage);
  			
  			ModelAndView mv = new ModelAndView();
  			mv.setViewName(loc);
  			
  			return mv;
  		}
  		
  	// 수정창
  			
  			@RequestMapping("/EventUpdateForm")
  			public ModelAndView updateForm(
  				@RequestParam	HashMap<String, Object>  map
  					) {
  				
  				AdminEventVo eventVo = managerService.getEventBoard(map);
  				
  				String        submenu_id = (String) map.get("submenu_id");
  				String        menuname   = menuService.getMenuName(submenu_id);
  				map.put("submenu_id", submenu_id);
  				
  				String content = eventVo.getBoard_cont();
  				if(content == null) {
  					eventVo.setBoard_cont("");
  				} else {
  					content = content.replace("\n", "<br>");
  					// content += "\n===============================\n";
  					eventVo.setBoard_cont(content);
  				}
  				
  				// fileList
  				List<FileVo>  fileList =  managerService.getFileList( map ); 
  				
  				ModelAndView mv = new ModelAndView();
  				mv.setViewName("admin/adminEventUpdate");
  				mv.addObject("map", map);
  				mv.addObject("fileList", fileList);
  				mv.addObject("vo", eventVo);
  				
  				return mv;
  			}
  			
  			// 게시글 수정
  			@RequestMapping("/EventUpdate")
  			public ModelAndView eventUpdate(
  					@RequestParam  HashMap<String, Object> map,
  					HttpServletRequest request
  					) {
  				
  				managerService.setEventUpdate(map, request);
  				
  				System.out.println(map);
  				
  				int     board_idx   =  Integer.parseInt( String.valueOf(map.get("board_idx")) );  
  				String  submenu_id  =  (String) map.get( "submenu_id" );
  				String  nowpage     =  String.valueOf(map.get("nowpage"));
  				String  fmt      	=  "redirect:/Manager/EventView?board_idx=%d&submenu_id=%s&nowpage=%s";
  				String  loc      	=  String.format(fmt, board_idx, submenu_id, nowpage);
  				
  				ModelAndView mv = new ModelAndView();
  				mv.setViewName(loc);
  				mv.addObject("map", map);
  				
  				return mv;
  			}
  			
  			// 게시글 삭제
  			@RequestMapping("/EventDelete")
  			public ModelAndView eventDelete(
  				@RequestParam   HashMap<String,  Object>  map
  					) {
  				
  				managerService.setEventDelete(map);
  				
  				String submenu_id  =  map.get("submenu_id").toString();
  				String nowpage     = String.valueOf(map.get("nowpage"));
  				String fmt 		   = "redirect:/Manager/EventList?submenu_id=%s&nowpage=%s";
  				String loc 		   = String.format(fmt, submenu_id, nowpage);
  				
  				System.out.println(map);
  				
  				ModelAndView   mv  = new ModelAndView();
  				mv.setViewName(loc);
  				mv.addObject("map", map);

  				return mv;
  			}
  			
  	// 당첨자 -------------------------------------------
  		// 게시물 목록 보기
  		 	@RequestMapping("/WinnerList")
  		 	public ModelAndView winnerList(
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
  		  		//---------------------------------------------------------------------
  		 	
  			// 게시글 목록 불러오기
  			List<AdminEventVo> winnerList = managerService.getWinnerList(map);
  			
  			AdminEventVo adminEventVo = (AdminEventVo) map.get("adminEventVo");
  			
  			ModelAndView mv = new ModelAndView();
  			mv.setViewName("admin/adminWinnerList");
  			mv.addObject("menuList", menuList);
  			mv.addObject("submenuList", submenuList);
  			mv.addObject("adminEventVo", adminEventVo);
  			mv.addObject("winnerList", winnerList);
  			
  			return mv;
  		    
  		     
  		 	
  		 	}
  		 	
  		 	@RequestMapping("/WinnerView")
  	 		public ModelAndView winnerView(
  	 				@RequestParam HashMap<String, Object> map
  	 					) {
  	 				
  	 		// 메뉴이름
  	 					String  submenu_id   =  (String) map.get("submenu_id");
  	 					map.put("submenu_id", submenu_id);
  	 					
  	 					// 보여줄 게시글 내용
  	 					AdminEventVo eventVo = managerService.getWinnerBoard(map);
  	 					
  	 					String content = eventVo.getBoard_cont();
  	 					if(content == null) {
  	 						eventVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
  	 					} else {
  	 						String cont = content.replace("\n", "<br>");
  	 						eventVo.setBoard_cont(cont);
  	 					}
  	 					
  	 					System.out.println( eventVo );
  	 					
  	 					List<MenuVo> menuList = menuService.getMenuList();
  	 					List<SubmenuVo> submenuList = menuService.getSubmenuList1();
  	 					
  	 					List<FileVo> fileList = managerService.getFileList(map);
  	 					
  	 					ModelAndView mv = new ModelAndView();
  	 					mv.setViewName("admin/adminWinnerView");
  	 					mv.addObject("map", map);
  	 					mv.addObject("fileList", fileList);
  	 					mv.addObject("vo", eventVo);
  	 					
  	 					return mv;
  	 				}		 		
  		 	
  		 	 // 새글쓰기
  	 		@RequestMapping("/WinnerWriteForm")
  	 		public ModelAndView winnerWriteForm(
  	 			@RequestParam HashMap<String, Object> map
  	 			) {
  	 			
  	 			// 메뉴 이름 알아오기
  	 			String submenu_id   = (String) map.get("submenu_id");
  	 			String submenu_name = menuService.getMenuName(submenu_id);
  	 			map.put("submenu_name", submenu_name);
  	 			
  	 			// 답글구분
  	 			int      idx      = 0;
  	 			AdminEventVo  eventVo  = null;
  	 			if( map.get("board_idx") != null  ) {
  	 				idx    =  Integer.parseInt( String.valueOf( map.get("board_idx") ) );
  	 				eventVo  =  managerService.getWinnerBoard( map );
  	 				String title  =  eventVo.getBoard_title();
  	 				String cont   =  ">> " + eventVo.getBoard_cont().replace("\n", "\n >> ");
  	 				cont         +=  "\n==============================\n"; 
  	 				eventVo.setBoard_title( title );
  	 				eventVo.setBoard_cont( cont );			
  	 			}
  	 			map.put("idx", idx);
  	 			
  	 			List<MenuVo> menuList = menuService.getMenuList();
  	 			List<SubmenuVo> submenuList = menuService.getSubmenuList1();
  	 			
  	 			
  	 			ModelAndView mv = new ModelAndView();
  	 			mv.setViewName("admin/adminWinnerWrite");
  	 			mv.addObject("menuList", menuList);
  	 			mv.addObject("submenuList", submenuList);
  	 			mv.addObject("vo", eventVo);
  	 			mv.addObject("map", map);
  	 			
  	 			return mv;
  	 		}
  	 		
  	 		@RequestMapping("/WinnerWrite")
  	 		public ModelAndView winnerWrite(
  	 				@RequestParam HashMap<String, Object> map,
  	 				HttpServletRequest request
  	 				) {
  	 			
  	 			
  	 			String  submenu_id  =  (String) map.get("submenu_id");
  	 			int     nowpage  =  Integer.parseInt(String.valueOf(map.get("nowpage")));
  	 			// 글쓰기 및 파일저장
  	 			managerService.setWinnerWrite(map, request);
  	 			
  	 			String fmt = "redirect:/Manager/WinnerList?submenu_id=%s&nowpage=%d";
  	 			String loc = String.format(fmt, submenu_id, nowpage);
  	 			
  	 			ModelAndView mv = new ModelAndView();
  	 			mv.setViewName(loc);
  	 			
  	 			return mv;
  	 		}
  	 		
 	// 수정창
  			
  			@RequestMapping("/WinnerUpdateForm")
  			public ModelAndView winnerUpdateForm(
  				@RequestParam	HashMap<String, Object>  map
  					) {
  				
  				AdminEventVo eventVo = managerService.getWinnerBoard(map);
  				
  				String        submenu_id = (String) map.get("submenu_id");
  				String        menuname   = menuService.getMenuName(submenu_id);
  				map.put("submenu_id", submenu_id);
  				
  				String content = eventVo.getBoard_cont();
  				if(content == null) {
  					eventVo.setBoard_cont("");
  				} else {
  					content = content.replace("\n", "<br>");
  					// content += "\n===============================\n";
  					eventVo.setBoard_cont(content);
  				}
  				
  				// fileList
  				List<FileVo>  fileList =  managerService.getFileList( map ); 
  				
  				ModelAndView mv = new ModelAndView();
  				mv.setViewName("admin/adminWinnerUpdate");
  				mv.addObject("map", map);
  				mv.addObject("fileList", fileList);
  				mv.addObject("vo", eventVo);
  				
  				return mv;
  			}
  			
  			// 게시글 수정
  			@RequestMapping("/WinnerUpdate")
  			public ModelAndView winnerUpdate(
  					@RequestParam  HashMap<String, Object> map,
  					HttpServletRequest request
  					) {
  				
  				managerService.setWinnerUpdate(map, request);
  				
  				System.out.println(map);
  				
  				int     board_idx   =  Integer.parseInt( String.valueOf(map.get("board_idx")) );  
  				String  submenu_id  =  (String) map.get( "submenu_id" );
  				String  nowpage     =  String.valueOf(map.get("nowpage"));
  				String  fmt      	=  "redirect:/Manager/WinnerView?board_idx=%d&submenu_id=%s&nowpage=%s";
  				String  loc      	=  String.format(fmt, board_idx, submenu_id, nowpage);
  				
  				ModelAndView mv = new ModelAndView();
  				mv.setViewName(loc);
  				mv.addObject("map", map);
  				
  				return mv;
  			}
  			
  			// 게시글 삭제
  			@RequestMapping("/WinnerDelete")
  			public ModelAndView winnerDelete(
  				@RequestParam   HashMap<String,  Object>  map
  					) {
  				
  				managerService.setWinnerDelete(map);
  				
  				String submenu_id  =  map.get("submenu_id").toString();
  				String nowpage     = String.valueOf(map.get("nowpage"));
  				String fmt 		   = "redirect:/Manager/WinnerList?submenu_id=%s&nowpage=%s";
  				String loc 		   = String.format(fmt, submenu_id, nowpage);
  				
  				System.out.println(map);
  				
  				ModelAndView   mv  = new ModelAndView();
  				mv.setViewName(loc);
  				mv.addObject("map", map);

  				return mv;
  			}

  	
  //행사 등록----------------------------------------------------------------------------
  	@RequestMapping("SeminarWriteForm")
  	public ModelAndView SeminarWriteForm( @RequestParam HashMap<String, Object> map,
  			HttpServletRequest request) {
  		
  		ModelAndView mv = new ModelAndView();
  		mv.setViewName("/admin/seminarWriteSave");
  		return mv;
  	}
    			
    @RequestMapping("SeminarWriteSave")
  	public ModelAndView SeminarWriteSave1( @RequestParam HashMap<String, Object> map,
  			HttpServletRequest request) {
  		
  		String  submenu_id  =  (String) map.get("submenu_id");
  		int     nowpage  =  Integer.parseInt(String.valueOf(map.get("nowpage")));
  		String  menu_id = (String) map.get("menu_id");
  		
  		String  address = (String) map.get("address");
  		String  board_cont = (String) map.get("board_cont");
  		String  board_contAddress = board_cont + "주소:" + address;
  		map.put("board_contAddress", board_contAddress);
  		
  		//등록 
  		managerService.insertSeminarSave(map, request);
  		
  		String fmt = "redirect:/Event/SeminarList?menu_id=%s&submenu_id=%s&nowpage=%d";
  		String loc = String.format(fmt, menu_id, submenu_id, nowpage);
  		
  		ModelAndView mv = new ModelAndView();
  		mv.setViewName(loc);
  		return mv;
  	}
    
    //행사 list 
    @RequestMapping("SeminarList")
	public ModelAndView SeminarList( @RequestParam HashMap<String, Object> map,
			HttpServletRequest request, HttpSession session) {
    	
    	ManagerVo ManagerVo = (ManagerVo) session.getAttribute("managerlogin");
		Object Managercode = ManagerVo.getManagercode();
		Object manager_pw = ManagerVo.getManager_pw();
		map.put("Managercode", Managercode);
		map.put("manager_pw", manager_pw);
		
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
		
		//목록 조회
		String 		  submenu_id = (String) map.get("submenu_id");
		List<AdminEventVo> boardList  = managerService.getSeminarList(map);
		
		AdminEventVo boardVo = (AdminEventVo) map.get("AdminEventVo");
		
		// 메뉴 이름 알아오기
		String submenu_name = menuService.getMenuName(submenu_id);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		map.put("submenu_name", submenu_name);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/seminarList");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("boardList", boardList);
		mv.addObject("boardVo", boardVo);
		mv.addObject("map", map);
		return mv;
	}
    
    // 행사 수정 원 글 들고오기
 	@RequestMapping("/SeminarUpdateForm")
     public ModelAndView SeminarUpdateForm(
     		@RequestParam	HashMap<String, Object>  map) {
 		
 		// fileList
 		List<FileVo>  fileList =  managerService.getFileList( map );
 		
 		// 보여줄 게시글 내용
 		AdminEventVo eventVo = managerService.getSeminarUpdateForm(map);
 		
 		//게시글 주소 분리 작업
		String boardAddress_cont = eventVo.getBoard_cont();
		int addressStart = boardAddress_cont.lastIndexOf("주소:");
		/* System.out.println(addressStart + "addressStart"); */
		//내용 저장
		String board_cont = boardAddress_cont.substring(0 , addressStart -1);
		map.put("board_cont", board_cont);
		/* System.out.println(board_cont + "board_cont"); */
		//주소 저장
		String address = boardAddress_cont.substring(addressStart + 3);
		map.put("address", address);
		/* System.out.println(map.toString() + "map"); */
		
 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("admin/seminarWriteSave");
 		mv.addObject("map", map);
 		mv.addObject("fileList", fileList);
 		mv.addObject("vo", eventVo);
 		
 		return mv;
 	}
 	
 	// 행사 수정창
    @RequestMapping("/SeminarUpdate")
    public ModelAndView SeminarUpdate(
     		@RequestParam  HashMap<String, Object> map,
 			HttpServletRequest request) {
     	
	    managerService.setUpdate(map, request);
	    
	 	ModelAndView mv = new ModelAndView();
	 	mv.addObject("map", map);
	 	mv.setViewName("redirect:/Manager/Store");
	     
	 	return mv;
    }
     
     // 스토어 상품 삭제
     @RequestMapping("/SeminarDelete")
     public ModelAndView SeminarDelete(
     		@RequestParam   HashMap<String,  Object>  map
     			) {
     	
     	managerService.deleteStore(map);
     	
     	ModelAndView   mv  = new ModelAndView();
 		mv.setViewName("redirect:/Manager/Store");
 		mv.addObject("map", map);

 		return mv;	
     }
    
			
  //-------------------------------------------------------------------
  // 파일 처리
  	@RequestMapping(value  = "/download/{type}/{sfile:.+}",
  	        method = RequestMethod.GET )
  	public   void   downloadFile(
  		@PathVariable("type")   String type,
  		@PathVariable("sfile")  String sfile,
  		HttpServletResponse     response
  		) throws IOException {
  	
  	String     INTERNAL_FILE         =  sfile;
  	String     EXTERNAL_FILE_PATH    =  "d:\\upload\\" + sfile;
  			
  	File       file  =  null;
  	if ( type.equalsIgnoreCase("internal")  ) {
  		ClassLoader   classLoader = 
  			Thread.currentThread().getContextClassLoader();
  		file   = new File( classLoader.getResource(INTERNAL_FILE).getPath() ); 
  	} else {
  		file   = new File( EXTERNAL_FILE_PATH );
  	}
  	
  	if( !file.exists()  ) {
  		String errorMessage = "죄송합니다.파일이 없습니다";
  		OutputStream  outputStream = response.getOutputStream();
  		outputStream.write(  errorMessage.getBytes(Charset.forName("UTF-8")) );
  		outputStream.close();
  		return;
  	}
  	
  	// 실제 다운로드
  	String  mimeType = URLConnection.guessContentTypeFromName(file.getName());
  	mimeType   =  "application/octet-stream";   // 무조건 다운로드
  	
  	// 파일명의 한글처리		
  	String   fname   = new String( 
  			file.getName().getBytes("UTF-8"), "ISO-8859-1" );
  	
  	response.setContentType( mimeType );
  	response.setHeader("Content-Disposition",
  		String.format("inline; filename=\"" + fname + "\"" ));
  	
  	response.setContentLength( (int) file.length() );
  	
  	InputStream   inputStream  = new BufferedInputStream(
  		new FileInputStream( file )	);
  	
  	FileCopyUtils.copy( inputStream, response.getOutputStream() );
  	
  	inputStream.close();
  	
  	
  	}
    
  	// 수정중 파일 삭제
 	@ResponseBody
 	@RequestMapping(
 		value    =  "/deleteFile",
 		method   = 	RequestMethod.GET,
 		headers  =  "Accept=application/json" )
 	public    void   deleteFile(
 		@RequestParam  HashMap<String, Object>  map	
 			) {
 		
 		managerService.deleteUploadFile( map );
 				
 	}
	
}
