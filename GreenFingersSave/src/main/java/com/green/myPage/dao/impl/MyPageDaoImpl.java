package com.green.myPage.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.myPage.dao.MyPageDao;
import com.green.myPage.vo.MyPageVo;

@Repository("MyPageDao")
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public MyPageVo getMyNoteForm(HashMap<String, Object> map) {
		MyPageVo myNoteForm = sqlSession.selectOne("MyPage.MyPageNoteSelect", map);
		return myNoteForm;
	}
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = sqlSession.insert("MyPage.MyPageNoteInsert",map);
		/* System.out.println("쪽지Dao확인:" + map.toString()); */
		return myNoteInsertCheck;
	}

	@Override
	public List<MyPageVo> getSendPageList(HashMap<String, Object> map) {
		map.put("sendData",  "sendData");
		// 전체 자료수 조회
		int      totalcount              =  sqlSession.selectOne("MyPage.GetTotalCount", map);
		map.put("totalcount",  totalcount);
		
		// 보낸 쪽지 조회 (paging)
		List<MyPageVo> pdsPagingList  =  sqlSession.selectList("MyPage.GetMyPageList", map);  
		map.remove("sendData");
		
		return   pdsPagingList;
	}

	@Override
	public List<MyPageVo> getRecPageList(HashMap<String, Object> map) {
		map.put("recData",  "recData");
		// 전체 자료수 조회
		int      totalcount              =  sqlSession.selectOne("MyPage.GetTotalCount", map);
		map.put("totalcount",  totalcount);
		
		// 받은 쪽지 조회 (paging)
		List<MyPageVo> pdsPagingList  =  sqlSession.selectList("MyPage.GetMyPageList", map);  
		map.remove("recData");
		
		return   pdsPagingList;
	}

	@Override
	public List<MyPageVo> getSendPointList(HashMap<String, Object> map) {
		// 전체 자료수 조회
		int      totalcount              =  sqlSession.selectOne("MyPage.GetTotalSendPointCount", map);
		map.put("totalcount",  totalcount);
		
		// 내공 줄 리스트 (paging)
		List<MyPageVo> SendPointList  =  sqlSession.selectList("MyPage.GetSendPointList", map);  
		
		return SendPointList;
	}
	
	

}