package com.green.comment.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.comment.dao.CommentDao;
import com.green.comment.vo.CommentVo;

@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setWrite(HashMap<String, Object> map) {

		sqlSession.insert("Comment.Write", map);
		
	}

	@Override
	public List<CommentVo> setRead(HashMap<String, Object> map) {

		List<CommentVo> commentList = sqlSession.selectList("Comment.ReadComment", map);
		
		return commentList;
	}

}
