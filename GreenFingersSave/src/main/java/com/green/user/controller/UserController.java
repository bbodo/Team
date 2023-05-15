package com.green.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.vo.ManagerVo;
import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.menus.vo.SubmenuVo;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@RequestMapping("/User")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	// 로그인 화면으로 이동
	@RequestMapping("/Login")
	public ModelAndView login(HttpServletRequest request) {
		
		String uri = request.getHeader("Referer");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/login");
		mv.addObject("uri", uri);
		return mv;
	}
	
	// 로그인 할 user 정보 처리
	@RequestMapping("/LoginProcess")
	public ModelAndView loginprocess( HttpSession session,
			@RequestParam HashMap<String, Object> map ) {
		
		String uri = (String) map.get("uri"); 
	
		// 기존 login 정보가 존재한다면 
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		List<MenuVo> menuList = menuService.getMenuList();
		List<SubmenuVo> submenuList = menuService.getSubmenuList1();
		
		ModelAndView mv = new ModelAndView();
		
		// 가입된 회원인지 체크
		String userid = (String) map.get("userid");
		UserVo idVo   = userService.idCheck(userid);
		UserVo vo     = userService.getLogin(map);
				
		// 관리자 체크
		ManagerVo mVo = userService.getManager(map);
		
		if( mVo != null) {
			session.setAttribute("managerlogin", mVo);
			mv.setViewName("redirect:/Manager/Home");
		} else {
			if( vo != null) {
				int delmem = vo.getDelmem();
				if( delmem == 0) {
					session.setAttribute("login", vo);
					mv.setViewName("redirect:" + uri);
					mv.addObject("menuList", menuList);
					mv.addObject("submenuList", submenuList);
					mv.addObject("vo", vo);
				} else {
					mv.setViewName("user/login");
					mv.addObject("noid", "noid");
					mv.addObject("uri", uri);
				}
			} else {
				if( idVo != null) {
					int delmem = idVo.getDelmem();
					if ( delmem == 0 ) {
						mv.setViewName("user/login");
						mv.addObject("message", "fail");
						mv.addObject("uri", uri);
					} else {
					mv.setViewName("user/login");
					mv.addObject("noid", "noid");
					mv.addObject("uri", uri);
					}
				} else {
					mv.setViewName("user/login");
					mv.addObject("noid", "noid");
					mv.addObject("uri", uri);
				}
			}
		} 
		return mv;
	}

	// 회원가입창으로 이동
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(@RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView("/user/userwrite");
		mv.addObject("map", map);
		return mv;
	}
	
	// 아이디 중복체크
	@RequestMapping(value="/IdCheck", method= {RequestMethod.POST})
	@ResponseBody
	public int idCheck(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session, String userid) {
		
		int idCheckresult = userService.idCheck1(userid);
		return idCheckresult;   
	}
	
	// 이메일 중복체크
	@RequestMapping(value="/EmailCheck", method= {RequestMethod.POST})
	@ResponseBody
	public int emailCheck(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session, String email) {
		
		int emailCheckresult = userService.emailCheck(email);
		return emailCheckresult;   
	}
	// 닉네임 중복체크
	@RequestMapping(value="/NicknameCheck", method= {RequestMethod.POST})
	@ResponseBody
	public int nicknameCheck(HttpServletRequest req, HttpServletResponse resp, 
			HttpSession session, String nickname) {
		
		int nicknameCheckresult = userService.nicknameCheck(nickname);
		return nicknameCheckresult;   
	}
	
	
	// DB 에 가입하는 회원정보 저장하고 로그인된 홈화면으로 이동
	@RequestMapping("/Write")
	public ModelAndView write(HttpSession session,
			@RequestParam HashMap<String, Object> map) {
		String uri = (String) map.get("uri"); 
		System.out.println("uri: " + uri);
		System.out.println("in : " + map);
		
		userService.userWrite(map);
		System.out.println("out : " + map);
		UserVo vo = userService.getLogin(map);
		
		ModelAndView mv = new ModelAndView();
		session.setAttribute("login", vo);
		mv.setViewName("redirect:" + uri);
		mv.addObject("map", map);
		return mv;
	}
	
	// 아이디 / 비밀번호 찾기 화면
	@RequestMapping("/FindForm")
	public ModelAndView findForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/find");
		
		return mv;
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(
			@RequestParam HashMap<String, Object> map
			) {
		
		String userid = userService.getUserId(map);
		
		return userid;
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/findPw")
	public String findPw(
			@RequestParam HashMap<String, Object> map
			) {
		
		String userpw = userService.getUserPw(map);
		
		return userpw;
	}
	
	
	// 로그아웃
	@RequestMapping("/Logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}
