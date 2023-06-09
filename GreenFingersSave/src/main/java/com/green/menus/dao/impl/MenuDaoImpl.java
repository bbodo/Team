package com.green.menus.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.menus.dao.MenuDao;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 메뉴 목록 가져오기
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> menuList = sqlSession.selectList("Menu.MenuList");
		return menuList;
	}

	// menu_id를 가지고 서브메뉴 목록 가져오기
	@Override
	public List<SubmenuVo> getSubmenuList(HashMap<String, Object> map) {
		List<SubmenuVo> submenuList = sqlSession.selectList("Menu.SubmenuList",map);
		return submenuList;
	}

	// 서브메뉴 이름 알아오기
	@Override
	public String getMenuName(String submenu_id) {

		String name = sqlSession.selectOne("Menu.GetSubMenuName", submenu_id);
		
		return name;
	}

	// 서브메뉴 목록 가져오기
	@Override
	public List<SubmenuVo> getSubmenuList1() {
		List<SubmenuVo> submenuList = sqlSession.selectList("Menu.SubmenuList1");
		return submenuList;
	}


}
