package com.green.myPage.dao;

import java.util.HashMap;
import java.util.List;

import com.green.myPage.vo.MyPageVo;

public interface MyPageDao {
	
	/* List<MyNoteVo> getMyNoteForm(HashMap<String, Object> map); */
	MyPageVo getMyNoteForm(HashMap<String, Object> map);

	int insertMyNote(HashMap<String, Object> map);

	List<MyPageVo> getSendPageList(HashMap<String, Object> map);

	List<MyPageVo> getRecPageList(HashMap<String, Object> map);

	List<MyPageVo> getSendPointList(HashMap<String, Object> map);

	void updatePoint(HashMap<String, Object> map);

	MyPageVo myNoteView(HashMap<String, Object> map);

	int noteDelete(HashMap<String, Object> map);

	MyPageVo getMyNoteAnswerForm(HashMap<String, Object> map);

}
