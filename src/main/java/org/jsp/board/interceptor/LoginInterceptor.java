package org.jsp.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 유저 로그인 확인 인터셉터
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//컨트롤러 메소드가 실행되기 전의 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("LoginInterceptor 실행");
		
		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginid");
		
		//로그인 되어있지 않을 경우엔 로그인 페이지로 이동
		if (loginid == null) {
			response.sendRedirect(request.getContextPath() + "/skettologin");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
