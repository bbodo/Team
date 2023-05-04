package com.green.market.dao;

import java.util.HashMap;
import java.util.List;

import com.green.market.vo.MarketVo;

public interface MarketDao {

	List<MarketVo> getAdoptList(HashMap<String, Object> map);

	MarketVo getBoard(HashMap<String, Object> map);

}
