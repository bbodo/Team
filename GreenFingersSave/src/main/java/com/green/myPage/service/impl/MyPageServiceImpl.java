package com.green.myPage.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.service.impl.BoardPaging;
import com.green.board.vo.BoardVo;
import com.green.myPage.dao.MyPageDao;
import com.green.myPage.service.MyPageService;
import com.green.myPage.vo.MyPageVo;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;
	
	@Override
	public MyPageVo getmyNoteForm(HashMap<String, Object> map) {
		MyPageVo MyNoteForm = myPageDao.getMyNoteForm(map); 
		return MyNoteForm;
	}
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = myPageDao.insertMyNote(map);
		
		return myNoteInsertCheck;
	}
	
	@Override
	public List<MyPageVo> getSendPageList(HashMap<String, Object> map) {
		
		List<MyPageVo> myPagePagingList = myPageDao.getSendPageList(map);
		
		int  pagetotalcount =  10;  
		
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );  //전체 자료수
		
		MyPagePaging	MyPagePaging = new MyPagePaging( nowpage, pagecount, totalcount, pagetotalcount);
		
		MyPageVo   sendNotePaging  = MyPagePaging.getMyPagePagingInfo();
		
		map.put("sendNotePaging", sendNotePaging);
		
		return myPagePagingList;
	}

	@Override
	public List<MyPageVo> getRecPageList(HashMap<String, Object> map) {
		List<MyPageVo> myPagePagingList = myPageDao.getRecPageList(map);
		
		int  pagetotalcount =  10;  
		
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );  //전체 자료수
		
		MyPagePaging	MyPagePaging = new MyPagePaging( nowpage, pagecount, totalcount, pagetotalcount);
		
		MyPageVo   recNotePaging  = MyPagePaging.getMyPagePagingInfo();
		
		map.put("recNotePaging", recNotePaging);
		
		return myPagePagingList;
	}

	@Override
	public List<MyPageVo> getSendPointList(HashMap<String, Object> map) {
		List<MyPageVo> SendPointList = myPageDao.getSendPointList(map);
		
		int  pagetotalcount =  10;  
		
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );  //전체 자료수
		
		MyPagePaging	MyPagePaging = new MyPagePaging( nowpage, pagecount, totalcount, pagetotalcount);
		
		MyPageVo   SendPointPaging  = MyPagePaging.getMyPagePagingInfo();
		
		map.put("SendPointPaging", SendPointPaging);
		
		return SendPointList;
	}

	@Override
	public void updatePoint(HashMap<String, Object> map) {
		myPageDao.updatePoint(map);
	}

	@Override
	public MyPageVo myNoteView(HashMap<String, Object> map) {
		MyPageVo myNoteView = myPageDao.myNoteView(map);
		return myNoteView;
	}

	@Override
	public int noteDelete(HashMap<String, Object> map) {
		int noteDelete = myPageDao.noteDelete(map);
		return noteDelete;
	}

	@Override
	public MyPageVo getMyNoteAnswerForm(HashMap<String, Object> map) {
		MyPageVo getMyNoteAnswerForm = myPageDao.getMyNoteAnswerForm(map);
		return getMyNoteAnswerForm;
	}

	@Override
	public int myNoteAnswer(HashMap<String, Object> map) {
		int myNoteAnswer = myPageDao.myNoteAnswer(map);
		return myNoteAnswer;
	}

	@Override
	public void readmarkCheck(HashMap<String, Object> map) {
		myPageDao.readmarkCheck(map);
	}

	@Override
	public int checkPw(HashMap<String, Object> map) {

		int a1 = myPageDao.checkPw(map);
		
		return a1;
	}

	// 개인정보수정
	@Override
	public void updateUser(HashMap<String, Object> map) {

		myPageDao.updateUser(map);
		
	}

	@Override
	public void updateProfile(HashMap<String, Object> map, HttpServletRequest request) {
		MypageFile.save(map, request);
		myPageDao.setSave(map);
	}

	@Override
	public List<BoardVo> getMyBoardList(HashMap<String, Object> map) {
		// 필요한 자료를 조회( 10개 rows 만)
		List<BoardVo>  boardList = myPageDao.getMyBoardList(map);
		
		int  pagetotalcount =  10;  // paging.jsp 페이지 번호 출력 갯수
				
		int        nowpage        =  Integer.parseInt( String.valueOf( map.get("nowpage") ) );    // 현재 페이지
		int        pagecount      =  Integer.parseInt( String.valueOf( map.get("pagecount")) );  // 한페이지에 보여줄 자료수
		
		// menu_id 에 해당되는 전체 자료수 - pdsDaoImpl 가 돌려준 map 에 저장
		int        totalcount     =  Integer.parseInt( String.valueOf( map.get("totalcount") ) );   
	
		String     submenu_id  =  String.valueOf(map.get("submenu_id")); 
		BoardPaging   bp    =  new BoardPaging(
			submenu_id, nowpage, pagecount, totalcount, pagetotalcount);

		BoardVo   boardVo  = bp.getPdsPagingInfo();
		
		map.put("boardVo", boardVo);
		return boardList;
	}

	@Override
	public void getMyBoardCount(HashMap<String, Object> map) {
		 myPageDao.getMyBoardCount(map);
	}

	@Override
	public List<MyPageVo> getresSendUsercode(HashMap<String, Object> map) {
		// 필요한 자료를 조회( 10개 rows 만)
		List<MyPageVo>  getresSendUsercode = myPageDao.getresSendUsercode( map);
		return getresSendUsercode;
	}




}
