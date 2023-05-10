package com.green.manager.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.manager.dao.ManagerDao;
import com.green.user.vo.UserVo;

@Repository("managerDao")
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserVo> getAlluser() {

		List<UserVo> userList = sqlSession.selectList("Manager.GetAllUser");
		
		return userList;
	}

	@Override
	public UserVo getUser(HashMap<String, Object> map) {

		UserVo vo = sqlSession.selectOne("Manager.GetUser", map);
		
		return vo;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateUser", map);
		
	}

	@Override
	public int deleteUser(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteUser", map);
		
		return cnf;
	}

	@Override
	public void addMenu(HashMap<String, Object> map) {
		
		sqlSession.insert("Manager.AddMenu", map);
		
	}

	@Override
	public void addSimpleMenu(HashMap<String, Object> map) {

		sqlSession.insert("Manager.AddMenu2", map);
		
	}

	@Override
	public void updateMenu(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateMenu", map);
		
	}

	@Override
	public int deleteMenu(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteMenu", map);
		
		return cnf;
	}

	@Override
	public void addSubMenu(HashMap<String, Object> map) {

		sqlSession.insert("Manager.AddSubMenu", map);
		
	}

	@Override
	public int deleteSubmenu(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteSubmenu", map);
		
		return cnf;
	}

	@Override
	public void updateSubmenu(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateSubmenu", map);
		
	}

}
