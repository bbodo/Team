package com.green.event.service;

import java.util.HashMap;
import java.util.List;

import com.green.event.Vo.EventVo;

public interface EventService {


	List<EventVo> getEventList(HashMap<String, Object> map);

}