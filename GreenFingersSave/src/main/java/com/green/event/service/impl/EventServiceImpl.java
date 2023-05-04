package com.green.event.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.dao.BoardDao;
import com.green.board.service.impl.BoardPaging;
import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;
import com.green.event.dao.EventDao;
import com.green.event.service.EventService;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
	@Override
	public List<EventVo> getEventList(HashMap<String, Object> map) {

		// 필요한 자료를 조회( 10개 rows 만)
		List<EventVo>  eventList = eventDao.getEventList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		EventPaging   bp    =  new EventPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		EventVo   eventVo  = bp.getPdsPagingInfo();
		
		map.put("eventVo", eventVo);
		
		
		return     eventList;
	}

	@Override
	public EventVo getEvent(HashMap<String, Object> map) {
		EventVo vo = eventDao.getEvent(map);
		
		return vo;
	}

}
