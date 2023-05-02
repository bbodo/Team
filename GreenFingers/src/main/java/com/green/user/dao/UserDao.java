package com.green.user.dao;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface UserDao {

	void userWrite(HashMap<String, Object> map);

	UserVo getLogin(HashMap<String, Object> map);

}
