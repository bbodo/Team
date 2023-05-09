package com.green.manager.dao;

import java.util.HashMap;
import java.util.List;

import com.green.user.vo.UserVo;

public interface ManagerDao {

	List<UserVo> getAlluser();

	UserVo getUser(HashMap<String, Object> map);

	void updateUser(HashMap<String, Object> map);

	int deleteUser(HashMap<String, Object> map);

}
