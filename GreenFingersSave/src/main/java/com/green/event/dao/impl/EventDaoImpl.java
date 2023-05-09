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

		sqlSession.update("Event.UpdateReadCount", map);
		
		EventVo vo = sqlSession.selectOne("Event.GetBoard", map);
		
		return vo;
	}


	@Override
	public void setWrite(HashMap<String, Object> map) {
		// db 정보 저장
		// Board  에 저장
		int  bnum = Integer.parseInt( (String) map.get("bnum") );
		if ( bnum == 0 ) {
			sqlSession.insert("Event.EventInsert", map); // 새글
		} else {
			sqlSession.update("Event.StepUpdate", map); // 새글			
			sqlSession.insert("Event.EventReply", map); // 새글			
		}
		
		// Files  에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Event.FileInsert", map);
		
		
	}
	
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo>  fileList  =  sqlSession.selectList("Event.FileList", map);
		
		return fileList;
	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		sqlSession.delete("Event.DeleteUploadFile", map);
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {

		// Board 정보 수정
		sqlSession.update("Event.EventUpdate", map);
		
		// File 정보 수정
		List<FileVo>  fileList  =  (List<FileVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Event.FileUpdate", map );
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete( "Event.BoardDelNum", map); // delboard를 1로 만듬
		int  childCnt = sqlSession.selectOne("Event.ChildCnt", map); // 자식있는지 확인
		EventVo vo = sqlSession.selectOne("Event.GetBoard", map);
		
		List<FileVo> fileList = getFileList(map);
		map.put("fileList", fileList);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			sqlSession.delete("Event.FileDelete", map);
			sqlSession.delete("Event.EventDelete", map);
		}
		int board_idx = vo.getParent();
		BoardVo vo1 = sqlSession.selectOne("Event.GetBoard", board_idx);
		
		childCnt = sqlSession.selectOne("Event.ChildCnt", vo1);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			sqlSession.delete("Event.FileDelete", vo1);
			sqlSession.delete("Event.EventDelete", vo1);
		}
		
	}


	

}
