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
	
	// 게시판 게시글 정보 가져가기
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

	// 게시글 정보 가져가기
	@Override
	public BoardVo getBoard(HashMap<String, Object> map) {
		
		sqlSession.update("Board.UpdateReadCount", map);
		
		BoardVo vo = sqlSession.selectOne("Board.GetBoard", map);
		
		return vo;
	}

	// 게시글 작성
	@Override
	public void setWrite(HashMap<String, Object> map) {

		// db 정보 저장
		// Board  에 저장
		int  bnum = Integer.parseInt( (String) map.get("bnum") );
		if ( bnum == 0 ) {
			sqlSession.insert("Board.BoardInsert", map); // 새글
			sqlSession.update("Board.GetPoint", map); // 포인트 증가
		} else {
			sqlSession.update("Board.StepUpdate", map); // 새글			
			sqlSession.insert("Board.BoardReply", map); // 새글			
			sqlSession.update("Board.GetPoint", map); // 포인트 증가
		}
		
		// Files  에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Board.FileInsert", map);
		
	}

	// 파일리스트 정보 가져가기
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo>  fileList  =  sqlSession.selectList("Board.FileList", map);
		
		return fileList;
	}

	// 수정중 파일 삭제하기
	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		sqlSession.delete("Board.DeleteUploadFile", map);
		
	}

	// 게시글 수정하기
	@Override
	public void setUpdate(HashMap<String, Object> map) {

		// Board 정보 수정
		sqlSession.update("Board.BoardUpdate", map);
		
		// File 정보 수정
		List<FileVo>  fileList  =  (List<FileVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Board.FileUpdate", map );
	}

	// 삭제하기
	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete( "Board.BoardDelNum", map); // delboard를 1로 만듬
		int  childCnt = sqlSession.selectOne("Board.ChildCnt", map); // 자식있는지 확인
		BoardVo vo = sqlSession.selectOne("Board.GetBoard", map);
		
		List<FileVo> fileList = getFileList(map);
		map.put("fileList", fileList);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			sqlSession.delete("Board.FileDelete", map);
			sqlSession.delete("Board.BoardDelete", map);
		}

		int board_idx = vo.getParent();
		
		if(board_idx != 0) {
			BoardVo vo1 = sqlSession.selectOne("Board.GetBoard", board_idx);
			
			int delnum = sqlSession.selectOne("Board.CheckDel", vo1);
			if( delnum == 1) {
			
			childCnt = sqlSession.selectOne("Board.ChildCnt", vo1);
			if(  childCnt == 0  ) { // 자식이 없는경우 삭제
					sqlSession.delete("Board.FileDelete", vo1);
					sqlSession.delete("Board.BoardDelete", vo1);
				}
			}
		}
		
	}

}
