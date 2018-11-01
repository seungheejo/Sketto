package org.jsp.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * ユーザーのログイン確認インターセプタ
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//コントローラのメソッドが実行する前に処理
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("LoginInterceptor 실행");
		
		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginid");
		
		//ログインされない場合はログインページに移動
		if (loginid == null) {
			response.sendRedirect(request.getContextPath() + "/skettologin");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
