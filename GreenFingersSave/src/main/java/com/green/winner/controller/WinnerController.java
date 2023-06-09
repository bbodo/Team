package com.green.winner.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;
import com.green.event.Vo.EventVo;
import com.green.event.service.EventService;
import com.green.market.vo.MarketVo;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.service.UserService;
import com.green.winner.Vo.WinnerVo;
import com.green.winner.service.WinnerService;

@RequestMapping("/Winner")
@Controller
public class WinnerController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private WinnerService winnerService;
	
	@Autowired
	private MenuService menuService;
	
	// 게시물 목록 보기
	// http://localhost:9090/Winner/List?submenu_id=SUBMENU01&nowpage=1
	// 마켓 메인 리스트
	@RequestMapping("/WinnerList")
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
	// ---------------------------------------------------------------------

	// 게시글 목록 불러오기
	String 		   submenu_id = (String) map.get("submenu_id");
	List<WinnerVo> winnerList  = winnerService.getWinnerList(map);
	
	map.put("submenu_id",submenu_id);
	
	WinnerVo winnerVo = (WinnerVo) map.get("winnerVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	System.out.println("위너리스트" + winnerList);
	System.out.println("위너맵" + map);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("event/winnerList");
	mv.addObject("winnerList", winnerList);
	mv.addObject("menuList", menuList);
	mv.addObject("submenuList", submenuList);
	mv.addObject("winnerVo", winnerVo);
	mv.addObject("map", map);
	return mv;
	}
	
	// 새글쓰기
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
		@RequestParam HashMap<String, Object> map
		) {
		
		// 메뉴 이름 알아오기
		String submenu_id   = (String) map.get("submenu_id");
		String submenu_name = menuService.getMenuName(submenu_id);
		map.put("submenu_name", submenu_name);
		
		// 답글구분
		int      idx      = 0;
		WinnerVo  winnerVo  = null;
		if( map.get("board_idx") != null  ) {
			idx    =  Integer.parseInt( String.valueOf( map.get("board_idx") ) );
			winnerVo  =  winnerService.getBoard( map );
			String title  =  winnerVo.getBoard_title();
			String cont   =  ">> " + winnerVo.getBoard_cont().replace("\n", "\n >> ");
			cont         +=  "\n==============================\n"; 
			winnerVo.setBoard_title( title );
			winnerVo.setBoard_cont( cont );			
		}
		map.put("idx", idx);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		System.out.println(winnerVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/winnerWrite");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("vo", winnerVo);
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		
		String  submenu_id  =  (String) map.get("submenu_id");
		int     nowpage  =  Integer.parseInt(String.valueOf(map.get("nowpage")));
		// 글쓰기 및 파일저장
		winnerService.setWrite(map, request);
		
		String fmt = "redirect:/Winner/WinnerList?submenu_id=%s&nowpage=%d";
		String loc = String.format(fmt, submenu_id, nowpage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
		
		return mv;
	}
	
	// 내용 보기
		// /Event/View?submenu_id=${eventVo.submenu_id}&board_idx=${eventVo.board_idx}&nowpage=${map.nowpage}
		@RequestMapping("/WinnerView")
		public ModelAndView view(
			@RequestParam HashMap<String, Object> map
				) {
			
			// 메뉴이름
			String  submenu_id   =  (String) map.get("submenu_id");
			String  submenu_name = menuService.getMenuName(submenu_id);
			map.put("submenu_id", submenu_id);
			
			// 보여줄 게시글 내용
			WinnerVo winnerVo = winnerService.getBoard(map);
			
			String content = winnerVo.getBoard_cont();
			if(content == null) {
				winnerVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
			} else {
				String cont = content.replace("\n", "<br>");
				winnerVo.setBoard_cont(cont);
			}
			
			
			List<MenuVo> menuList = menuService.getMenuList();
			List<SubmenuVo> submenuList = menuService.getSubmenuList1();
			
			List<FileVo> fileList = winnerService.getFileList(map);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("event/winnerView");
			mv.addObject("menuList", menuList);
			mv.addObject("submenuList", submenuList);
			mv.addObject("map", map);
			mv.addObject("fileList", fileList);
			mv.addObject("vo", winnerVo);
			
			return mv;
		}
		
		// 수정창
		// http://localhost:9090/Board/UpdateForm?menu_id=SUBMENU01&board_idx=10&nowpage=1
		@RequestMapping("/UpdateForm")
		public ModelAndView updateForm(
			@RequestParam	HashMap<String, Object>  map
				) {
			
			WinnerVo winnerVo = winnerService.getBoard(map);
			
			String        submenu_id = (String) map.get("submenu_id");
			String        menuname   = menuService.getMenuName(submenu_id);
			map.put("submenu_id", submenu_id);
			
			String content = winnerVo.getBoard_cont();
			if(content == null) {
				winnerVo.setBoard_cont("");
			} else {
				content = content.replace("\n", "<br>");
				// content += "\n===============================\n";
				winnerVo.setBoard_cont(content);
			}
			
			// fileList
			List<FileVo>  fileList =  winnerService.getFileList( map ); 
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("event/winnerUpdate");
			mv.addObject("map", map);
			mv.addObject("fileList", fileList);
			mv.addObject("vo", winnerVo);
			
			return mv;
		}
		
		// 게시글 수정
		@RequestMapping("/Update")
		public ModelAndView update(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request
				) {
			
			winnerService.setUpdate(map, request);
			
			int     board_idx   =  Integer.parseInt( String.valueOf(map.get("board_idx")) );  
			String  submenu_id  =  (String) map.get( "submenu_id" );
			String  nowpage     =  String.valueOf(map.get("nowpage"));
			String  fmt      	=  "redirect:/Winner/WinnerView?board_idx=%d&submenu_id=%s&nowpage=%s";
			String  loc      	=  String.format(fmt, board_idx, submenu_id, nowpage);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName(loc);
			mv.addObject("map", map);
			
			return mv;
		}
		
		// 게시글 삭제
		// /Board/Delete?submenu_id=$&board_idx=&nowpage=$
		@RequestMapping("/Delete")
		public ModelAndView delete(
			@RequestParam   HashMap<String,  Object>  map
				) {
			
			winnerService.setDelete(map);
			
			String submenu_id  =  map.get("submenu_id").toString();
			String nowpage     = String.valueOf(map.get("nowpage"));
			String fmt 		   = "redirect:/Winner/WinnerList?submenu_id=%s&nowpage=%s";
			String loc 		   = String.format(fmt, submenu_id, nowpage);
			
			ModelAndView   mv  = new ModelAndView();
			mv.setViewName(loc);
			mv.addObject("map", map);

			return mv;
		}
		
		

		
		//-------------------------------------------------------------------
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
		
		// 수정중 파일삭제
		@ResponseBody
		@RequestMapping(
			value    =  "/deleteFile",
			method   = 	RequestMethod.GET,
			headers  =  "Accept=application/json" )
		public    void   deleteFile(
			@RequestParam  HashMap<String, Object>  map	
				) {
			
			winnerService.deleteUploadFile( map );
					
		}
}
