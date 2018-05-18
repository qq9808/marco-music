package com.marco.music.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.marco.music.common.keyword.Keyword;

/**
 * @author Marco
 * @date 2017年6月1日 上午9:28:49
 * 后台管理人检查拦截器.
 */
public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		Object adminObj = request.getSession().getAttribute(Keyword.ADMIN);
		
		if(adminObj == null) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return false;  
		}
		
		return true;
	}
	
}
