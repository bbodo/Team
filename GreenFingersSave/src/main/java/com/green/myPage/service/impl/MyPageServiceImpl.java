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

	@Override
	public List<MyPageVo> getRecSendNote(int usercode) {
		List<MyPageVo> myPageVo = myPageDao.getMyPageList(usercode);
		return myPageVo;
	}




}
