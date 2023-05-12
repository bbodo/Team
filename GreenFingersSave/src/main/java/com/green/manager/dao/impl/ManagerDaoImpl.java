package com.green.manager.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;
import com.green.manager.dao.ManagerDao;
import com.green.manager.vo.StoreVo;
import com.green.market.vo.FileVo;
import com.green.market.vo.MarketVo;
import com.green.user.vo.UserVo;

@Repository("managerDao")
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserVo> getAlluser() {

		List<UserVo> userList = sqlSession.selectList("Manager.GetAllUser");
		
		return userList;
	}

	@Override
	public UserVo getUser(HashMap<String, Object> map) {

		UserVo vo = sqlSession.selectOne("Manager.GetUser", map);
		
		return vo;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateUser", map);
		
	}

	@Override
	public int deleteUser(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteUser", map);
		
		return cnf;
	}

	@Override
	public void addMenu(HashMap<String, Object> map) {
		
		sqlSession.insert("Manager.AddMenu", map);
		
	}

	@Override
	public void addSimpleMenu(HashMap<String, Object> map) {

		sqlSession.insert("Manager.AddMenu2", map);
		
	}

	@Override
	public void updateMenu(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateMenu", map);
		
	}

	@Override
	public int deleteMenu(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteMenu", map);
		
		return cnf;
	}

	@Override
	public void addSubMenu(HashMap<String, Object> map) {

		sqlSession.insert("Manager.AddSubMenu", map);
		
	}

	@Override
	public int deleteSubmenu(HashMap<String, Object> map) {

		int cnf = sqlSession.delete("Manager.DeleteSubmenu", map);
		
		return cnf;
	}

	@Override
	public void updateSubmenu(HashMap<String, Object> map) {

		sqlSession.update("Manager.UpdateSubmenu", map);
		
	}

	//-------------------------------------------------------------------
	// 스토어 등록 상품 리스트
	@Override
	public List<StoreVo> getStoreList() {
		
		List<StoreVo> storeList = sqlSession.selectList("Manager.StoreList");
		
		return storeList;
	}

	// 스토어 등록
	@Override
	public void addStore(HashMap<String, Object> map) {
		
		// db 정보 저장
		// Board에 저장
		/*
		 * int bnum = Integer.parseInt( (String) map.get("bnum") ); if ( bnum == 0 )
		 */
			sqlSession.insert("Manager.AddStore", map);
		
		// Files에 저장
		List<FileVo>  fileList =  (List<FileVo>) map.get("fileList");
		if( fileList.size() != 0  )
			sqlSession.insert("Manager.FileInsert", map);
	}

	//-----------------------------------------------------------------

	@Override
	public StoreVo getBoard(HashMap<String, Object> map) {
		
		StoreVo vo = sqlSession.selectOne("Manager.GetBoard", map);
		
		return vo;
	}

	// 스토어 파일
	@Override public List<FileVo> getFileList(HashMap<String, Object> map) {
	  
	List<FileVo> fileList = sqlSession.selectList("Manager.FileList", map);
	  
	return fileList; 
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {
		
		// Board 정보 수정
		sqlSession.update("Manager.BoardUpdate", map);
		
		// File 정보 수정
		List<FileVo>  fileList  =  (List<FileVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Manager.FileUpdate", map );
		
	}

	// 스토어 상품 삭제
	@Override
	public void deleteStore(HashMap<String, Object> map) {
		
		StoreVo vo = sqlSession.selectOne("Manager.GetBoard", map);
		
		List<FileVo> fileList = getFileList(map);
		map.put("fileList", fileList);
		
		sqlSession.delete("Board.FileDelete", map);
		sqlSession.delete("Board.BoardDelete", map);
	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {
		
		sqlSession.delete("Manager.DeleteUploadFile", map);
	}

    // 이벤트--------------------------------------------------------------이벤트
	
	@Override
	public List<EventVo> getEventList(
			HashMap<String, Object> map
			) {
	/*
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("Manager.GetTotalCount", map);
		map.put("totalcount", totalcount);
		*/
		
		
		// 메뉴 목록 조회 (페이징)
		List<EventVo> eventList = sqlSession.selectList("Manager.EventList", map);
		
		
		return eventList;
	}
	
	@Override
	public EventVo getEventBoard(HashMap<String, Object> map) {

	
		EventVo vo = sqlSession.selectOne("Manager.GetBoard", map);
		
		return vo;
	}


}
