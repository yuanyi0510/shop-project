package com.controller;

import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.model.AdminUser;
import com.model.Power;
import com.model.PowerRoleRelation;
import com.model.Role;

/**
 * 该拦截器，实现了拦截所有请求的功能，判断已经登录的用户是否有该请求的权限 如果没有登录， 跳回登录页面 如果没有权限返回当前页面
 * 
 * @author Administrator
 *
 */
public class PowerInterceptor implements HandlerInterceptor {

	/**
	 * 获取当前请求参数进行判断，如果有访问权限并且已经登录则返回true
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		String requestURI = request.getRequestURI();// 获取请求路径
		String contentPath = request.getContextPath();
		String url = requestURI.substring(contentPath.length());// 真正的请求路径
		System.out.println("---------" + url + "--preHandle----------");
		AdminUser loginUser = (AdminUser) request.getSession().getAttribute("loginUser");
		if (loginUser != null) {
			Role r = (Role) request.getSession().getAttribute("role");
			for (PowerRoleRelation prr : r.getPowerRoleRelation()) {
				if (prr.getPower() != null) {
					for (Power p : prr.getPower().getSubPowers()) {
						if (p != null && p.getPowerUrl().contains(url)) {
							return true;
						}
					}

					if (prr.getPower().getPowerUrl().contains(url)) {
						return true;
					}
				}

			}

		}

		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("-----------postHandle----------");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("-----------afterCompletion----------");

	}

}
