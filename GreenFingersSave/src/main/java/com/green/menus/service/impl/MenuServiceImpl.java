package com.green.menus.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.event.dao.EventDao;
import com.green.menus.dao.MenuDao;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	// 메뉴 목록 가져오기
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> menuList = menuDao.getMenuList();
		return menuList;
	}

	// menu_id를 가지고 서브메뉴 목록 가져오기
	@Override
	public List<SubmenuVo> getSubmenuList(HashMap<String, Object> map) {
		List<SubmenuVo> submenuList = menuDao.getSubmenuList(map);
		return submenuList;
	}

	@Override
	public String getMenuName(String submenu_id) {

		String name = menuDao.getMenuName(submenu_id);
		
		return name;
	}

	// 서브메뉴 목록 가져오기
	@Override
	public List<SubmenuVo> getSubmenuList1() {
		List<SubmenuVo> submenuList = menuDao.getSubmenuList1();
		return submenuList;
	}

}
