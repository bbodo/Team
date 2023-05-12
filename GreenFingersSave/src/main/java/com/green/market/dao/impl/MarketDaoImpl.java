package com.green.market.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.market.dao.MarketDao;
import com.green.market.service.MarketService;
import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;

@Repository("marketDao")
public class MarketDaoImpl implements MarketDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 마켓 게시글 리스트
	@Override
	public List<MarketVo> getMarketList(
			HashMap<String, Object> map
			) {
		// 전체 자료 수 조회
		int totalcount = sqlSession.selectOne("Market.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		//System.out.println("map:"+ map);
		
		// 메뉴 목록 조회 (페이징)
		List<MarketVo> marketList = sqlSession.selectList("Market.MarketList", map);
		
		return marketList;
	}

	
	@Override
	public MarketVo getBoard(HashMap<String, Object> map) {

		sqlSession.update("Market.UpdateReadCount", map);
		
		MarketVo vo = sqlSession.selectOne("Market.GetBoard", map);
		
		return vo;
	}


	//---------------------------------------------------------------
	// 새글쓰기
	@Override
	public void setWrite(HashMap<String, Object> map) {

		// db 정보 저장
		// Board에 저장
		int  bnum = Integer.parseInt( (String) map.get("bnum") );
		if ( bnum == 0 ) {
			sqlSession.insert("Board.BoardInsert", map); // 새글
		} else {
			sqlSession.update("Board.StepUpdate", map); // 새글			
			sqlSession.insert("Board.BoardReply", map); // 새글			
		}
		
		// Files에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Board.FileInsert", map);
		
	}

	//-----------------------------------------------------------------
	// 파일
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {
		
		List<FileVo>  fileList  =  sqlSession.selectList("Market.FileList", map);
		
		return fileList;
	}

	//---------------------------------------------------------------
	// 게시글 수정할 때 기존 업로드 파일 삭제
	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {
		
		//System.out.println("지우러가는길" + map);
		sqlSession.delete("Market.DeleteUploadFile", map);
	}
	
	// 게시글 수정
	@Override
	public void setUpdate(HashMap<String, Object> map) {

		// Board 정보 수정
		sqlSession.update("Market.BoardUpdate", map);
		
		// File 정보 수정
		List<FileVo>  fileList  =  (List<FileVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Market.FileUpdate", map );
	}

	//---------------------------------------------------------------
	// 게시글 삭제
	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete( "Market.BoardDelNum", map); // delboard를 1로 만듬
		int  childCnt = sqlSession.selectOne("Market.ChildCnt", map); // 자식있는지 확인
		MarketVo vo = sqlSession.selectOne("Market.GetBoard", map);
		
		List<FileVo> fileList = getFileList(map);
		map.put("fileList", fileList);
		if(  childCnt == 0  ) { // 자식이 없는 경우 삭제
			sqlSession.delete("Market.FileDelete", map);
			sqlSession.delete("Market.BoardDelete", map);
		}
		int board_idx = vo.getParent();
		MarketVo vo1 = sqlSession.selectOne("Market.GetBoard", board_idx);
		
		childCnt = sqlSession.selectOne("Market.ChildCnt", vo1);
		if(  childCnt == 0  ) { // 자식이 없는 경우 삭제
			sqlSession.delete("Market.FileDelete", vo1);
			sqlSession.delete("Market.BoardDelete", vo1);
		}
		
	}

	// 포인트 스토어 상품 결제
	@Override
	public void productPay(HashMap<String, Object> map) {

		// 거래 내역 추가
		sqlSession.insert("Market.TransactionInsert", map);
		
		// 포인트 차감
		/* sqlSession.update("Market.PointUpdate", map); */
	}

}
