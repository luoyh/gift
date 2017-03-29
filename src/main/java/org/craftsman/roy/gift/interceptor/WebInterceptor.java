package org.craftsman.roy.gift.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.craftsman.roy.gift.App;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 
 * @author luoyh
 * @date Mar 22, 2017
 */
public class WebInterceptor extends HandlerInterceptorAdapter {
	
	private static final String ADMIN_URL = "/admin";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		String uri = request.getRequestURI();
		System.err.println(uri);
		if (null != uri && uri.length() > 0) {
			if (uri.startsWith(ADMIN_URL)) {
				return auth(request);
			}
		}
		return true;
	}
	
	private boolean auth(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return null != session && null != session.getAttribute(App.JSESSION_TOKEN);
	}

}
