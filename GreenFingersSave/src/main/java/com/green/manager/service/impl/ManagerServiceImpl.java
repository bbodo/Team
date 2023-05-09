package com.green.manager.service.impl;

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

}
