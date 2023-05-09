package com.green.manager.service;

import java.util.HashMap;
import java.util.List;

import com.green.user.vo.UserVo;

public interface ManagerService {

	List<UserVo> getAllUser();

	UserVo getUser(HashMap<String, Object> map);

	void updateUser(HashMap<String, Object> map);

	int deleteUser(HashMap<String, Object> map);

}
