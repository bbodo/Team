package com.green.market.controller;

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

import com.green.market.service.MarketService;
import com.green.market.vo.FileVo;
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
	private MarketService marketService;
	
	
	// 마켓 메인 홈
	@RequestMapping("/Main")
	public ModelAndView main(
			@RequestParam HashMap<String, Object> map
			) {
		
	// 메뉴 목록	
	List<MenuVo>    menuList    = menuService.getMenuList();
	List<SubmenuVo> submenuList = menuService.getSubmenuList1();
	
	// ---------------------------------------------------------------------
	// 페이징 정보 준비
	int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
	int           pagecount =  5;    // 한페이지 당 출력할 줄(row)수  

	// sql 사용할 변수 : 조회할 레코드 번호
	int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
	int           endnum    =  nowpage  *  pagecount;

	map.put("pagecount", pagecount );
	map.put("startnum",  startnum );
	map.put("endnum",    endnum );		
	// ---------------------------------------------------------------------

	// 게시글 목록 불러오기
	String 		  submenu_id   = (String) map.get("submenu_id");
	List<MarketVo> marketList  = marketService.getMarketList(map);
	
	MarketVo marketVo = (MarketVo) map.get("marketVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	//System.out.println("마켓리스트" + marketList);
	//System.out.println("마켓맵" + map);
	
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
	List<MenuVo>    menuList    = menuService.getMenuList();
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
	String 		  submenu_id   = (String) map.get("submenu_id");
	List<MarketVo> marketList  = marketService.getMarketList(map);
	
	MarketVo marketVo = (MarketVo) map.get("marketVo");
	
	// 메뉴 이름 알아오기
	String submenu_name = menuService.getMenuName(submenu_id);
	
	map.put("submenu_name", submenu_name);

	//System.out.println("마켓리스트" + adoptList);
	System.out.println("마켓맵" + map);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName("market/list");
	mv.addObject("marketList", marketList);
	mv.addObject("menuList", menuList);
	mv.addObject("submenuList", submenuList);
	mv.addObject("marketVo", marketVo);
	mv.addObject("map", map);
	
    return mv;
    }
    
	//----------------------------------------------------------------------
	// 새글쓰기 창
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
		@RequestParam HashMap<String, Object> map
		) {
		
		// 메뉴 목록	
		List<MenuVo>    menuList    = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		// 메뉴 이름
		String submenu_id   = String.valueOf( map.get("submenu_id") );
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
	
	// 새글쓰기
    @RequestMapping("/Write")
    public ModelAndView write(
    		@RequestParam HashMap<String, Object> map,
    		HttpServletRequest request
    		) {
    	
    	String submenu_id = String.valueOf( map.get("submenu_id") );
		int    nowpage    = Integer.parseInt( String.valueOf( map.get("nowpage") ) );
    	
		// 글쓰기 및 파일 저장
		marketService.setWrite( map, request );
		
		String fmt = "redirect:/Market/List?submenu_id=%s&nowpage=%d";
		String loc = String.format( fmt, submenu_id, nowpage );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject( "map", map );
		mv.setViewName( loc );
		
		return mv;
    }
    
    //----------------------------------------------------------------------
    // 게시글 보기
    @RequestMapping("/View")
    public ModelAndView view(
    		@RequestParam HashMap<String, Object> map
    			) {
    	
    	// 메뉴 목록	
		List<MenuVo>    menuList    = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		// 메뉴 이름
		String submenu_id = String.valueOf( map.get("submenu_id") );
		String submenu_name = menuService.getMenuName(submenu_id);
		map.put("submenu_name", submenu_name);
    	
		// 보여줄 게시글 내용
		MarketVo marketVo = marketService.getBoard(map);
		
		String content = marketVo.getBoard_cont();
		if(content == null) {
			marketVo.setBoard_cont("------------------------------내용이 없습니다------------------------------");
		} else {
			String cont = content.replace("\n", "<br>");
			marketVo.setBoard_cont(cont);
		}
		
		List<FileVo> fileList = marketService.getFileList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("market/view");
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", marketVo);
		
    	return mv;
    }

    //----------------------------------------------------------------------
    // 게시글 수정창
    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(
    		@RequestParam	HashMap<String, Object>  map
    		) {
    	MarketVo marketVo = marketService.getBoard(map);
    
    	// 메뉴 이름
 		String submenu_id = String.valueOf( map.get("submenu_id") );
 		String submenu_name = menuService.getMenuName(submenu_id);
 		map.put("submenu_name", submenu_name);
    
 		String content = marketVo.getBoard_cont();
		if(content == null) {
			marketVo.setBoard_cont("");
		} else {
			content = content.replace("\n", "<br>");
			// content += "\n===============================\n";
			marketVo.setBoard_cont(content);
		}
		
		// fileList
		List<FileVo>  fileList =  marketService.getFileList( map ); 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("market/update");
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", marketVo);
		
		return mv;
    }
    
    // 게시글 수정  
    @RequestMapping("/Update")
    public ModelAndView update(
    		@RequestParam  HashMap<String, Object> map,
			HttpServletRequest request
    		) {
    	
    marketService.setUpdate(map, request);
    
    int     board_idx   =  Integer.parseInt( String.valueOf(map.get("board_idx")) );  
	String  submenu_id  =  (String) map.get( "submenu_id" );
	String  nowpage     =  String.valueOf(map.get("nowpage"));
	String  fmt      	=  "redirect:/Market/View?board_idx=%d&submenu_id=%s&nowpage=%s";
	String  loc      	=  String.format(fmt, board_idx, submenu_id, nowpage);
	
	ModelAndView mv = new ModelAndView();
	mv.setViewName(loc);
	mv.addObject("map", map);
    
	return mv;
    }
    
    //----------------------------------------------------------------------
    // 게시글 삭제
 	@RequestMapping("/Delete")
 	public ModelAndView delete(
 		@RequestParam   HashMap<String,  Object>  map
 			) {
 		
 		marketService.setDelete(map);
 		
 		String submenu_id  =  map.get("submenu_id").toString();
 		String nowpage     = String.valueOf(map.get("nowpage"));
 		String fmt 		   = "redirect:/Market/List?submenu_id=%s&nowpage=%s";
 		String loc 		   = String.format(fmt, submenu_id, nowpage);
 		
 		ModelAndView   mv  = new ModelAndView();
 		mv.setViewName(loc);
 		mv.addObject("map", map);

 		return mv;
 	}

 	//첨부 이미지 처리
 	//----------------------------------------------------------------------
 	/*
 	@GetMapping("imageView")
	public void imgView(@RequestParam("imgFile") String imgFile,
		HttpServletResponse response) throws IOException {
	    response.addHeader(
		"Content-disposition","attachment;fileName="+imgFile); //파일을 다운받고, 브라우저로 표현하고, 다운될 파일이름
	    File file = new File(marketFileService.IMAGE_REPO+"/"+imgFile);
	    FileInputStream in = new FileInputStream(file);
	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	*/
 	//----------------------------------------------------------------------
 	// 첨부 파일 처리
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
 		
 		marketService.deleteUploadFile( map );
 				
 	}
    

}
