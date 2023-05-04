package com.green.event.dao;

import java.util.HashMap;
import java.util.List;

import com.green.event.Vo.EventVo;


public interface EventDao {
	List<EventVo> getEventList(HashMap<String, Object> map);

	EventVo getEvent(HashMap<String, Object> map);


}
