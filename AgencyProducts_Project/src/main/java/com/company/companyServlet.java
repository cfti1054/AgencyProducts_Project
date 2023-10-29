package com.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;

@WebServlet("/company/*")
public class companyServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();

		// uri에 따른 작업 구분
		if(uri.indexOf("about.do") != -1) {
			aboutForm(req, resp);
		} else if (uri.indexOf("greeting.do") != -1) {
			greetingForm(req, resp);
		} else if (uri.indexOf("business.do") != -1) {
			businessForm(req, resp);
		} else if (uri.indexOf("map.do") != -1) {
			mapForm(req, resp);
		} else if (uri.indexOf("notice.do") != -1) {
			noticeForm(req, resp);
		} 
		
	}

	protected void aboutForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/company/about.jsp");
	}

	protected void greetingForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/company/greeting.jsp");
	}
	
	protected void businessForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/company/business.jsp");
	}
	
	protected void mapForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/company/map.jsp");
	}

	protected void noticeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/company/notice.jsp");
	}


}
