package com.green.board.controller;

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
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

@RequestMapping("/Board")
@Controller
public class BoardController {
	
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
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		map.put("submenu_name", submenu_name);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("boardList", boardList);
		mv.addObject("boardVo", boardVo);
		mv.addObject("map", map);
		
		return mv;
	}
	
	// 새글/답글 쓰기 폼으로 가기
	// http://localhost:9090/Board/WriteForm?submenu_id=SUBMENU01&bnum=0&lvl=0&step=0&nref=0&nowpage=1&userid=즐기자 새글
	// http://localhost:9090/Board/WriteForm?submenu_id=SUBMENU01&board_idx=2&bnum=2&lvl=0&step=0&nref=2 답글
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
		@RequestParam HashMap<String, Object> map ) {
		
		// 메뉴 이름 알아오기
		String submenu_id   = (String) map.get("submenu_id");
		String submenu_name = menuService.getMenuName(submenu_id);
		map.put("submenu_name", submenu_name);
		
		// 답글구분
		int      idx      = 0;
		BoardVo  boardVo  = null;
		if( map.get("board_idx") != null  ) {
			idx    =  Integer.parseInt( String.valueOf( map.get("board_idx") ) );
			boardVo  =  boardService.getBoard( map );
			String title  =  boardVo.getBoard_title();
			String cont   =  ">> " + boardVo.getBoard_cont().replace("\n", "\n >> ");
			cont         +=  "\n==============================\n"; 
			boardVo.setBoard_title( title );
			boardVo.setBoard_cont( cont );			
		}
		map.put("idx", idx);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/write");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("vo", boardVo);
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
		String  menu_id = (String) map.get("menu_id");
		
		// 글쓰기 및 파일저장
		boardService.setWrite(map, request);
		
		String fmt = "redirect:/Board/List?menu_id=%s&submenu_id=%s&nowpage=%d";
		String loc = String.format(fmt, menu_id, submenu_id, nowpage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
		
		return mv;
	}
	
	// 내용 보기
	// /Board/View?submenu_id=${boardVo.submenu_id}&board_idx=${boardVo.board_idx}&nowpage=${map.nowpage}
	@RequestMapping("/View")
	public ModelAndView view(
		@RequestParam HashMap<String, Object> map
			) {
		
		// 메뉴이름
		String  submenu_id   =  (String) map.get("submenu_id");
		String  submenu_name = menuService.getMenuName(submenu_id);
		map.put("submenu_name", submenu_name);
		map.put("submenu_id", submenu_id);
		
		// 보여줄 게시글 내용
		BoardVo boardVo = boardService.getBoard(map);
		
		String content = boardVo.getBoard_cont();
		if(content == null) {
			boardVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
		} else {
			String cont = content.replace("\n", "<br>");
			boardVo.setBoard_cont(cont);
		}
		
		List<FileVo> fileList = boardService.getFileList(map);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		System.out.println(submenuList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", boardVo);
		
		return mv;
	}
	
	// 수정창
	// http://localhost:9090/Board/UpdateForm?menu_id=SUBMENU01&board_idx=10&nowpage=1
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(
		@RequestParam	HashMap<String, Object>  map
			) {
		
		BoardVo boardVo = boardService.getBoard(map);
		
		String        submenu_id = (String) map.get("submenu_id");
		String        menuname   = menuService.getMenuName(submenu_id);
		map.put("submenu_id", submenu_id);
		
		String content = boardVo.getBoard_cont();
		if(content == null) {
			boardVo.setBoard_cont("");
		} else {
			content = content.replace("\n", "<br>");
			// content += "\n===============================\n";
			boardVo.setBoard_cont(content);
		}
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		// fileList
		List<FileVo>  fileList =  boardService.getFileList( map ); 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/update");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", boardVo);
		
		return mv;
	}
	
	// 게시글 수정
	@RequestMapping("/Update")
	public ModelAndView update(
			@RequestParam  HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		boardService.setUpdate(map, request);
		
		int     board_idx   =  Integer.parseInt( String.valueOf(map.get("board_idx")) );  
		String  submenu_id  =  (String) map.get( "submenu_id" );
		String  nowpage     =  String.valueOf(map.get("nowpage"));
		String  menu_id     =  (String) map.get("menu_id");
		String  fmt      	=  "redirect:/Board/View?menu_id=%s&board_idx=%d&submenu_id=%s&nowpage=%s";
		String  loc      	=  String.format(fmt, menu_id, board_idx, submenu_id, nowpage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
		mv.addObject("map", map);
		
		return mv;
	}
	
	// 게시글 삭제
	// /Board/Delete?menu_id=${ map.menu_id }&submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}
	@RequestMapping("/Delete")
	public ModelAndView delete(
		@RequestParam   HashMap<String,  Object>  map
			) {
		
		boardService.setDelete(map);
		
		String submenu_id  =  map.get("submenu_id").toString();
		String nowpage     = String.valueOf(map.get("nowpage"));
		String menu_id     = (String) map.get("menu_id");
		String fmt 		   = "redirect:/Board/List?menu_id=%s&submenu_id=%s&nowpage=%s";
		String loc 		   = String.format(fmt, menu_id, submenu_id, nowpage);
		
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
		
		boardService.deleteUploadFile( map );
				
	}
	
}
