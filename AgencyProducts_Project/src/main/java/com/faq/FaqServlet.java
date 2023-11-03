package com.faq;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;

@WebServlet("/faq/*")
public class FaqServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		
		/*
		// 세션 정보
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		*/
	
		
		// uri에 따른 작업 구분
		if (uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if (uri.indexOf("write.do") != -1) {
			writeForm(req, resp);
		} else if (uri.indexOf("write_ok.do") != -1) {
			writeSubmit(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}
	}

	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시물 리스트
		FaqDAO dao = new FaqDAO();
		
		try {
			List<FaqDTO> list = null;
			
			list = dao.listFaq();
			
			req.setAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// JSP로 포워딩
		viewPage(req, resp, "faq/list.jsp");
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 폼
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// admin만 글을 등록
		if(!info.getUserId().equals("admin")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		req.setAttribute("mode", "write");
		viewPage(req, resp, "faq/write.jsp");
	}
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 등록
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		// admin만 글을 등록
		if(!info.getUserId().equals("admin")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		FaqDAO dao = new FaqDAO();
		
		try {
			FaqDTO dto = new FaqDTO();
			
			// 파라미터
			dto.setFaq_case(req.getParameter("faq_case"));
			dto.setFaq_subject(req.getParameter("faq_subject"));
			dto.setFaq_content(req.getParameter("faq_content"));
			
			dao.insertFaq(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/faq/list.do");
	}
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 폼
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(!info.getUserId().equals("admin")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		FaqDAO dao = new FaqDAO();
		
		try {
			long faq_num = Long.parseLong(req.getParameter("faq_num"));
			
			FaqDTO dto = dao.findById(faq_num);
			if(dto == null) {
				viewPage(req, resp, "redirect:/faq/list.do");
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			
			viewPage(req, resp, "faq/write.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/faq/list.do");
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 완료
		FaqDAO dao = new FaqDAO();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		if(!info.getUserId().equals("admin")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		try {
			FaqDTO dto = new FaqDTO();
			
			dto.setFaq_num(Long.parseLong(req.getParameter("faq_num")));
			dto.setFaq_case(req.getParameter("faq_case"));
			dto.setFaq_subject(req.getParameter("faq_subject"));
			dto.setFaq_content(req.getParameter("faq_content"));
			
			dao.updateFaq(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/faq/list.do");
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 삭제
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(!info.getUserId().equals("admin")) {
			viewPage(req, resp, "redirect:/faq/list.do");
			return;
		}
		
		FaqDAO dao = new FaqDAO();
		
		try {
			long faq_num = Long.parseLong(req.getParameter("faq_num"));
			
			FaqDTO dto = dao.findById(faq_num);
			if(dto == null) {
				viewPage(req, resp, "redirect:/faq/list.do");
				return;
			}
			
			dao.deleteFaq(faq_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/faq/list.do");
	}


	
	
}
