package com.green.event.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;
import com.green.event.Vo.EventVo;
import com.green.event.dao.EventDao;
import com.green.event.service.EventService;
import com.green.market.vo.MarketVo;

@Repository("eventDao")
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 입양 리스트
	@Override
	public List<EventVo> getEventList(
			HashMap<String, Object> map
			) {
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Event.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		System.out.println(map);
		
		// 메뉴 목록 조회 (페이징)
		List<EventVo> eventList = sqlSession.selectList("Event.EventList", map);
		
		return eventList;
	}

	
	@Override
	public EventVo getBoard(HashMap<String, Object> map) {

		sqlSession.update("Event.UpdaateReadCount", map);
		
		EventVo vo = sqlSession.selectOne("Event.GetBoard", map);
		
		return vo;
	}


	

}
