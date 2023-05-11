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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.service.ManagerService;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;
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
