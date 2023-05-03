package com.green.board.service;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getBoardList(HashMap<String, Object> map);

	BoardVo getBoard(HashMap<String, Object> map);

}
