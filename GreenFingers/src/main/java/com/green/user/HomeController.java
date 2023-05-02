package com.green.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	// --------------------------- 양식을 위한 주소
	// --------------------------- 그림 다그리고 컨트롤러 다시 만들죠~
	
	// ---------Board---------
	@RequestMapping("/board")
	public String board() {
		return "/board/list";
	}
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	@RequestMapping("/view")
	public String view() {
		return "/board/view";
	}
	@RequestMapping("/update")
	public String update() {
		return "/board/update";
	}
	
	
	// ---------user---------
	@RequestMapping("login")
	public String login() {
		return "/user/login";
	}
	@RequestMapping("/userwrite")
	public String userwrite() {
		return "/user/userwrite";
	}
	
	// ---------Event---------
	@RequestMapping("/eventList")
	public String eventList() {
		return "/event/eventList";
	}
	@RequestMapping("/eventView")
	public String eventView() {
		return "/event/eventView";
	}
	@RequestMapping("/winnerList")
	public String winnerList() {
		return "/event/winnerList";
	}
	@RequestMapping("/winnerView")
	public String winnerView() {
		return "/event/winnerView";
	}

	// ---------mypage---------
	
	@RequestMapping("/myList")
	public String myList() {
		return "/mypage/myList";
	}
	@RequestMapping("/myNote")
	public String myNote() {
		return "/mypage/myNote";
	}
	@RequestMapping("/myNoteWrite")
	public String myNoteWrite() {
		return "/mypage/myNoteWrite";
	}
	@RequestMapping("/myPageCheck")
	public String myPageCheck() {
		return "/mypage/myPageCheck";
	}
	@RequestMapping("/myPageUpdate")
	public String myPageUpdate() {
		return "/mypage/myPageUpdate";
	}
	
	// ---------admin---------

	@RequestMapping("/adminMemberManagement")
	public String adminMemberManagement() {
		return "/admin/adminMemberManagement";
	}
	@RequestMapping("/adminMemberUpdate")
	public String adminMemberUpdate() {
		return "/admin/adminMemberUpdate";
	}
	@RequestMapping("/adminUpperMenuManagement")
	public String adminUpperMenuManagement() {
		return "/admin/adminUpperMenuManagement";
	}
	@RequestMapping("/adminUpperMenuWrite")
	public String adminUpperMenuWrite() {
		return "/admin/adminUpperMenuWrite";
	}
	@RequestMapping("/adminLowerMenuManagement")
	public String adminLowerMenuManagement() {
		return "/admin/adminLowerMenuManagement";
	}
	@RequestMapping("/adminLowerMenuWrite")
	public String adminLowerMenuWrite() {
		return "/admin/adminLowerMenuWrite";
	}
	
	
	//---------market-----------------

    @RequestMapping("/market")
    public String market() {
        return "/market/list";
    }
    @RequestMapping("/marketWrite")
    public String marketWrite() {
    	return "/market/write";
    }
    @RequestMapping("/marketUpdate")
    public String marketUpdate() {
    	return "/market/update";
    }
}
