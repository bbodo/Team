package com.green.winner.service;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.green.board.vo.FileVo;
import com.green.winner.Vo.WinnerVo;

public interface WinnerService {



	WinnerVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);
	
	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setDelete(HashMap<String, Object> map);

	List<WinnerVo> getWinnerList(HashMap<String, Object> map);

}
