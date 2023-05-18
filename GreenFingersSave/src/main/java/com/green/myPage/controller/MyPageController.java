package com.green.myPage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.vo.BoardVo;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.myPage.service.MyPageService;
import com.green.myPage.vo.MyPageVo;
import com.green.user.vo.UserVo;
@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MyPageService myPageService;
	
	//쪽지등록페이지
	@RequestMapping("/myNoteWriteForm")
	public ModelAndView myNoteWriteForm(@RequestParam HashMap<String, Object> map, HttpSession session) {

		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteForm =  myPageService.getmyNoteForm(map);
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		Object usercode = userVo.getUsercode();
		map.put("sendusercode", usercode);

		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.setViewName("mypage/myNoteWrite");
		mv.addObject("myNoteVo", myNoteForm);
		mv.addObject("userVo", userVo);
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
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
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
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("myNoteInsertCheck", myNoteInsertCheck);
		mv.addObject("myNoteVo", myNoteForm);
		mv.addObject("userVo", userVo);
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
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		//쪽지등록 전 필요한 값 들고오기
		MyPageVo myNoteAnswerForm =  myPageService.getMyNoteAnswerForm(map);
		
		mv.setViewName("/mypage/myNoteAnswer");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
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
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
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
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("myNoteAnswerForm", myNoteAnswerForm);
		return mv;
	}
	
	@RequestMapping("/myList")
	public ModelAndView myNoteList (@RequestParam HashMap<String, Object> map,
			HttpSession session, HttpServletRequest request) {
		
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
		// 내가 쓴 글
		List<BoardVo> boardList  = myPageService.getMyBoardList(map);
		
		//paging이 사용할 변수
		BoardVo boardVo = (BoardVo) map.get("boardVo");
		
		//내가 쓴 게시글 수
		 myPageService.getMyBoardCount(map);
		 int myBoardCount = (int) map.get("myBoardCount");
		//----------------------------------------------------------------------
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
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		String sfilename =  myPageService.getSfilename( map );
		System.out.println("흠냐흠냐" + sfilename);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myList");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("sfilename", sfilename);
		//쪽지 관련
		mv.addObject("sendPagePaingList", sendPagePaingList);
		mv.addObject("recPagePaingList", recPagePaingList);
		mv.addObject("sendPointList", sendPointList);
		mv.addObject("sendPagingVo", sendNotePagingVo);
		mv.addObject("recPagingVo", recNotePagingVo);
		//내공보답
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		//내가 쓴 글
		mv.addObject("boardList", boardList);
		mv.addObject("boardVo", boardVo);
		mv.addObject("myBoardCount", myBoardCount);
		return mv;
	}
	
	@RequestMapping("/myProfile")
	public ModelAndView myProfile (@RequestParam HashMap<String, Object> map,
			HttpSession session, HttpServletRequest request) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		//파일저장
		myPageService.updateProfile(map, request);
		System.out.println("map흠" + map);
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("map", map);
		mv.setViewName("redirect:/mypage/myList?nowpage=1");
		return mv;
	}
	
	//쪽지 보내기 전체 보기
	@RequestMapping("/noteSendList")
	public ModelAndView noteSendList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
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
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
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
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
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
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
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
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		//-----------------------------------------------------------------
		
		// 쪽지 view 
		MyPageVo   myNoteView  =  myPageService.myNoteView( map );
		
		System.out.println("쪽ㄷㅈ확인니닌" + map);
		
		//받은 쪽지 닉네임 / 내가 받은 쪽지 기준으로 내보낸 사람 코드 가져와서 내보낸 사람 코드들을 map에 저장하고 그 내보낸 사람들을 for문 돌려서 멤버에 닉네임을 최종적으로 받는다
		//1차 작업 : 나한테 보낸 사람 코드 받기
		//List<MyPageVo>   u  =  myPageService.getRecPageList( map );
		//System.out.println(myNoteView + "myNoteView");
		
		//나한테 보낸 사람 nickname 구하기
		List<MyPageVo>   resSendUserNickname  =  myPageService.getresSendUsercode( map );
		System.out.println(resSendUserNickname + "resSendUserNickname 최종 전");
		
		//3차 작업 : receiveusercode를 member에 연결하여 닉네임을 받는다.
		//List<MyPageVo>   recPagePaingList  =  myPageService.getRecPageList( map );
		
		//readmark 읽음
		myPageService.readmarkCheck(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myNoteView");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("myNoteView", myNoteView);
		return mv;
	}
	
	//받은 쪽지 View
	@RequestMapping("/myNoteView2")
	public ModelAndView sendNoteView2 (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		//-----------------------------------------------------------------
		
		// 보낸 쪽지
		MyPageVo   myNoteView  =  myPageService.myNoteView( map );
		
		/*
		 * System.out.println("wdfdfdf"+ myNoteView); System.out.println("wdfdfdf"+
		 * map.toString());
		 */
		//readmark 읽음
		myPageService.readmarkCheck(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myNoteView2");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
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
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		//-----------------------------------------------------------------
		
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
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		mv.addObject("sendPagePaingList", sendPagePaingList);
		mv.addObject("recPagePaingList", recPagePaingList);
		mv.addObject("sendPointList", sendPointList);
		
		mv.addObject("sendPagingVo", sendNotePagingVo);
		mv.addObject("recPagingVo", recNotePagingVo);
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		return mv;
	}
	
	//내공 전체 보기
	@RequestMapping("/sendPointList")
	public ModelAndView sendPointList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
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
		mv.setViewName("mypage/sendPointList");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("sendPointList", sendPointList);
		mv.addObject("sendPointPagingVo", sendPointPagingVo);
		return mv;
	}
	
	//내공 주기
	@RequestMapping("/sendPoint")
	public ModelAndView sendPoint (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		//-----------------------------------------------------------------
		
		//받는 사람 포인트 등급 추가
		myPageService.updatePoint(map);
		
		//보낸 사람 포인트 등급 감소
		//myPageService.myUpdatePoint(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mypage/myList?nowpage=1");
		mv.addObject("userVo", userVo);
		return mv;
	}
	
	//내가 쓴 글 전체보기
	@RequestMapping("/myBoardList")
	public ModelAndView myBoardList (@RequestParam HashMap<String, Object> map,
			HttpSession session) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		int usercode = userVo.getUsercode();
		map.put("usercode", usercode);
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
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
		List<BoardVo>   myBoardList  = myPageService.getMyBoardList(map);
		
		//paging가 사용할 변수
		BoardVo boardVo = (BoardVo) map.get("boardVo");	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myBoardList");
		mv.addObject("userVo", userVo);
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		mv.addObject("boardList", myBoardList);
		mv.addObject("boardVo", boardVo);
		return mv;
	}
	
	// 개인정보수정 확인창
	@RequestMapping("/checkUpdateForm")
	public ModelAndView checkUpdateForm() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/myPageCheck");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		return mv;
	}
	
	// 개인정보 수정하기전 확인
	@ResponseBody
	@RequestMapping("/checkPw")
	public int checkPw(
		@RequestParam HashMap<String, Object> map
		) {
		
		int a1 = myPageService.checkPw(map);
		
		return a1;
	}
	
	// 개인정보수정 창으로
	@RequestMapping("/myUpdate")
	public ModelAndView myUpdate() {
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myPageUpdate");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		return mv;
	}

	// 개인정보수정
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(
			@RequestParam HashMap<String, Object> map
			) {
		
		myPageService.updateUser(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/mypage/myList?nowpage=1");
		
		return mv;
	}
		
}
