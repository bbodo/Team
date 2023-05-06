package com.green.myPage.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.myPage.dao.MyPageDao;
import com.green.myPage.vo.MyPageVo;

@Repository("MyPageDao")
public class myPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public MyPageVo getMyNoteForm(HashMap<String, Object> map) {
		MyPageVo myNoteForm = sqlSession.selectOne("MyPage.MyPageNoteSelect", map);
		return myNoteForm;
	}
	
	@Override
	public int insertMyNote(HashMap<String, Object> map) {
		
		int myNoteInsertCheck = sqlSession.insert("MyPage.MyPageNoteInsert",map);
		/* System.out.println("쪽지Dao확인:" + map.toString()); */
		return myNoteInsertCheck;
	}

	@Override
	public List<MyPageVo> getMyPageList(int usercode) {
		List<MyPageVo> myPageVo = sqlSession.selectList("MyPage.MyPageList", usercode);
		return myPageVo;
	}

}
