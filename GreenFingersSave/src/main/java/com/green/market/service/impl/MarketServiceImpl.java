package com.green.market.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.market.dao.MarketDao;
import com.green.market.service.MarketService;
import com.green.market.vo.FileVo;
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

	//-------------------------------------------------------------
	// 새글쓰기
	@Override
	public void setWrite(
			HashMap<String, Object> map, 
			HttpServletRequest request) {
		
		// request 처리
		MarketFile.save(map, request);
		
		// 넘어온 정보 저장
		marketDao.setWrite(map);
		
	}

	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {
		
		List<FileVo> fileList = marketDao.getFileList(map);
		
		return fileList;
	}

	//-------------------------------------------------------------
	// 게시글 수정할 때 기존 파일 삭제
	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {
		
		// d:\\upload\\ sfilename 에 해당되는 파일을 삭제
		
		String      filepath   =  "D:\\upload\\";   
		String      sfilename  =  (String) map.get("sfile");
		
		File  file  = new File( filepath + sfilename  );
		if( file.exists()  )
		   file.delete();
		
		// Files table  file_num 번 자료를 삭제		
		marketDao.deleteUploadFile( map );
		
	}
	
	// 게시글 수정
	@Override
	public void setUpdate(
			HashMap<String, Object> map, 
			HttpServletRequest request) {
		
		// 넘어온 파일 저장
		MarketFile.save(map, request);
				
		// db 정보 저장
		marketDao.setUpdate(map);
		
	}

	//-------------------------------------------------------------
	// 게시글 삭제
	@Override
	public void setDelete(HashMap<String, Object> map) {
		
		// db 제거
		marketDao.setDelete(map);
		
		// 파일 삭제 map 에 삭제할 파일정보가 와야함
		List<FileVo> fileList = (List<FileVo>) map.get("fileList");
		MarketFile.deleteM( fileList );
	}

	// 스토어 결제
	@Override
	public void productPay(HashMap<String, Object> map) {
		
		marketDao.productPay(map);
		
	}

}
