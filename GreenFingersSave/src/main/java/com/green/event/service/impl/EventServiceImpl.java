package com.green.event.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.dao.BoardDao;
import com.green.board.service.impl.BoardFile;
import com.green.board.service.impl.BoardPaging;
import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;
import com.green.event.Vo.EventVo;
import com.green.event.dao.EventDao;
import com.green.event.service.EventService;
import com.green.market.dao.MarketDao;
import com.green.market.service.impl.MarketPaging;
import com.green.market.vo.MarketVo;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
	
	
	@Override
	public List<EventVo> getEventList(
			HashMap<String, Object> map
			) {
		// 필요한 자료를 조회( rows)
		List<EventVo>  eventList = eventDao.getEventList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage     =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount   =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount  =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		EventPaging   mp      =  new EventPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		EventVo   eventVo  = mp.getPdsPagingInfo();
		
		map.put("eventVo", eventVo);
		
		
		return     eventList;

	}

	@Override
	public EventVo getBoard(HashMap<String, Object> map) {

		EventVo vo = eventDao.getBoard(map);
		
		return vo;
	}

	@Override
	public void setWrite(
			HashMap<String, Object> map,
			HttpServletRequest request) {
		
		// request 처리
		EventFile.save(map, request);
		
		// 넘어온 정보 저장
		eventDao.setWrite(map);
		
	}
	
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {
				
		List<FileVo> fileList = eventDao.getFileList(map);
		System.out.println("서비스파일리스트" + fileList );
				
		return fileList;
	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		// d:\\upload\\ sfilename 에 해당되는 파일을 삭제
		
		String      filepath   =  "D:\\upload\\";   
		String      sfilename  =  (String) map.get("sfile");
		
		File  file  = new File( filepath + sfilename  );
		if( file.exists()  )
		   file.delete();
		
		// Files table  file_num 번 자료를 삭제		
		eventDao.deleteUploadFile( map );
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map, HttpServletRequest request) {

		// 넘어온 파일 저장
		EventFile.save(map, request);
		
		// db 정보 저장
		eventDao.setUpdate(map);
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {

		// db 제거
		eventDao.setDelete(map);
		
	}


}
