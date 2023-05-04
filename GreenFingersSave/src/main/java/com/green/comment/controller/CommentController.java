package com.green.comment.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.comment.service.CommentService;
import com.green.comment.vo.CommentVo;

@RequestMapping("/Comment")
@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping("/Write")
	public List<CommentVo> commentWrite(
			@RequestParam HashMap<String, Object> map
			) {

		commentService.setWrite(map);
		
		List<CommentVo> commentList = commentService.setRead(map);
		
		return commentList;
	}
	
	// 댓글 불러오기
	@ResponseBody
	@RequestMapping("/Read")
	public List<CommentVo> commentRead(
			@RequestParam HashMap<String, Object> map
			) {
		
		List<CommentVo> commentList = commentService.setRead(map);
		
		return commentList;
	}
	
}
