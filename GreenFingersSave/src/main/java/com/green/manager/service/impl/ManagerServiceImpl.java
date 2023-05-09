package com.green.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.manager.dao.ManagerDao;
import com.green.manager.service.ManagerService;
import com.green.user.vo.UserVo;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao managerDao;
	
	@Override
	public UserVo getAllUser() {

		UserVo vo = managerDao.getAlluser();
		
		return vo;
	}

}
