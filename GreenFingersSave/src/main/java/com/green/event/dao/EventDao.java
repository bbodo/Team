package com.green.event.dao;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;
import com.green.event.Vo.EventVo;


public interface EventDao {
	
	List<EventVo> getEventList(HashMap<String, Object> map);

	EventVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);

	List<FileVo> getFileList1(String submenu_id);

	List<BoardVo> getSeminarList(HashMap<String, Object> map);

	//BoardVo getSeminarBoard(HashMap<String, Object> map);

}
