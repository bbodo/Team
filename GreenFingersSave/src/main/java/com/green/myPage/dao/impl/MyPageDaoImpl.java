package com.green.myPage.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.vo.BoardVo;
import com.green.myPage.dao.MyPageDao;
import com.green.myPage.vo.FilesVo;
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

	@Override
	public void updatePoint(HashMap<String, Object> map) {
		sqlSession.update("MyPage.UpdatePoint",map);
		sqlSession.update("MyPage.myUpdatePoint",map);
	}

	@Override
	public MyPageVo myNoteView(HashMap<String, Object> map) {
		MyPageVo myNoteView = sqlSession.selectOne("MyPage.GetNoteView", map);
		map.put("receiver_usercode", myNoteView.getReceiver_usercode());
		return myNoteView;
	}

	@Override
	public int noteDelete(HashMap<String, Object> map) {
		int noteDelete = sqlSession.update("MyPage.NoteDelete", map);
		return noteDelete;
	}

	@Override
	public MyPageVo getMyNoteAnswerForm(HashMap<String, Object> map) {
		MyPageVo getMyNoteAnswerForm = sqlSession.selectOne("MyPage.GetNoteView", map); 
		return getMyNoteAnswerForm;
	}

	@Override
	public int myNoteAnswer(HashMap<String, Object> map) {
		int myNoteAnswer = sqlSession.insert("MyPage.MyPageNoteInsert", map);
		return myNoteAnswer;
	}

	@Override
	public void readmarkCheck(HashMap<String, Object> map) {
		sqlSession.update("MyPage.ReadmarkCheck", map);
	}

	@Override
	public int checkPw(HashMap<String, Object> map) {

		System.out.println(map);
		
		int a1 = sqlSession.selectOne("MyPage.CheckPw", map);
		
		System.out.println(a1);
		
		return a1;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {

		sqlSession.update("MyPage.UpdateUser", map);
		
	}

	@Override
	public void setSave(HashMap<String, Object> map) {
		List<FilesVo> fileList = (List<FilesVo>) map.get("fileList");
		if(fileList.size() !=0 )
			sqlSession.insert("MyPage.UpdateProfile", map);
	}

	@Override
	public List<BoardVo> getMyBoardList(HashMap<String, Object> map) {
		// 전체 자료수 조회
		int totalcount = sqlSession.selectOne("MyPage.GetTotalMyBoardCount", map);
		map.put("totalcount", totalcount);
		
		// 메뉴 목록 조회 (페이징)
		List<BoardVo> boardList = sqlSession.selectList("MyPage.MyBoardList", map);
		
		return boardList;
	}

	@Override
	public void getMyBoardCount(HashMap<String, Object> map) {
		int myBoardCount = sqlSession.selectOne("MyPage.GetMyBoardCount", map);
		map.put("myBoardCount", myBoardCount);
	}

	@Override
	public List<MyPageVo> getresSendUsercode(HashMap<String, Object> map) {
		//1차 작업 : send_usercode 기준으로 for문 사용해서, receiveusercode를 받는다
		List<MyPageVo> toMySendUser  =  sqlSession.selectList("MyPage.GetToMySendUser", map);
		map.put("toMySendUser", toMySendUser);
		System.out.println(toMySendUser + "toMySendUser");
		
		/*
		 * MyPageVo mypageVo = new MyPageVo(); mypageVo.getSend_usercode();
		 */
		
		//2차 작업 : send_usercode 기준으로 for문 사용해서, receiveusercode를 받는다
		//List<MyPageVo> getresSendUsercode  =  sqlSession.selectList("MyPage.GetResSendUsercode", toMySendUser);
		//System.out.println(getresSendUsercode + "getresSendUsercode");
		
		//3차 작업 : 받은 쪽지 사람 nickname
		//List<MyPageVo> lastResSendNickname  =  sqlSession.selectList("MyPage.LastResSendNickname", getresSendUsercode);
		//System.out.println(lastResSendNickname + "lastResSendNickname");
		
		return toMySendUser;
	}

	

}
