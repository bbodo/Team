package com.green.myNote.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.myNote.dao.MyNoteDao;
import com.green.myNote.vo.MyNoteVo;

@Repository("MyNoteDao")
public class myNoteDaoImpl implements MyNoteDao {
	
	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public MyNoteVo getMyNoteForm(HashMap<String, Object> map) {
		MyNoteVo myNoteForm = sqlSession.selectOne("MyPage.MyPageNoteSelect", map);
		System.out.println(myNoteForm);
		return myNoteForm;
	}
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = sqlSession.insert("Mypage.MyPageNoteInsert",map);
		
		return myNoteInsertCheck;
	}


}
