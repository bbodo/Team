package com.green.manager.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.service.ManagerService;
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
	
	// 스토어 수정창
	@RequestMapping("/storeUpdateForm")
    public ModelAndView storeUpdateForm(
    		@RequestParam	HashMap<String, Object>  map
    		) {
		StoreVo storeVo = managerService.getBoard(map);
		
		String content = storeVo.getBoard_cont();
		if(content == null) {
			storeVo.setBoard_cont("");
		} else {
			content = content.replace("\n", "<br>");
			// content += "\n===============================\n";
			storeVo.setBoard_cont(content);
		}
		
		// fileList
		List<FileVo>  fileList =  managerService.getFileList( map );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("market/storeupdate");
		mv.addObject("map", map);
		mv.addObject("fileList", fileList);
		mv.addObject("vo", storeVo);
		
		return mv;
}
	
	
}
