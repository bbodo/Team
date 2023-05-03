package com.green.myNote.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.myNote.service.MyNoteService;

@Controller
public class MyNoteController {
	
	@Autowired
	MyNoteService myNoteService;
	
	@RequestMapping("/myNoteWriteForm")
	public ModelAndView myNoteWriteForm(
			@RequestParam  HashMap<String, Object> map
			) {
		
		System.out.println("쪽지GET확인:" + map.toString());
		
		//쪽지 등록
		/* int myNoteInsertCheck = myNoteService.insertMyNote(map); */
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("mypage/myNoteWrite");
		//mv.addObject("name",       name);
		return mv;
	}
	
	@RequestMapping("/myNoteWrite")
	public ModelAndView myNoteWrite(
			@RequestParam  HashMap<String, Object> map
			) {
		
		System.out.println("쪽지GET확인:" + map.toString());
		
		//쪽지 등록
		/* int myNoteInsertCheck = myNoteService.insertMyNote(map); */
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("mypage/myNoteWrite");
		//mv.addObject("name",       name);
		return mv;
	}
	
}
