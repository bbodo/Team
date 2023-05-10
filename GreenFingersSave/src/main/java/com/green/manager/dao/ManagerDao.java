package com.green.manager.dao;

import java.util.HashMap;
import java.util.List;

import com.green.user.vo.UserVo;

public interface ManagerDao {

	List<UserVo> getAlluser();

	UserVo getUser(HashMap<String, Object> map);

	void updateUser(HashMap<String, Object> map);

	int deleteUser(HashMap<String, Object> map);

	void addMenu(HashMap<String, Object> map);

	void addSimpleMenu(HashMap<String, Object> map);

	void updateMenu(HashMap<String, Object> map);

	int deleteMenu(HashMap<String, Object> map);

	void addSubMenu(HashMap<String, Object> map);

	int deleteSubmenu(HashMap<String, Object> map);

	void updateSubmenu(HashMap<String, Object> map);

}
