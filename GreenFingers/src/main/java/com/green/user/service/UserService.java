package com.green.user.service;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserService {

	void userWrite(HashMap<String, Object> map);

	UserVo getLogin(HashMap<String, Object> map);
	
}
