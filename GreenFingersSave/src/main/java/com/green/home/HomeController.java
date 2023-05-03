package com.green.home;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Controller 
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		System.out.println("MENU" + menuList);
		System.out.println("SUBMENU" + submenuList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		mv.addObject("menuList", menuList);
		mv.addObject("submenuList", submenuList);
		
		return mv;
	}
	
	// --------------------------- 양식을 위한 주소
	// --------------------------- 그림 다그리고 컨트롤러 다시 만들죠~
	
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
	
	/*@RequestMapping("/myNoteWrite")
	public String myNoteWrite() {
		return "/mypage/myNoteWrite";
	}*/
	
	@RequestMapping("/myPageCheck")
	public String myPageCheck() {
		return "/mypage/myPageCheck";
	}
	@RequestMapping("/myPageUpdate")
	public String myPageUpdate() {
		return "/mypage/myPageUpdate";
	}
	
	// ---------admin---------

	@RequestMapping("/memberManagement")
	public String memberManagement() {
		return "/admin/memberManagement";
	}
	@RequestMapping("/memberUpdate")
	public String memberUpdate() {
		return "/admin/memberUpdate";
	}
	@RequestMapping("/menuManagement")
	public String menuManagement() {
		return "/admin/menuManagement";
	}
	@RequestMapping("/menuWrite")
	public String menuWrite() {
		return "/admin/menuWrite";
	}
	@RequestMapping("/subMenuManagement")
	public String subMenuManagement() {
		return "/admin/subMenuManagement";
	}
	@RequestMapping("/subMenuWrite")
	public String subMenuWrite() {
		return "/admin/subMenuWrite";
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
    @RequestMapping("/marketPointList")
    public String marketPointList() {
    	return "/market/pointList";
    }
    
}
