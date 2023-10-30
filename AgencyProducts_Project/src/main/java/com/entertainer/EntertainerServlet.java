package com.entertainer;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/entertainer/*")
public class EntertainerServlet extends MyServlet {
	private static final long serialVersionUID = 1L;
	private String pathname;
	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		
		
		// 이미지 저장 경로
		String root = session.getServletContext().getRealPath("/");
		pathname = root + "uploads" + File.separator + "photo";

		// uri에 따른 작업 구분
		if (uri.indexOf("actor.do") != -1) {
			// 배우화면
			actor(req, resp);
		} else if (uri.indexOf("actor_article.do") != -1) {
			// 배우 상세 페이지
			actor_article(req, resp);
		} else if (uri.indexOf("group_write.do") != -1) {
			// 그룹 추가 페이지 (연예인)
			group_write(req, resp);
		} else if (uri.indexOf("enter_write.do") != -1) {
			// 그룹원 및 솔로 추가 페이지
			enter_write(req, resp);
		}
	}

	protected void actor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		forward(req, resp, "/WEB-INF/views/entertainer/actors.jsp");
	}
	protected void actor_article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/entertainer/article.jsp");	
	}
	protected void group_write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/entertainer/group_write.jsp");
	}
	protected void enter_write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/entertainer/enter_wrtie.jsp");
	}
	
}
