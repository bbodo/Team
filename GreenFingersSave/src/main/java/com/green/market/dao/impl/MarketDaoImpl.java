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
	
	// 입양 리스트
	@Override
	public List<MarketVo> getMarketList(
			HashMap<String, Object> map
			) {
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Market.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		System.out.println(map);
		
		// 메뉴 목록 조회 (페이징)
		List<MarketVo> marketList = sqlSession.selectList("Market.MarketList", map);
		
		return marketList;
	}

	
	@Override
	public MarketVo getBoard(HashMap<String, Object> map) {

		sqlSession.update("Market.UpdaateReadCount", map);
		
		MarketVo vo = sqlSession.selectOne("Market.GetBoard", map);
		
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

}
