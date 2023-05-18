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
		System.out.println(commentList);
		
		return commentList;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("/Delete")
	public String commentDelete(
			@RequestParam HashMap<String, Object> map
			) {
		int cnf = commentService.setDelete(map);
		if(cnf == 1)
			return "suc";
		else
			return "fail";
		}
		
	// 대댓글 작성
	@ResponseBody
	@RequestMapping("/ReCommentWrite")
	public List<CommentVo> reCommentWrite(
			@RequestParam HashMap<String, Object> map
			) {
		
		commentService.reWrite(map);
		
		List<CommentVo> commentList = commentService.setRead(map);
		
		return commentList;
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping("/CommentUpdate")
	public List<CommentVo> commentUpdate(
			@RequestParam HashMap<String, Object> map
			) {

		System.out.println("댓수"+map);
		
		commentService.setUpdate(map);
		
		List<CommentVo> commentList = commentService.setRead(map);
		
		return commentList;
	}
	
}
