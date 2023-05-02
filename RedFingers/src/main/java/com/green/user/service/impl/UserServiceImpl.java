package com.green.user.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.dao.UserDao;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public void userWrite(HashMap<String, Object> map) {

		userDao.userWrite(map);
		
	}

	@Override
	public UserVo getLogin(HashMap<String, Object> map) {
		
		UserVo userVo = userDao.getLogin(map); 
		
		return userVo;
	}

}
