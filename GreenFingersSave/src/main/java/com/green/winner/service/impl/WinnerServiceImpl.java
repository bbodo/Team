package com.green.winner.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.green.board.vo.FileVo;
import com.green.winner.Vo.WinnerVo;
import com.green.winner.dao.WinnerDao;
import com.green.winner.service.WinnerService;

@Service("winnerService")
public class WinnerServiceImpl implements WinnerService {

	@Autowired
	WinnerDao winnerDao;
	
	
	
	@Override
	public List<WinnerVo> getWinnerList(
			HashMap<String, Object> map
			) {
		// 필요한 자료를 조회( rows)
		List<WinnerVo>  winnerList = winnerDao.getWinnerList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage     =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount   =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount  =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		WinnerPaging   mp      =  new WinnerPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		WinnerVo   winnerVo  = mp.getPdsPagingInfo();
		
		map.put("winnerVo", winnerVo);
		
		
		return     winnerList;

	}

	@Override
	public WinnerVo getBoard(HashMap<String, Object> map) {

		WinnerVo vo = winnerDao.getBoard(map);
		
		return vo;
	}

	@Override
	public void setWrite(HashMap<String, Object> map, HttpServletRequest request) {
		// request 처리
		WinnerFile.save(map, request);
		
		// 넘어온 정보 저장
		winnerDao.setWrite(map);
		
	}
	
	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {

		List<FileVo> fileList = winnerDao.getFileList(map);
		
		return fileList;
	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		// d:\\upload\\ sfilename 에 해당되는 파일을 삭제
		
		String      filepath   =  "D:\\upload\\";   
		String      sfilename  =  (String) map.get("sfile");
		
		File  file  = new File( filepath + sfilename  );
		if( file.exists()  )
		   file.delete();
		
		// Files table  file_num 번 자료를 삭제		
		winnerDao.deleteUploadFile( map );
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map, HttpServletRequest request) {

		// 넘어온 파일 저장
		WinnerFile.save(map, request);
		
		// db 정보 저장
		winnerDao.setUpdate(map);
	}

	@Override
	public void setDelete(HashMap<String, Object> map) {

		// db 제거
		winnerDao.setDelete(map);
		
	}


}
