package com.green.myNote.dao;

import java.util.HashMap;
import java.util.List;

import com.green.myNote.vo.MyNoteVo;

public interface MyNoteDao {
	
	/* List<MyNoteVo> getMyNoteForm(HashMap<String, Object> map); */
	MyNoteVo getMyNoteForm(HashMap<String, Object> map);

	int insertMyNote(HashMap<String, Object> map);



}
