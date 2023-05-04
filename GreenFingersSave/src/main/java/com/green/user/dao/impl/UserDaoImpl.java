package com.green.user.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.user.dao.UserDao;
import com.green.user.vo.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;
	
	// 가입된 회원인지 체크
	@Override
	public UserVo getLogin(HashMap<String, Object> map) {
		
		UserVo userVo = sqlSession.selectOne("User.GetLogin", map);
		
		return userVo;
	}
	
	@Override
	public void userWrite(HashMap<String, Object> map) {
		
		map.put("grade", "씨앗");
		sqlSession.insert("User.UserWrite", map);
		
	}


}
