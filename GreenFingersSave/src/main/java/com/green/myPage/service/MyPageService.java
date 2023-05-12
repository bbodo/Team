package com.green.myPage.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.myPage.vo.MyPageVo;

public interface MyPageService {

	/* List<MyNoteVo> getmyNoteForm(HashMap<String, Object> map); */
	MyPageVo getmyNoteForm(HashMap<String, Object> map);
	
	int insertMyNote(HashMap<String, Object> map);

	List<MyPageVo> getSendPageList(HashMap<String, Object> map);

	List<MyPageVo> getRecPageList(HashMap<String, Object> map);

	List<MyPageVo> getSendPointList(HashMap<String, Object> map);

	void updatePoint(HashMap<String, Object> map);

	MyPageVo myNoteView(HashMap<String, Object> map);

	int noteDelete(HashMap<String, Object> map);

	MyPageVo getMyNoteAnswerForm(HashMap<String, Object> map);

	int myNoteAnswer(HashMap<String, Object> map);

	void readmarkCheck(HashMap<String, Object> map);

	// 비밀번호 확인
	int checkPw(HashMap<String, Object> map);

	void updateProfile(HashMap<String, Object> map, HttpServletRequest request);
	
}
