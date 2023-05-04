package com.green.user.service;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserService {

	// 가입된 회원인지 체크
	UserVo getLogin(HashMap<String, Object> map);
	
	void userWrite(HashMap<String, Object> map);

	
}
