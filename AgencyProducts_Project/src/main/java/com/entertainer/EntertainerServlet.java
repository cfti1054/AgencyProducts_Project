package com.entertainer;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.util.MyUploadServlet;

@WebServlet("/entertainer/*")
@MultipartConfig
public class EntertainerServlet extends MyUploadServlet {
	private static final long serialVersionUID = 1L;
	private String pathname;
	
	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		//String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
	//	SessionInfo info = (SessionInfo)session.getAttribute("member");
		/*if(info == null) {
			resp.sendRedirect(cp + "/member/login.do");
			return;
		}*/
		
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
		} else if (uri.indexOf("group_write_ok.do") != -1) {
			// 그룹 추가 완료 페이지 (연예인)
			group_writeSubmit(req, resp);
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
		req.setAttribute("mode", "write");
		forward(req, resp, "/WEB-INF/views/entertainer/group_write.jsp");
	}
	protected void group_writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// actor로 가지말고 관리자는 전체 소속사 인원 리스트로 돌아가도록 만들어야 할 거 같음.
		EntertainerDAO dao = new EntertainerDAO();
		
		String cp = req.getContextPath();
		if(req.getMethod().equals("GET")) {
			resp.sendRedirect(cp + "/entertainer/*");
			return;
		}
		
		try {
			EntertainerDTO dto = new EntertainerDTO();
			
			dto.setAct_id(req.getParameter("act_id"));
			dto.setGroup_name(req.getParameter("group_name"));
			String filename;
			Part p = req.getPart("selectFile");
			Map<String, String> map = doFileUpload(p, pathname);
			if(map != null) {
				filename = map.get("saveFilename");
				
				dto.setImg_name(filename);
			}
			
			dao.insertEnter(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/entertainer/actor.do");
	}
	protected void enter_write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/entertainer/enter_write.jsp");
	}
	
}
