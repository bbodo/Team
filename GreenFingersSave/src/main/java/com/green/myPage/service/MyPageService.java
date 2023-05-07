package com.green.myPage.service;

import java.util.HashMap;
import java.util.List;

import com.green.myPage.vo.MyPageVo;

public interface MyPageService {

	/* List<MyNoteVo> getmyNoteForm(HashMap<String, Object> map); */
	MyPageVo getmyNoteForm(HashMap<String, Object> map);
	
	int insertMyNote(HashMap<String, Object> map);

	/* List<MyPageVo> getRecSendNote(int usercode); */

	List<MyPageVo> getSendPageList(HashMap<String, Object> map);

	List<MyPageVo> getRecPageList(HashMap<String, Object> map);

	
}
