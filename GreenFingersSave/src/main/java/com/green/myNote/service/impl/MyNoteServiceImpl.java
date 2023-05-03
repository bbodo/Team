package com.green.myNote.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.myNote.dao.MyNoteDao;
import com.green.myNote.service.MyNoteService;
import com.green.myNote.vo.MyNoteVo;

@Service("myNoteService")
public class MyNoteServiceImpl implements MyNoteService {
	
	@Autowired
	private MyNoteDao mynoteDao;
	
	@Override
	public MyNoteVo getmyNoteForm(HashMap<String, Object> map) {
		MyNoteVo MyNoteForm = mynoteDao.getMyNoteForm(map); 
		return MyNoteForm;
	}
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = mynoteDao.insertMyNote(map);
		
		return myNoteInsertCheck;
	}


}
