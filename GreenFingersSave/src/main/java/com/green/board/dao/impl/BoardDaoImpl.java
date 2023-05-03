package com.green.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.dao.BoardDao;
import com.green.board.vo.BoardVo;
import com.green.board.vo.FileVo;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVo> getBoardList(HashMap<String, Object> map) {
			
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Board.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		System.out.println(map);
		
		// 메뉴 목록 조회 (페이징)
		List<BoardVo> boardList = sqlSession.selectList("Board.BoardList", map);
		
		return boardList;
	}

	@Override
	public BoardVo getBoard(HashMap<String, Object> map) {
		
		sqlSession.update("Board.UpdateReadCount", map);
		
		BoardVo vo = sqlSession.selectOne("Board.GetBoard", map);
		
		return vo;
	}

	@Override
	public void setWrite(HashMap<String, Object> map) {

		// db 정보 저장
		// Board  에 저장
		int  bnum = Integer.parseInt( (String) map.get("bnum") );
		if ( bnum == 0 ) {
			sqlSession.insert("Board.BoardInsert", map); // 새글
		} else {
			sqlSession.update("Board.StepUpdate", map); // 새글			
			sqlSession.insert("Board.BoardReply", map); // 새글			
		}
		
		// Files  에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Board.FileInsert", map);
		
	}

	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo>  fileList  =  sqlSession.selectList("Board.FileList", map);
		
		return fileList;
	}

}
