package com.payment;

import java.io.IOException;   
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;

@WebServlet("/payment/*")
public class paymentServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();

		// uri에 따른 작업 구분
		if(uri.indexOf("payment.do") != -1) {
			paymentForm(req,resp);
		}
	}
	
	protected void paymentForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		paymentDAO dao = new paymentDAO();
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			
			
			List<paymentDTO> list = dao.listpayment(info.getUserId());
			
			if (list == null) {
				session.invalidate();
				resp.sendRedirect(cp + "/");
				return;
			} 
	
			req.setAttribute("list", list);
			forward(req, resp, "/WEB-INF/views/payment/payment.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/");
	}
}
