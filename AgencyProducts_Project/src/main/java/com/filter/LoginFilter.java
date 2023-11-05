package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;

@WebFilter("/*")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// request 필터
		
		// 로그인 체크
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		String cp = req.getContextPath();
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info == null && isExcludeUri(req) == false) {
			if(isAjaxRequest(req)) {
				resp.sendError(403);
			} else {
				// 로그인 전주소가 존재하는 경우 로그인 전 주소로 가기 위해 
				//    세션에 로그인 전주소 저장
				// 로그인 전주소로 돌아기는 것은 login에서 처리
				String uri = req.getRequestURI();
				String queryString = req.getQueryString();
				if(queryString != null) {
					uri += "?" + queryString;
				}
				session.setAttribute("preLoginURI", uri);
				
				resp.sendRedirect(cp + "/form/login.do");
			}
			
			return;
		}
		
		// 다음필터 또는 필터의 마지막이면 해당 End-point(Servlet, JSP 등)을 실행
		chain.doFilter(request, response);
		
		// response 필터
	}
	
	// 요청이 AJAX인지 확인
	private boolean isAjaxRequest(HttpServletRequest req) {
		String h = req.getHeader("AJAX");
		
		return h != null && h.equals("true");
	}
	
	// uri가 로그인이 되어 있지 않아도 되면 true를 반환
	private boolean isExcludeUri(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		uri = uri.substring(cp.length());
		
		String[] uris = {
			"/index.jsp", "/main.do", 
			"/form/login.do", "/form/login_ok.do",
			"/form/member.do", "/form/member_ok.do",
			"/form/userIdCheck.do", "/notice/list.do",
			"/company/**", "/goods/**", "/entertainer/**",
			"/bbs/**", 
			"/faq/**", "/qna/list.do",
			"/image/**",
			"/resource/**"
		};
		
		if(uri.length() <= 1) {
			return true;
		}
		
		for(String u : uris) {
			if(u.lastIndexOf("**") != -1) {
				u = u.substring(0, u.lastIndexOf("**"));
				if(uri.indexOf(u) == 0) {
					return true;
				}
			} else if(uri.equals(u)) {
				return true;
			}
		}
		
		return false;
	}

}
