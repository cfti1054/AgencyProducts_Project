package com.entertainer;

import java.io.File;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.member.SessionInfo;
import com.util.FileManager;
import com.util.MyUploadServlet;

@WebServlet("/entertainer/*")
@MultipartConfig
public class EntertainerServlet extends MyUploadServlet {
	private static final long serialVersionUID = 1L;
	private String pathname;
	
	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		HttpSession session = req.getSession();
		session.getAttribute("member");
			
		// 이미지 저장 경로
		String root = session.getServletContext().getRealPath("/");
		pathname = root + "uploads" + File.separator + "photo";

		// uri에 따른 작업 구분
		if (uri.indexOf("artist.do") != -1) {
			// 전체 아티스트
			artist(req, resp);
		} else if (uri.indexOf("actor.do") != -1) {
			// 배우 화면
			actor(req, resp);
		} else if (uri.indexOf("singer.do") != -1) {
			// 가수 화면
			singer(req, resp);
			
		} else if (uri.indexOf("article.do") != -1) {
			// 상세 페이지
			article(req, resp);

		} else if (uri.indexOf("group_write.do") != -1) {
			// 그룹 추가 페이지 (연예인)
			group_write(req, resp);
		} else if (uri.indexOf("group_write_ok.do") != -1) {
			// 그룹 추가 완료 페이지 (연예인)
			group_writeSubmit(req, resp);
		} else if (uri.indexOf("group_update.do") != -1) {
			// 그룹 수정 페이지
			group_update(req, resp);
		} else if (uri.indexOf("group_update_ok.do") != -1) {
			// 그룹 수정 완료 페이지
			group_updateSubmit(req, resp);
		} else if (uri.indexOf("group_delete.do") != -1) {
			// 그룹 삭제 페이지
			group_delete(req, resp);
		
		} else if (uri.indexOf("enter_write.do") != -1) {
			// 연예인 상세정보 추가 폼
			detailWrite(req, resp);
			
		} else if (uri.indexOf("enter_write_ok.do") != -1) {
			// 연예인 상세정보 추가 완료
			detailSubmit(req, resp);
			
		} else if (uri.indexOf("enter_update.do") != -1) {
			// 연예인 상세정보 수정 폼
			detailupdate(req, resp);
		
		} else if (uri.indexOf("enter_update_ok.do") != -1) {
			// 연예인 상세정보 수정 완료
			detailupSubmit(req, resp);
			
		} else if (uri.indexOf("enter_delete.do") != -1) {
			// 연예인 상세정보 삭제
			detaildelete(req, resp);
			
		} else if (uri.indexOf("action_write.do") != -1) {
			// 활동 추가 페이지
			action_write(req, resp);
		} else if (uri.indexOf("action_write_ok.do") != -1) {
			// 활동 추가 페이지
			action_write_ok(req, resp);
		} else if (uri.indexOf("action_update.do") != -1) {
			// 활동 추가 페이지
			action_update(req, resp);
		} else if (uri.indexOf("action_update_ok.do") != -1) {
			// 활동 추가 페이지
			action_updateSubmit(req, resp);
		} else if (uri.indexOf("action_delete.do") != -1) {
			// 활동 추가 페이지
			action_delete(req, resp);
		}
	}

	protected void artist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		// 전체 아티스트 페이지
		EntertainerDAO dao = new EntertainerDAO();

		try {
			
			List<EntertainerDTO> list = dao.listArtist();

			req.setAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		forward(req, resp, "/WEB-INF/views/entertainer/artist.jsp");

	}
	protected void actor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		// 배우 페이지
		EntertainerDAO dao = new EntertainerDAO();
		
		try {
			
			List<EntertainerDTO> list = dao.listActor();
			
			req.setAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("category", "actor");
		forward(req, resp, "/WEB-INF/views/entertainer/actors.jsp");
		
	}
	protected void singer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 가수 페이지
		EntertainerDAO dao = new EntertainerDAO();
		
		try {
			
			List<EntertainerDTO> list = dao.listSinger();
			
			req.setAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("category", "singer");
		forward(req, resp, "/WEB-INF/views/entertainer/actors.jsp");	
		
	}
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상세 페이지
		
	    EntertainerDAO dao = new EntertainerDAO();
	    String cp = req.getContextPath();
		
		try {
			
			String act_id = req.getParameter("act_id");
			
		    List<EntertainerDTO> list = dao.detailList(act_id);
		    EntertainerDTO dto = dao.findById(act_id);
		    List<EntertainerDTO> list2 = dao.ActionList(act_id);
			req.setAttribute("list", list);
			req.setAttribute("list2", list2);
			req.setAttribute("dto", dto);
			
			
			forward(req, resp, "/WEB-INF/views/entertainer/article.jsp");
			return; 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/entertainer/artist.do");
	}
	
	
	
	protected void group_write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 그룹 추가 페이지
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();
		
		if(!info.getUserId().equals("admin")) {
			resp.sendRedirect(cp + "/entertainer/artist.do");
			return;
		}
		req.setAttribute("mode", "write");

		forward(req, resp, "/WEB-INF/views/entertainer/group_write.jsp");
	}
	
	protected void group_writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 그룹 추가 완료
		EntertainerDAO dao = new EntertainerDAO();
		
		
		String cp = req.getContextPath();
		
		if(req.getMethod().equals("GET")) {
			resp.sendRedirect(cp + "/entertainer/artist.do");
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
			
			dao.insertGroup(dto);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/entertainer/artist.do");
		return;
	}
	
	protected void group_update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 그룹 수정
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		
		try {
			String act_id = req.getParameter("act_id");
			EntertainerDTO dto = dao.findById(act_id);
			
			if (dto == null) {
				resp.sendRedirect(cp + "/entertainer/artist.do");
			}
			
			req.setAttribute("mode", "update");
			req.setAttribute("dto", dto);
			forward(req, resp, "/WEB-INF/views/entertainer/group_write.jsp");
			return;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/artist.do");
	}
	
	protected void group_updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 그룹 수정 완료
		EntertainerDAO dao = new EntertainerDAO();
		
		String cp = req.getContextPath();
		
		if(req.getMethod().equals("GET")) {
			resp.sendRedirect(cp + "/entertainer/artist.do");
			return;
		}
		
		try {
			EntertainerDTO dto = new EntertainerDTO();
			
			dto.setAct_id(req.getParameter("act_id"));
			dto.setGroup_name(req.getParameter("group_name"));
			String imagefilename = req.getParameter("img_name");
			dto.setImg_name(imagefilename);
			
			Part p = req.getPart("selectFile");
			Map<String, String> map = doFileUpload(p, pathname);
			if(map != null) {
				String filename = map.get("saveFilename");
				
				// 기존 파일 제거
				FileManager.doFiledelete(pathname, imagefilename);
				dto.setImg_name(filename);
			}
			dao.updateGroup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/artist.do");
		return;
	}
	
	protected void group_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 그룹 삭제 추후 그룹원과 그룹 모두 삭제로 변경하던가 해야 할 듯?
		EntertainerDAO dao = new EntertainerDAO();
		
		String cp = req.getContextPath();
		
		try {
			String act_id = req.getParameter("act_id");
			
			EntertainerDTO dto = dao.findById(act_id);
			if(dto == null) {
				resp.sendRedirect(cp + "/entertainer/artist.do");
				return;
			}

			// 이미지 파일 지우기
			FileManager.doFiledelete(pathname, dto.getImg_name());

			// 테이블 데이터 지우기
			dao.deleteGroup(act_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/artist.do");
	}
	
//----------------------------------------------------------------------------------------------------------------------	
	
	protected void detailWrite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 연예인 상세등록 폼
		String act_id = req.getParameter("act_id");
		req.setAttribute("act_id", act_id);
		
		req.setAttribute("mode", "write");
		forward(req, resp, "/WEB-INF/views/entertainer/enter_write.jsp");
	}
	
	protected void detailSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 연예인 상세정보 등록
		
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/entertainer/*");
			return;
		}
		String act_id = req.getParameter("act_id");
		try {
			EntertainerDTO dto = new EntertainerDTO();
			
		    dto.setEnter_id(req.getParameter("enter_id"));
			dto.setEnter_name(req.getParameter("enter_name"));
			dto.setEnter_birth(req.getParameter("enter_birth"));
			dto.setDebut_date(req.getParameter("debut_date"));
			dto.setJob_num(req.getParameter("job_num"));
			dto.setAct_id(req.getParameter("act_id"));
			dto.setStage_name(req.getParameter("stage_name"));  
			
			dao.insertEnterDetail(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + act_id);
		return;
	}
	
	protected void detailupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 연예인 수정 폼
		
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		
		try {

			String enter_id = req.getParameter("enter_id");
			EntertainerDTO dto = dao.deleteFindBy(enter_id);
		   
			req.setAttribute("mode", "update");
	    	req.setAttribute("dto", dto);
			forward(req, resp, "/WEB-INF/views/entertainer/detail_update.jsp");
			return;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/artist.do");
		return;
	}
	
	protected void detailupSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 연예인 수정 완료
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/entertainer/actor.do");
			return;
		}

		try {
			EntertainerDTO dto = new EntertainerDTO();
			
		    dto.setEnter_name(req.getParameter("enter_name"));
		    dto.setEnter_birth(req.getParameter("enter_birth"));
		    dto.setDebut_date(req.getParameter("debut_date"));
		    dto.setJob_num(req.getParameter("job_num"));
		    dto.setAct_id(req.getParameter("act_id"));
		    dto.setStage_name(req.getParameter("stage_name"));
		    dto.setEnter_id(req.getParameter("enter_id"));
			
			dao.updatedetail(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
		return;
	}
	
	protected void detaildelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 연예인 삭제	
		
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		String act_id = req.getParameter("act_id");
		
		try {
			String enter_id = req.getParameter("enter_id");

			dao.deletedetail(enter_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/artist.do?act_id=" + act_id);
	} 
	
//----------------------------------------------------------------------------------------------------------------------	

	protected void action_write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 활동 추가
		String act_id = req.getParameter("act_id");
		req.setAttribute("act_id", act_id);
		
		
		req.setAttribute("mode", "write");

		forward(req, resp, "/WEB-INF/views/entertainer/action_write.jsp");
	}
	
	protected void action_write_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 활동 추가 완료
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		if(req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
			return;
		}
		
		try {
			EntertainerDTO dto = new EntertainerDTO();

			dto.setGroup_name(req.getParameter("group_name"));
			dto.setAction_num(req.getParameter("action_num"));
			dto.setAction_content(req.getParameter("action_content"));
			dto.setStart_date(req.getParameter("start_date"));
			dto.setEnd_date(req.getParameter("end_date"));
			dto.setAct_id(req.getParameter("act_id"));
		
			dao.insertAction(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
		return;
	}
	
	protected void action_update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 활동 수정
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		
		
		try {
			
			long ac_list_num = Long.parseLong(req.getParameter("ac_list_num"));
			EntertainerDTO dto = dao.findByActionListNum(ac_list_num);
			
			if (dto == null) {
				resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
			}
			
	
			req.setAttribute("mode", "update");
			req.setAttribute("dto", dto);
			req.setAttribute("act_id", dto.getAct_id());
			forward(req, resp, "/WEB-INF/views/entertainer/action_write.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
		return;
	}
	
	protected void action_updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntertainerDAO dao = new EntertainerDAO();
		String cp = req.getContextPath();
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/entertainer/artist.do");
			return;
		}

		try {
			EntertainerDTO dto = new EntertainerDTO();
			dto.setAc_list_num(Long.parseLong(req.getParameter("ac_list_num")));
			dto.setGroup_name(req.getParameter("group_name"));
			dto.setAction_num(req.getParameter("action_num"));
			dto.setAction_content(req.getParameter("action_content"));
			dto.setStart_date(req.getParameter("start_date"));
			dto.setEnd_date(req.getParameter("end_date"));
			dto.setAct_id(req.getParameter("act_id"));
			
			dao.updateAction(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + req.getParameter("act_id"));
		return;
	}
	
	protected void action_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntertainerDAO dao = new EntertainerDAO();
		
		String cp = req.getContextPath();
		String act_id = req.getParameter("act_id");
		try {
			long ac_list_num = Long.parseLong(req.getParameter("ac_list_num"));
			

			// 테이블 데이터 지우기
			dao.deleteAction(ac_list_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/entertainer/article.do?act_id=" + act_id);
	}
}
