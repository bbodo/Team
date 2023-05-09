package com.green.manager.dao.impl;

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

}
