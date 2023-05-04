package com.green.comment.dao;

import java.util.HashMap;
import java.util.List;

import com.green.comment.vo.CommentVo;

public interface CommentDao {

	void setWrite(HashMap<String, Object> map);

	List<CommentVo> setRead(HashMap<String, Object> map);

}
