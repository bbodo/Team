package com.green.board.dao;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;

public interface BoardDao {

	List<BoardVo> getBoardList(HashMap<String, Object> map);

	BoardVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map);

	List<FileVo> getFileList(HashMap<String, Object> map);

}
