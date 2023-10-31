package com.goods;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.FileManager;
import com.util.MyUploadServlet;
import com.util.MyUtil;

@WebServlet("/goods/*")
@MultipartConfig
public class GoodsServlet extends MyUploadServlet {
	private static final long serialVersionUID = 1L;
	
	private String pathname;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		
		HttpSession session = req.getSession();
		
		// 이미지 저장 경로
		String root = session.getServletContext().getRealPath("/");
		pathname = root + "uploads" + File.separator + "photo";
		
		// uri에 따른 작업 구분
		if(uri.indexOf("goods.do") != -1) {
			mainGoods(req,resp);
		} else if(uri.indexOf("detail.do") != -1) {
			detailGoods(req, resp);
		} else if(uri.indexOf("write.do") != -1) {
			goodswrite(req, resp);
		} else if(uri.indexOf("write_ok.do") != -1) {
			goodswriteSubmit(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			goodsupdate(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			goodsupdateSubmit(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}	
		
	}
	
	protected void mainGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 메인 상품 페이지
		GoodsDAO dao = new GoodsDAO();
		MyUtil util = new MyUtil();
		String path = "/WEB-INF/views/goods/goods.jsp";
		
		String cp = req.getContextPath();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if (page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 검색
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if (schType == null) {
				schType = "all";
				kwd = "";
			}
			
			// GET 방식인 경우 디코딩
			if (req.getMethod().equalsIgnoreCase("GET")) {
				kwd = URLDecoder.decode(kwd, "utf-8");
			}
			
			// 전체 데이터 개수
			int dataCount;
			if (kwd.length() == 0) {
				dataCount = dao.dataCount();
			} else {
				dataCount = dao.dataCount(schType, kwd);
			}
						
			// 전체 페이지 수
			int size = 25;
			int total_page = util.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			// 게시물 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<GoodsDTO> list = null;
			if (kwd.length() == 0) {
				list = dao.listGoods(offset, size);
			} else {
				list = dao.listGoods(offset, size, schType, kwd);
			}
			
			String query = "";
			if (kwd.length() != 0) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			// 페이징 처리
			String goodsUrl = cp + "/goods/goods.do";
			String detailUrl = cp + "/goods/detail.do?page=" + current_page;
			if (query.length() != 0) {
				goodsUrl += "?" + query;
				detailUrl += "&" + query;
			}
			
			String paging = util.paging(current_page, total_page, goodsUrl);
			
			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("detailUrl", detailUrl);
			req.setAttribute("paging", paging);
			req.setAttribute("schType", schType);
			req.setAttribute("kwd", kwd);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		forward(req, resp, path);
	}
	
	protected void detailGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 상세 페이지
		GoodsDAO dao = new GoodsDAO();
		MyUtil util = new MyUtil();
		
		String cp = req.getContextPath();
		String page = req.getParameter("page");
		
		String query = "page=" + page;
		
		try {
			long photoNum = Long.parseLong(req.getParameter("photo_num"));
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if(schType == null) {
				schType = "all";
				kwd = "";
			}
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			if(kwd.length() != 0) {
				query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			// 굿즈 상세내용 가져오기
			GoodsDTO dto = dao.findById(photoNum);
			if(dto == null) {
				resp.sendRedirect(cp + "/goods/goods.do?" + query);
				return;
			}
			dto.setGoods_acc(util.htmlSymbols(dto.getGoods_acc()));
			
			// JSP로 전달할 속성
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			
			// 포워딩
			forward(req, resp, "/WEB-INF/views/goods/detail.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/goods/goods.do?" + query);
	}
	
	protected void goodswrite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 굿즈 작성 폼
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> listEntertainer = dao.listEntertainer();
		
		req.setAttribute("mode", "write");
		req.setAttribute("listEntertainer", listEntertainer);
		forward(req, resp, "/WEB-INF/views/goods/write.jsp");
	}
		
	protected void goodswriteSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 굿즈 작성 저장
		GoodsDAO dao = new GoodsDAO();
		
		String cp = req.getContextPath();
		if(req.getMethod().equals("GET")) {
			resp.sendRedirect(cp + "/goods/goods.do");
			return;
		}
		
		try {
			GoodsDTO dto = new GoodsDTO();
			
			dto.setGoods_id(req.getParameter("goods_id"));
			dto.setGoods_name(req.getParameter("goods_name"));
			dto.setGoods_price(Integer.parseInt(req.getParameter("price")));
			dto.setAct_id(req.getParameter("act_id"));
			dto.setGoods_count(Integer.parseInt(req.getParameter("quantity")));
			dto.setGoods_acc(req.getParameter("content"));
			
			//
			Map<String, String[]> map = doFileUpload(req.getParts(), pathname);
			if (map != null) {
				String[] saveFiles = map.get("saveFilenames");
				dto.setImg_names(saveFiles);
			}
			
			dao.insertGoods(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/goods/goods.do");
		
	}
	
	protected void goodsupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GoodsDAO dao = new GoodsDAO();
		
		String cp = req.getContextPath();
		
		try {
			long photoNum = Long.parseLong(req.getParameter("photo_num"));
			GoodsDTO dto = dao.findById(photoNum);
			
			if(dto == null) {
				resp.sendRedirect(cp + "/goods/goods.do");
				return;
			}
			
			req.setAttribute("mode", "update");
			req.setAttribute("dto", dto);
			
			forward(req, resp, "/WEB-INF/views/goods/write.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/goods/goods.do");
		
	}
	
	protected void goodsupdateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GoodsDAO dao = new GoodsDAO();
		
		String cp = req.getContextPath();
		if(req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/goods/goods.do");
			return;
		}
		
		try {
			GoodsDTO dto = new GoodsDTO();
			
			dto.setGoods_id(req.getParameter("goods_id"));
			dto.setGoods_name(req.getParameter("goods_name"));
			dto.setGoods_price(Integer.parseInt(req.getParameter("price")));
			dto.setAct_id(req.getParameter("act_id"));
			dto.setGoods_count(Integer.parseInt(req.getParameter("quantity")));
			dto.setGoods_acc(req.getParameter("content"));
			
			String img_name = req.getParameter("img_name");
			dto.setImg_name(img_name);
			
			Map<String, String[]> map = doFileUpload(req.getParts(), pathname);
			if(map != null) {
				String[] saveFiles = map.get("saveFilenames");
				
				// 기존 파일제거. 새로운 파일을 올리면 기존파일을 삭제시켜야 한다.
				FileManager.doFiledelete(pathname, img_name);
				
				dto.setImg_names(saveFiles);
			}
			
			long photoNum = Long.parseLong(req.getParameter("photo_num"));
			
			dao.updateGoods(dto, photoNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/goods/goods.do");
		
	}

	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GoodsDAO dao = new GoodsDAO();
		
		String cp = req.getContextPath();
		
		try {
			long photoNum = Long.parseLong(req.getParameter("photo_num"));
			
			String goodsId = req.getParameter("goods_id");
			
			GoodsDTO dto = dao.findById(photoNum);
			
			if(dto == null) {
				resp.sendRedirect(cp + "/goods/goods.do");
				return;
			}
			
			// 이미지 파일 지우기
			FileManager.doFiledelete(pathname, dto.getImg_name());
			
			// 테이블 데이터 지우기
			dao.deleteGoods(goodsId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/goods/goods.do");
		
	}
	
}
