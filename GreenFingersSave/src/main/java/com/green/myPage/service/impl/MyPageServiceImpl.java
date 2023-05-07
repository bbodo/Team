package com.green.myPage.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	/*
	 * @Override public List<MyPageVo> getRecSendNote(int usercode) {
	 * List<MyPageVo>myPageVo = myPageDao.getMyPageList(usercode); return myPageVo;
	 * }
	 */

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




}
