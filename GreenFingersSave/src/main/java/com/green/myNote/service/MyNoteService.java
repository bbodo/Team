package com.green.myNote.service;

import java.util.HashMap;
import java.util.List;

import com.green.myNote.vo.MyNoteVo;

public interface MyNoteService {

	/* List<MyNoteVo> getmyNoteForm(HashMap<String, Object> map); */
	MyNoteVo getmyNoteForm(HashMap<String, Object> map);
	
	int insertMyNote(HashMap<String, Object> map);


	
}
