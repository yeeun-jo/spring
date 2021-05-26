package com.itbank.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.model.PosDTO;
import com.itbank.service.MainService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MainService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("login") != null) {
			return true;
		}
		String requestURI = request.getRequestURI();	// 어느 주소를 요청했는가?
		requestURI = requestURI.substring(request.getContextPath().length());
		response.sendRedirect(request.getContextPath() + "/login?uri="+requestURI);
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		List<PosDTO> list = ms.getMenu();
		mav.addObject("list", list);
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
