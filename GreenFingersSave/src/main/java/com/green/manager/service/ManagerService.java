package com.green.manager.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.event.Vo.EventVo;
import com.green.manager.vo.AdminEventVo;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.vo.FileVo;
import com.green.user.vo.UserVo;

public interface ManagerService {
	
	List<UserVo> getAllUser();

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

	void addStore(HashMap<String, Object> map, HttpServletRequest request);

	StoreVo getBoard(HashMap<String, Object> map);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void deleteStore(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);
	
	List<AdminEventVo> getEventList(HashMap<String, Object> map);

	AdminEventVo getEventBoard(HashMap<String, Object> map);

	void setEventWrite(HashMap<String, Object> map, HttpServletRequest request);

	void setEventUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setEventDelete(HashMap<String, Object> map);

	List<AdminEventVo> getWinnerList(HashMap<String, Object> map);

	AdminEventVo getWinnerBoard(HashMap<String, Object> map);
	
	void setWinnerWrite(HashMap<String, Object> map, HttpServletRequest request);

	void setWinnerDelete(HashMap<String, Object> map);

	void setWinnerUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void insertSeminarSave(HashMap<String, Object> map, HttpServletRequest request);

	List<AdminEventVo> getSeminarList(HashMap<String, Object> map);
	

	AdminEventVo getSeminarUpdateForm(HashMap<String, Object> map);

	void setSeminarEdit(HashMap<String, Object> map, HttpServletRequest request);



	


}
