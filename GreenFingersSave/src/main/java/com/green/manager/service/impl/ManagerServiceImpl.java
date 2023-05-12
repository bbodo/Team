package com.green.manager.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.service.impl.BoardFile;
import com.green.event.Vo.EventVo;
import com.green.event.service.impl.EventPaging;
import com.green.manager.dao.ManagerDao;
import com.green.manager.service.ManagerService;
import com.green.manager.vo.ManagerVo;
import com.green.manager.vo.StoreVo;
import com.green.market.service.impl.MarketFile;
import com.green.market.service.impl.MarketPaging;
import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;
import com.green.user.vo.UserVo;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public List<UserVo> getAllUser() {

		List<UserVo> userList = managerDao.getAlluser();
		
		return userList;
	}

	@Override
	public UserVo getUser(HashMap<String, Object> map) {

		UserVo vo = managerDao.getUser(map);
		
		return vo;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {

		
		managerDao.updateUser(map);
		
	}

	@Override
	public int deleteUser(HashMap<String, Object> map) {

		int cnf = managerDao.deleteUser(map);
		
		return cnf;
	}

	@Override
	public void addMenu(HashMap<String, Object> map) {

		managerDao.addMenu(map);
		
	}

	@Override
	public void addSimpleMenu(HashMap<String, Object> map) {

		managerDao.addSimpleMenu(map);
		
	}

	@Override
	public void updateMenu(HashMap<String, Object> map) {

		managerDao.updateMenu(map);
	
	}

	@Override
	public int deleteMenu(HashMap<String, Object> map) {

		int cnf = managerDao.deleteMenu(map);
		
		return cnf;
	}

	@Override
	public void addSubMenu(HashMap<String, Object> map) {

		managerDao.addSubMenu(map);
		
	}

	@Override
	public int deleteSubmenu(HashMap<String, Object> map) {

		int cnf = managerDao.deleteSubmenu(map);
		
		return cnf;
	}

	@Override
	public void updateSubmenu(HashMap<String, Object> map) {

		managerDao.updateSubmenu(map);
		
		
	}

	//-----------------------------------------------------------
	// 스토어 관리 
	@Override
	public List<StoreVo> getStoreList() {
		
		List<StoreVo> storeList = managerDao.getStoreList();
		
		return storeList;
	}

	// 스토어 상품 등록
	@Override
	public void addStore(
			HashMap<String, Object> map,
			HttpServletRequest request) {
		
		// request 처리
		MarketFile.save(map, request);
		
		// 넘어온 정보 저장
		managerDao.addStore(map);
	}

	// 원글 가져오기
	@Override
	public StoreVo getBoard(HashMap<String, Object> map) {

		StoreVo vo = managerDao.getBoard(map);
		
		return vo;
	}

	@Override
	public List<FileVo> getFileList(HashMap<String, Object> map) {
		
		List<FileVo> fileList = managerDao.getFileList(map);
		
		return fileList;
	}

	// 스토어 상품 수정
	@Override
	public void setUpdate(
			HashMap<String, Object> map, 
			HttpServletRequest request) {
		
		// 넘어온 파일 저장
		MarketFile.save(map, request);
						
		// db 정보 저장
		managerDao.setUpdate(map);

	}

	// 스토어 상품 삭제
	@Override
	public void deleteStore(HashMap<String, Object> map) {
		
		// db 제거
		managerDao.deleteStore(map);
		
		// 파일 삭제 map 에 삭제할 파일정보가 와야함
		List<FileVo> fileList = (List<FileVo>) map.get("fileList");
		MarketFile.deleteStore( fileList );
		
	}
	
	
	

	@Override
	public List<EventVo> getEventList(
			HashMap<String, Object> map
			) {
		// 필요한 자료를 조회( rows)
	
		
		List<EventVo>  eventList = managerDao.getEventList(map);
	/*	
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage     =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount   =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount  =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		
		
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		EventPaging   mp      =  new EventPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		EventVo   eventVo  = mp.getPdsPagingInfo();
		*/
		// map.put("eventVo", eventVo);
		
		
		return     eventList;

	}
	
	@Override
	public EventVo getEventBoard(HashMap<String, Object> map) {

		EventVo vo = managerDao.getEventBoard(map);
		
		return vo;
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
		managerDao.deleteUploadFile( map );
		
	}


}
