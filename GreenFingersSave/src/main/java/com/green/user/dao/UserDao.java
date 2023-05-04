package com.green.user.dao;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserDao {
	
	// 가입된 회원인지 체크
	UserVo getLogin(HashMap<String, Object> map);

	void userWrite(HashMap<String, Object> map);

}
