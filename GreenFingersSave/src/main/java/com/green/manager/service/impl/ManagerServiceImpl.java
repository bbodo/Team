package com.green.manager.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.manager.dao.ManagerDao;
import com.green.manager.service.ManagerService;
import com.green.user.vo.UserVo;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public List<UserVo> getAllUser() {

		List<UserVo> userList = managerDao.getAlluser();
		
		return userList;
	}

	@Override
	public UserVo getUser(HashMap<String, Object> map) {

		UserVo vo = managerDao.getUser(map);
		
		return vo;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {

		
		managerDao.updateUser(map);
		
	}

	@Override
	public int deleteUser(HashMap<String, Object> map) {

		int cnf = managerDao.deleteUser(map);
		
		return cnf;
	}

	@Override
	public void addMenu(HashMap<String, Object> map) {

		managerDao.addMenu(map);
		
	}

	@Override
	public void addSimpleMenu(HashMap<String, Object> map) {

		managerDao.addSimpleMenu(map);
		
	}

}
