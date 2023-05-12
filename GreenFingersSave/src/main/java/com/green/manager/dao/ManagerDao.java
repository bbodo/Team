package com.green.manager.dao;

import java.util.HashMap;
import java.util.List;

import com.green.event.Vo.EventVo;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.vo.FileVo;
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

	List<StoreVo> getStoreList();

	void addStore(HashMap<String, Object> map);

	StoreVo getBoard(HashMap<String, Object> map);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void deleteStore(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	List<EventVo> getEventList(HashMap<String, Object> map);

	EventVo getEventBoard(HashMap<String, Object> map);



}
