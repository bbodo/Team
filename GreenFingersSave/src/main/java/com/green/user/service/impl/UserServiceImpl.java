package com.green.user.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.manager.vo.ManagerVo;
import com.green.user.dao.UserDao;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	// 가입된 회원인지 체크
	@Override
	public UserVo getLogin(HashMap<String, Object> map) {
		
		UserVo userVo = userDao.getLogin(map); 
		
		return userVo;
	}
	
	// 아이디 중복체크
	@Override
	public UserVo idCheck(String userid) {
		UserVo idVo = userDao.idCheck(userid);
		return idVo; 
	}
	
	// 아이디 중복체크1
	@Override
	public int idCheck1(String userid) {
		int idCheckresult = userDao.idCheck1(userid);
		return idCheckresult; 
	}
	
	// 이메일 중복체크
	@Override
	public int emailCheck(String email) {
		int emailCheckresult = userDao.emailCheck(email);
		return emailCheckresult;   
	}
	
	// 닉네임 중복체크
	@Override
	public int nicknameCheck(String nickname) {
		int nicknameCheckresult = userDao.nicknameCheck(nickname);
		return nicknameCheckresult;
	}
	
	// 가입하는 회원 정보 db에 저장하기
	@Override
	public void userWrite(HashMap<String, Object> map) {

		userDao.userWrite(map);
		
	}

	@Override
	public ManagerVo getManager(HashMap<String, Object> map) {

		ManagerVo mVo = userDao.getManager(map);
		
		return mVo;
	}

	// 아이디 찾기
	@Override
	public String getUserId(HashMap<String, Object> map) {

		String userid = userDao.getUserId(map);
		
		return userid;
	}

	// 비밀번호 찾기
	@Override
	public String getUserPw(HashMap<String, Object> map) {

		String userpw = userDao.getUserPw(map);
		
		return userpw;
	}

}
