package com.green.winner.dao;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.FileVo;
import com.green.winner.Vo.WinnerVo;


public interface WinnerDao {
	List<WinnerVo> getWinnerList(HashMap<String, Object> map);

	WinnerVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);


}
