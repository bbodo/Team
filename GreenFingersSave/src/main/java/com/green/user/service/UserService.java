package com.green.user.service;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserService {

	// 가입된 회원인지 체크
	UserVo getLogin(HashMap<String, Object> map);
	
	// 아이디 중복체크
	int idCheck(String userid);

	// 이메일 중복체크
	int emailCheck(String email);
	
	// 닉네임 중복체크
	int nicknameCheck(String nickname);
	
	// 가입하는 회원 정보 db에 저장하기
	void userWrite(HashMap<String, Object> map);
	
}
