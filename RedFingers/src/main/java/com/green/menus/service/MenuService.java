package com.green.menus.service;

import java.util.HashMap;
import java.util.List;

import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

public interface MenuService {

	// 메뉴 목록 가져오기
	List<MenuVo> getMenuList();

	// 서브메뉴 목록 가져오기
	List<SubmenuVo> getSubmenuList(HashMap<String, Object> map);

}
