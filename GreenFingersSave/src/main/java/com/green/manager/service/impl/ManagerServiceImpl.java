package com.green.manager.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.manager.dao.ManagerDao;
import com.green.manager.service.ManagerService;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.service.impl.MarketFile;
import com.green.market.service.impl.MarketPaging;
import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;
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

	@Override
	public void updateMenu(HashMap<String, Object> map) {

		managerDao.updateMenu(map);
	
	}

	@Override
	public int deleteMenu(HashMap<String, Object> map) {

		int cnf = managerDao.deleteMenu(map);
		
		return cnf;
	}

	@Override
	public void addSubMenu(HashMap<String, Object> map) {

		managerDao.addSubMenu(map);
		
	}

	@Override
	public int deleteSubmenu(HashMap<String, Object> map) {

		int cnf = managerDao.deleteSubmenu(map);
		
		return cnf;
	}

	@Override
	public void updateSubmenu(HashMap<String, Object> map) {

		managerDao.updateSubmenu(map);
		
		
	}

	//-----------------------------------------------------------
	// 스토어 관리 
	@Override
	public List<StoreVo> getStoreList() {
		
		List<StoreVo> storeList = managerDao.getStoreList();
		
		return storeList;
	}

	// 스토어 상품 등록
	@Override
	public void addStore(
			HashMap<String, Object> map,
			HttpServletRequest request) {
		
		// request 처리
		MarketFile.save(map, request);
		
		// 넘어온 정보 저장
		managerDao.addStore(map);
	}

	
	@Override
	public StoreVo getBoard(HashMap<String, Object> map) {

		StoreVo vo = managerDao.getBoard(map);
		
		return vo;
	}

	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {
		
		List<FileVo> fileList = managerDao.getFileList(map);
		
		return fileList;
	}


}
