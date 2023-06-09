package com.green.comment.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.comment.dao.CommentDao;
import com.green.comment.service.CommentService;
import com.green.comment.vo.CommentVo;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void setWrite(HashMap<String, Object> map) {

		commentDao.setWrite(map);
		
	}

	@Override
	public List<CommentVo> setRead(HashMap<String, Object> map) {

		List<CommentVo> commentList = commentDao.setRead(map);
		
		return commentList;
	}

	@Override
	public int setDelete(HashMap<String, Object> map) {

		int cnf = commentDao.setDelete(map);
		
		return cnf;
		
	}

	@Override
	public void reWrite(HashMap<String, Object> map) {

		commentDao.reWrite(map);
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {

		commentDao.setUpdate(map);
		
	}

}
