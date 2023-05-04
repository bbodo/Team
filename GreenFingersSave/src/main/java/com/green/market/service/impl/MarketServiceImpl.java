package com.green.market.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.market.dao.MarketDao;
import com.green.market.service.MarketService;
import com.green.market.vo.MarketVo;

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	MarketDao marketDao;
	
	@Override
	public List<MarketVo> getMarketList(
			HashMap<String, Object> map
			) {
		// 필요한 자료를 조회( rows)
		List<MarketVo>  marketList = marketDao.getMarketList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage     =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount   =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount  =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		MarketPaging   mp      =  new MarketPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		MarketVo   marketVo  = mp.getPdsPagingInfo();
		
		map.put("marketVo", marketVo);
		
		
		return     marketList;

	}

	@Override
	public MarketVo getBoard(HashMap<String, Object> map) {

		MarketVo vo = marketDao.getBoard(map);
		
		return vo;
	}

	@Override
	public void setWrite(
			HashMap<String, Object> map, 
			HttpServletRequest request) {
		
		// request 처리
		MarketFile.save(map, request);
		
		// 넘어온 정보 저장
		marketDao.setWrite(map);
		
	}

}
