package com.green.myNote.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.myNote.dao.MyNoteDao;
import com.green.myNote.service.MyNoteService;

@Service("myNoteService")
public class MyNoteServiceImpl implements MyNoteService {
	
	@Autowired
	private MyNoteDao mynoteDao;
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = mynoteDao.insertMyNote(map);
		
		return myNoteInsertCheck;
	}

}
