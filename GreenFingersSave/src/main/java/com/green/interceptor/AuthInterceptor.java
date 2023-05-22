package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	// preHandle() : Controller 보다 먼저 실행되는 메소드
	// login 관련 처리를 한다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		
		String requestUrl = request.getRequestURL().toString();
		
		// /login 페이지는 체크에서 제외해야함. 
		if(requestUrl.contains("/User/Login")) {
			return true;
		}
		
		//-----------------------------------------------------------
		Object obj  = session.getAttribute("login");
		Object objm  = session.getAttribute("managerlogin");
		
		if(obj == null && objm == null) {
			// 로그인되어 있지 않다면 /login 화면으로 이동하시오
			response.sendRedirect("/User/Login");
			return false;
		}
		
		// preHandle 의 return 은 컨트롤러 요청 url로 가도 되나 안되나를 허가하는 의미
		// true : 컨트롤러 url 로 가게됨
		
		return super.preHandle(request, response, handler);
	}

	// postHandle() : Controller 가 실행되고 화면이 보여지기 직전에 수행되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
