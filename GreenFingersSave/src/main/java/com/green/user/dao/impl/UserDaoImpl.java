package com.green.user.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.manager.vo.ManagerVo;
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
	
	// 아이디 중복체크
	@Override
	public UserVo idCheck(String userid) {
		UserVo idVo = sqlSession.selectOne("User.UseridCheck", userid);
		return idVo; 
	}
	
	// 아이디 중복체크1
	@Override
	public int idCheck1(String userid) {
		int idCheckresult = sqlSession.selectOne("User.UseridCheck1", userid);
		return idCheckresult; 
	}
	
	// 이메일 중복체크
	@Override
	public int emailCheck(String email) {
		int emailCheckresult = sqlSession.selectOne("User.EmailCheck", email);
		return emailCheckresult;   
	}
	
	// 닉네임 중복체크
	@Override
	public int nicknameCheck(String nickname) {
		int nicknameCheckresult = sqlSession.selectOne("User.NicknameCheck", nickname);
		return nicknameCheckresult;
	}
	
	// 회원가입
	@Override
	public void userWrite(HashMap<String, Object> map) {
		
		map.put("grade", "씨앗");
		sqlSession.insert("User.UserWrite", map);
		
	}

	// 관리자 로그인
	@Override
	public ManagerVo getManager(HashMap<String, Object> map) {

		ManagerVo mVo = sqlSession.selectOne("User.GetManager", map);
		
		return mVo;
	}

}
