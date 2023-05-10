package com.green.winner.dao.impl;

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
import com.green.winner.Vo.WinnerVo;
import com.green.winner.dao.WinnerDao;

@Repository("winnerDao")
public class WinnerDaoImpl implements WinnerDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 입양 리스트
	@Override
	public List<WinnerVo> getWinnerList(
			HashMap<String, Object> map
			) {
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Event.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		System.out.println(map);
		
		// 메뉴 목록 조회 (페이징)
		List<WinnerVo> winnerList = sqlSession.selectList("Winner.WinnerList", map);
		
		return winnerList;
	}

	
	@Override
	public WinnerVo getBoard(HashMap<String, Object> map) {

		sqlSession.update("Winner.UpdateReadCount", map);
		
		WinnerVo vo = sqlSession.selectOne("Winner.GetBoard", map);
		
		return vo;
	}


	@Override
	public void setWrite(HashMap<String, Object> map) {
		// db 정보 저장
		// Board  에 저장
		int  bnum = Integer.parseInt( (String) map.get("bnum") );
		if ( bnum == 0 ) {
			sqlSession.insert("Winner.WinnerInsert", map); // 새글
		} else {
			sqlSession.update("Winner.StepUpdate", map); // 새글			
			sqlSession.insert("Winner.WinnerReply", map); // 새글			
		}
		
		// Files  에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Winner.FileInsert", map);
		
		
	}
	
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo>  fileList  =  sqlSession.selectList("Winner.FileList", map);
		
		return fileList;
	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		sqlSession.delete("Winner.DeleteUploadFile", map);
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {

		// Board 정보 수정
		sqlSession.update("Winner.WinnerUpdate", map);
		
		// File 정보 수정
		List<FileVo>  fileList  =  (List<FileVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Winner.FileUpdate", map );
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete( "Winner.BoardDelNum", map); // delboard를 1로 만듬
		int  childCnt = sqlSession.selectOne("Winner.ChildCnt", map); // 자식있는지 확인
		WinnerVo vo = sqlSession.selectOne("Winner.GetBoard", map);
		
		List<FileVo> fileList = getFileList(map);
		map.put("fileList", fileList);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			sqlSession.delete("Winner.FileDelete", map);
			sqlSession.delete("Winner.WinnerDelete", map);
		}
		
		
		
		/*
		int board_idx = vo.getParent();
		BoardVo vo1 = sqlSession.selectOne("Winner.GetBoard", board_idx);
		
		childCnt = sqlSession.selectOne("Winner.ChildCnt", vo1);
		if(  childCnt == 0  ) { // 자식이 없는경우 삭제
			sqlSession.delete("Winner.FileDelete", vo1);
			sqlSession.delete("Winner.WinnerDelete", vo1);
		}
		*/
	}


	

}
