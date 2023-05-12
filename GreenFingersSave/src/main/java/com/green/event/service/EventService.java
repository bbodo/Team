package com.green.event.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;
import com.green.event.Vo.EventVo;

public interface EventService {

	List<EventVo> getEventList(HashMap<String, Object> map);
	
	EventVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);
	
	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setDelete(HashMap<String, Object> map);

	List<FileVo> getFileList1(String submenu_id);



}
