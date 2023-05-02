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

	// 서브메뉴 목록 가져오기
	@Override
	public List<SubmenuVo> getSubmenuList(HashMap<String, Object> map) {
		List<SubmenuVo> submenuList = sqlSession.selectList("Menu.SubmenuList",map);
		return submenuList;
	}

}
