package com.green.market.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.market.dao.MarketDao;
import com.green.market.service.MarketService;
import com.green.market.vo.MarketVo;

@Repository("marketDao")
public class MarketDaoImpl implements MarketDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MarketVo> getAdoptList(
			HashMap<String, Object> map
			) {
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Market.GetTotalCount", map);
		map.put("totalcount", totalcount);
		
		System.out.println(map);
		
		// 메뉴 목록 조회 (페이징)
		List<MarketVo> adoptList = sqlSession.selectList("Market.AdoptList", map);
		
		
		return adoptList;
	}

}
