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

}
