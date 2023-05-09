package com.green.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.mypage.service.MyPageService;
import com.green.mypage.vo.MyPageVo;
import com.green.user.vo.UserVo;
@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	MyPageService myPageService;
	
	//쪽지등록페이지
	@RequestMapping("/myNoteWriteForm")
	public ModelAndView myNoteWriteForm(@RequestParam HashMap<String, Object> map) {

		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteForm =  myPageService.getmyNoteForm(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myNoteWrite");
		mv.addObject("myNoteVo", myNoteForm);
		return mv;
	}

	//쪽지등록버튼 눌렀을 때
	@RequestMapping("/myNoteWrite") 
	public ModelAndView myNoteWrite( @RequestParam HashMap<String, Object> map, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		Object usercode = userVo.getUsercode();
		map.put("sendusercode", usercode);
		
		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteForm =  myPageService.getmyNoteForm(map);
		
		//쪽지 빈 칸이 있을 경우
		String notetitle = (String) map.get("notetitle"); 
		String notecont  = (String) map.get("notecont");
		if(notetitle == "" || notecont == "") {
			mv.addObject("nullNote", "값없음");
			mv.addObject("myNoteVo", myNoteForm);
			mv.setViewName("/mypage/myNoteWrite");
			return mv;
		}
		
		//쪽지 등록 
		int myNoteInsertCheck = myPageService.insertMyNote(map);
		
		
		//쪽지등록에 실패 했을 경우
		if(myNoteInsertCheck != 1) {
			mv.setViewName("/error/error");
			return mv;
		}
		
		mv.setViewName("/mypage/myNoteWrite");
		mv.addObject("myNoteInsertCheck", myNoteInsertCheck);
		mv.addObject("myNoteVo", myNoteForm);
		return mv;
	}
	
	//쪽지답장형식
	@RequestMapping("/myNoteAnswer") 
	public ModelAndView myNoteAnswer( @RequestParam HashMap<String, Object> map, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		Object usercode = userVo.getUsercode();
		map.put("sendusercode", usercode);
		
		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteAnswerForm =  myPageService.getMyNoteAnswerForm(map);
		
		mv.setViewName("/mypage/myNoteAnswer");
		mv.addObject("userVo", userVo);
		mv.addObject("myNoteAnswerForm", myNoteAnswerForm);
		return mv;
	}
	
	//쪽지답장
	@RequestMapping("/myNoteAnswerSend") 
	public ModelAndView myNoteAnswerSend( @RequestParam HashMap<String, Object> map, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		Object usercode = userVo.getUsercode();
		map.put("sendusercode", usercode);
		
		System.out.println("wkadhsek"+map.toString());
		
		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteAnswerForm =  myPageService.getMyNoteAnswerForm(map);
		
		//쪽지 빈 칸이 있을 경우
		String notetitle = (String) map.get("notetitle"); 
		String notecont  = (String) map.get("notecont");
		if(notetitle == "" || notecont == "") {
			mv.addObject("nullNote", "값없음");
			mv.addObject("myNoteAnswerForm", myNoteAnswerForm);
			mv.setViewName("/mypage/myNoteWrite");
			return mv;
		}
		
		//쪽지 등록
		map.put("sendusercode", usercode);
		int myNoteAnswer=  myPageService.myNoteAnswer(map);

		mv.setViewName("/mypage/myNoteAnswer");
		mv.addObject("myNoteAnswer", myNoteAnswer);
		mv.addObject("userVo", userVo);
		mv.addObject("myNoteAnswerForm", myNoteAnswerForm);
		return mv;
	}
	
	@RequestMapping("/myList")
	public ModelAndView myNoteList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;
		
		map.put("nowpage",   nowpage );
		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );		
		
		// ---------------------------------------------------------------------
		// 보낸 쪽지
		List<MyPageVo>   sendPagePaingList  =  myPageService.getSendPageList( map );
		
		// 받은 쪽지
		List<MyPageVo>   recPagePaingList  =  myPageService.getRecPageList( map );
		
		// 내공 보답 할 사람 리스트
		List<MyPageVo>   sendPointList  =  myPageService.getSendPointList( map );
		
		//paging가 사용할 변수
		MyPageVo         sendNotePagingVo   =  (MyPageVo) map.get("sendNotePaging");
		MyPageVo         recNotePagingVo   =  (MyPageVo) map.get("recNotePaging");
		MyPageVo         sendPointPagingVo   =  (MyPageVo) map.get("SendPointPaging");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("userVo", userVo);
		mv.addObject("sendPagePaingList", sendPagePaingList);
		mv.addObject("recPagePaingList", recPagePaingList);
		mv.addObject("sendPointList", sendPointList);
		mv.addObject("sendPagingVo", sendNotePagingVo);
		mv.addObject("recPagingVo", recNotePagingVo);
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		return mv;
	}
	
	//쪽지 보내기 전체 보기
	@RequestMapping("/noteSendList")
	public ModelAndView noteSendList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;
		
		map.put("nowpage",   nowpage );
		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );		
		
		// ---------------------------------------------------------------------
		// 보낸 쪽지
		List<MyPageVo>   sendPagePaingList  =  myPageService.getSendPageList( map );
		
		//paging가 사용할 변수
		MyPageVo         sendNotePagingVo   =  (MyPageVo) map.get("sendNotePaging");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/noteSendList");
		mv.addObject("userVo", userVo);
		mv.addObject("sendPagePaingList", sendPagePaingList);
		mv.addObject("sendPagingVo", sendNotePagingVo);
		return mv;
	}
	
	//쪽지 받기 전체 보기
	@RequestMapping("/noteRecList")
	public ModelAndView noteRecList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;
		
		map.put("nowpage",   nowpage );
		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );		
		
		// ---------------------------------------------------------------------
		// 받은 쪽지
		List<MyPageVo>   recPagePaingList  =  myPageService.getRecPageList( map );
		
		//paging가 사용할 변수
		MyPageVo         recNotePagingVo   =  (MyPageVo) map.get("recNotePaging");
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/noteRecList");
		mv.addObject("userVo", userVo);
		mv.addObject("recPagePaingList", recPagePaingList);
		mv.addObject("recPagingVo", recNotePagingVo);
		return mv;
	}
	
	//내보낸 쪽지 View
	@RequestMapping("/myNoteView")
	public ModelAndView sendNoteView (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// 보낸 쪽지
		MyPageVo   myNoteView  =  myPageService.myNoteView( map );		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myNoteView");
		mv.addObject("userVo", userVo);
		mv.addObject("myNoteView", myNoteView);
		return mv;
	}
	
	//내보낸 쪽지 삭제
	@RequestMapping("/noteDelete")
	public ModelAndView noteUpdate (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// 보낸 쪽지 삭제
		int noteDelete = myPageService.noteDelete(map);	
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;
		
		map.put("nowpage",   nowpage );
		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );		
		
		// ---------------------------------------------------------------------
		// 보낸 쪽지
		List<MyPageVo>   sendPagePaingList  =  myPageService.getSendPageList( map );
		
		// 받은 쪽지
		List<MyPageVo>   recPagePaingList  =  myPageService.getRecPageList( map );
		
		// 내공 보답 할 사람 리스트
		List<MyPageVo>   sendPointList  =  myPageService.getSendPointList( map );
		
		//paging가 사용할 변수
		MyPageVo         sendNotePagingVo   =  (MyPageVo) map.get("sendNotePaging");
		MyPageVo         recNotePagingVo   =  (MyPageVo) map.get("recNotePaging");
		MyPageVo         sendPointPagingVo   =  (MyPageVo) map.get("SendPointPaging");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("userVo", userVo);
		mv.addObject("noteDelete", noteDelete);
		mv.addObject("sendPagePaingList", sendPagePaingList);
		mv.addObject("recPagePaingList", recPagePaingList);
		mv.addObject("sendPointList", sendPointList);
		
		mv.addObject("sendPagingVo", sendNotePagingVo);
		mv.addObject("recPagingVo", recNotePagingVo);
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		return mv;
	}
	
	//내공 전체 보기
	/*@RequestMapping("/sendPoint")
	public ModelAndView sendPoint (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		// ---------------------------------------------------------------------
		// 페이징 정보 준비
		int           nowpage   =  Integer.parseInt( (String) map.get("nowpage") ); 
		int           pagecount =  10;    // 한페이지 당 출력할 줄(row)수  - 10

		// sql 사용할 변수 : 조회할 레코드 번호
		int           startnum  =  ( nowpage - 1 ) * pagecount + 1;
		int           endnum    =  nowpage  *  pagecount;
		
		map.put("nowpage",   nowpage );
		map.put("pagecount", pagecount );
		map.put("startnum",  startnum );
		map.put("endnum",    endnum );		
		
		// ---------------------------------------------------------------------
		// 내공 보답 할 사람 리스트
		List<MyPageVo>   sendPointList  =  myPageService.getSendPointList( map );
		
		//paging가 사용할 변수
		MyPageVo         sendPointPagingVo   =  (MyPageVo) map.get("SendPointPaging");
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/noteRecList");
		mv.addObject("userVo", userVo);
		mv.addObject("sendPointList", sendPointList);
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		return mv;
	}*/
	
	//내공 주기
	@RequestMapping("/sendPoint")
	public ModelAndView sendPoint (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		myPageService.updatePoint(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mypage/myList?nowpage=1");
		mv.addObject("userVo", userVo);
		return mv;
	}
	
	
	
	

}
