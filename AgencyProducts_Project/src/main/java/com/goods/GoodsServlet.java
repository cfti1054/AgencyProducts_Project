package com.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;

@WebServlet("/goods/*")
public class GoodsServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		// uri에 따른 작업 구분
		if(uri.indexOf("goods.do") != -1) {
			mainGoods(req,resp);
		}
		
	}
	
	protected void mainGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 메인 상품 페이지
		String path = "/WEB-INF/views/goods/goods.jsp";
		forward(req, resp, path);
	}

}
