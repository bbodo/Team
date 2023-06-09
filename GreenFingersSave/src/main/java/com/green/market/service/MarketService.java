package com.green.market.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;



public interface MarketService {

	List<MarketVo> getMarketList(HashMap<String, Object> map);

	MarketVo getBoard(HashMap<String, Object> map);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	List<FileVo> getFileList(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void setDelete(HashMap<String, Object> map);

	void productPay(HashMap<String, Object> map);

	
}
