package com.green.user.dao;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserDao {
	
	// 가입된 회원인지 체크
	UserVo getLogin(HashMap<String, Object> map);
	
	// 아이디 중복체크
	int idCheck(String userid);

	// 이메일 중복체크
	int emailCheck(String email);
	
	// 닉네임 중복체크
	int nicknameCheck(String nickname);
	
	
	void userWrite(HashMap<String, Object> map);

}
