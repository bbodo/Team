package com.green.event.service;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;

public interface EventService {


	List<EventVo> getAdoptList(HashMap<String, Object> map);

	EventVo getBoard(HashMap<String, Object> map);

}
