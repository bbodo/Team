package com.green.home;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Controller 
public class HomeController {
	
	@Autowired
	UserService userService;
	
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
	@RequestMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping("/loginprocess")
	public String loginprocess(
			HttpSession session,
			@RequestParam HashMap<String, Object> map
			) {
		String returnURL = "";
		
		if(session.getAttribute("login") != null) {
			// 기존 login 정보가 존재한다면 
			session.removeAttribute("login");
		}
		
		// 로그인 성공하면
		UserVo vo = userService.getLogin(map);
		if ( vo != null) {
			session.setAttribute("login", vo);
			returnURL = "redirect:/";
		} else {
			returnURL = "redirect:/login";
		}
		
		return returnURL;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(
			HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@RequestMapping("/userwrite")
	public String userwrite() {
		return "/user/userwrite";
	}
	


	
	@RequestMapping("qalist")
	public String qlist() {
		return "/board/qalist";
	}
	
	@RequestMapping("qawrite")
	public String qawrite() {
		return "/board/qawrite";
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
    @RequestMapping("/marketView")
    public String marketView() {
    	return "/market/view";
    }
    
}
