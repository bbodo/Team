package com.green.menus.service;

import java.util.HashMap;
import java.util.List;

import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

public interface MenuService {

	// 메뉴 목록 가져오기
	List<MenuVo> getMenuList();

	// menu_id를 가지고 서브메뉴 목록 가져오기
	List<SubmenuVo> getSubmenuList(HashMap<String, Object> map);

	String getMenuName(String submenu_id);
	
	// 서브메뉴 목록 가져오기
	List<SubmenuVo> getSubmenuList1();

}
