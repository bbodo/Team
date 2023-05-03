package com.green.board.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;

public interface BoardService {

	List<BoardVo> getBoardList(HashMap<String, Object> map);

	BoardVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setDelete(HashMap<String, Object> map);

}
