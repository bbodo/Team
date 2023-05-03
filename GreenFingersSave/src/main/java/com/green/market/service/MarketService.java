package com.green.market.service;

import java.util.HashMap;
import java.util.List;

import com.green.market.vo.MarketVo;



public interface MarketService {

	List<MarketVo> getAdoptList(HashMap<String, Object> map);


}
