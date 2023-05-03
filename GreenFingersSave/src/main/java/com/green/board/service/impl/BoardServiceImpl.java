package com.green.board.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.dao.BoardDao;
import com.green.board.service.BoardService;
import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public List<BoardVo> getBoardList(HashMap<String, Object> map) {

		// 필요한 자료를 조회( 10개 rows 만)
		List<BoardVo>  boardList = boardDao.getBoardList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		BoardPaging   bp    =  new BoardPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		BoardVo   boardVo  = bp.getPdsPagingInfo();
		
		map.put("boardVo", boardVo);
		
		
		return     boardList;
	}

	@Override
	public BoardVo getBoard(HashMap<String, Object> map) {

		BoardVo vo = boardDao.getBoard(map);
		
		return vo;
	}

	@Override
	public void setWrite(
			HashMap<String, Object> map, 
			HttpServletRequest request) {

		// request 처리
		BoardFile.save(map, request);
		
		// 넘어온 정보 저장
		boardDao.setWrite(map);
		
	}

	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo> fileList = boardDao.getFileList(map);
		
		return fileList;
	}

}
