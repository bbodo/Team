package com.green.comment.service;

import java.util.HashMap;
import java.util.List;

import com.green.comment.vo.CommentVo;

public interface CommentService {

	void setWrite(HashMap<String, Object> map);

	List<CommentVo> setRead(HashMap<String, Object> map);

	int setDelete(HashMap<String, Object> map);

	void reWrite(HashMap<String, Object> map);

}
