package com.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/form/*")
public class MemberServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();

		// uri에 따른 작업 구분
		if (uri.indexOf("login.do") != -1) {
			loginForm(req, resp);
		} else if (uri.indexOf("login_ok.do") != -1) {
			loginSubmit(req, resp);
		} else if (uri.indexOf("logout.do") != -1) {
			logout(req, resp);
		} else if (uri.indexOf("member.do") != -1) {
			memberForm(req, resp);
		} else if (uri.indexOf("member_ok.do") != -1) {
			memberSubmit(req, resp);
		} else if (uri.indexOf("pwd.do") != -1) {
			pwdForm(req, resp);
		} else if (uri.indexOf("pwd_ok.do") != -1) {
			pwdSubmit(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} else if (uri.indexOf("userIdCheck.do") != -1) {
			userIdCheck(req, resp);
		} else if(uri.indexOf("shopping.do") != -1) {
			shoopingForm(req,resp);
		}else if(uri.indexOf("userinfo.do") != -1) {
			userdataForm(req,resp);
		} 
	}

	protected void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 폼
		String path = "/WEB-INF/views/form/login.jsp";
		forward(req, resp, path);
	}

	protected void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 처리
		// 세션객체. 세션 정보는 서버에 저장(로그인 정보, 권한등을 저장)
		HttpSession session = req.getSession();

		MemberDAO dao = new MemberDAO();
		String cp = req.getContextPath();

		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/");
			return;
		}

		String user_id = req.getParameter("user_id");
		String user_pwd = req.getParameter("user_pwd");

		MemberDTO dto = dao.loginMember(user_id, user_pwd);
		if (dto != null) {
			// 로그인 성공 : 로그인정보를 서버에 저장
			// 세션의 유지시간을 20분설정(기본 30분)
			session.setMaxInactiveInterval(20 * 60);

			// 세션에 저장할 내용
			SessionInfo info = new SessionInfo();
			info.setUserId(dto.getUser_id());
			info.setUserName(dto.getUser_name());

			// 세션에 member이라는 이름으로 저장
			session.setAttribute("member", info);

			String preLoginURI = (String)session.getAttribute("preLoginURI");
			session.removeAttribute(preLoginURI);
			
			if(preLoginURI != null) {
				// 로그인 전페이지로
				resp.sendRedirect(cp + preLoginURI);
			} else {
				// 메인화면으로 리다이렉트
				resp.sendRedirect(cp + "/");
			}  
			
			return;
		}

		// 로그인 실패인 경우(다시 로그인 폼으로)
		String msg = "아이디 또는 패스워드가 일치하지 않습니다.";
		req.setAttribute("message", msg);

		forward(req, resp, "/WEB-INF/views/form/login.jsp");
	}

	protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그아웃
		HttpSession session = req.getSession();
		String cp = req.getContextPath();

		// 세션에 저장된 정보를 지운다.
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보를 지우고 세션을 초기화 한다.
		session.invalidate();

		// 루트로 리다이렉트
		resp.sendRedirect(cp + "/");
	}

	protected void memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 폼
		req.setAttribute("title", "회원 가입");
		req.setAttribute("mode", "member");

		forward(req, resp, "/WEB-INF/views/form/member.jsp");
	}

	protected void memberSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 처리
		MemberDAO dao = new MemberDAO();

		String cp = req.getContextPath();
		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/");
			return;
		}

		String message = "";
		try {
			MemberDTO dto = new MemberDTO();
			dto.setUser_id(req.getParameter("user_id"));
			dto.setUser_pwd(req.getParameter("user_pwd"));
			dto.setUser_name(req.getParameter("user_name"));
			
			dto.setBirth(req.getParameter("birth"));

			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			dto.setEmail(email1 + "@" + email2);

			String tel1 = req.getParameter("tel1");
			String tel2 = req.getParameter("tel2");
			String tel3 = req.getParameter("tel3");
			dto.setTel(tel1 + "-" + tel2 + "-" + tel3);

			dto.setZip(req.getParameter("zip"));
			dto.setAddr1(req.getParameter("addr1"));
			dto.setAddr2(req.getParameter("addr2"));

			dao.insertMember(dto);
			resp.sendRedirect(cp + "/");
			return;
		} catch (SQLException e) {
			if (e.getErrorCode() == 1)
				message = "아이디 중복으로 회원 가입이 실패 했습니다.";
			else if (e.getErrorCode() == 1400)
				message = "필수 사항을 입력하지 않았습니다.";
			else if (e.getErrorCode() == 1840 || e.getErrorCode() == 1861)
				message = "날짜 형식이 일치하지 않습니다.";
			else
				message = "회원 가입이 실패 했습니다.";
			// 기타 - 2291:참조키 위반, 12899:폭보다 문자열 입력 값이 큰경우
		} catch (Exception e) {
			message = "회원 가입이 실패 했습니다.";
			e.printStackTrace();
		}

		req.setAttribute("title", "회원 가입");
		req.setAttribute("mode", "member");
		req.setAttribute("message", message);
		
		forward(req, resp, "/WEB-INF/views/form/member.jsp");
	}

	protected void pwdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 패스워드 확인 폼
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String cp = req.getContextPath();
		if (info == null) {
			// 로그 아웃 상태이면
			resp.sendRedirect(cp + "/form/login.do");
			return;
		}

		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);

		forward(req, resp, "/WEB-INF/views/form/pwd.jsp");
	}

	protected void pwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 패스워드 확인
		MemberDAO dao = new MemberDAO();
		HttpSession session = req.getSession();
		
		String cp = req.getContextPath();

		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/");
			return;
		}

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			if (info == null) { // 로그아웃 된 경우
				resp.sendRedirect(cp + "/form/login.do");
				return;
			}

			// DB에서 해당 회원 정보 가져오기
			MemberDTO dto = dao.findById(info.getUserId());
			if (dto == null) {
				session.invalidate();
				resp.sendRedirect(cp + "/");
				return;
			}

			String user_pwd = req.getParameter("user_pwd");
			String mode = req.getParameter("mode");
			if ( !dto.getUser_pwd().equals(user_pwd)) {
				if (mode.equals("update")) {
					req.setAttribute("title", "회원 정보 수정");
				}

				req.setAttribute("mode", mode);
				req.setAttribute("message", "패스워드가 일치하지 않습니다.");
				forward(req, resp, "/WEB-INF/views/form/pwd.jsp");
				return;
			}

			if (mode.equals("delete")) {
				// 회원탈퇴
				dao.deleteMember(info.getUserId());

				session.removeAttribute("member");
				session.invalidate();

				resp.sendRedirect(cp + "/");
				return;
			}

			// 회원정보수정 - 회원수정폼으로 이동
			req.setAttribute("title", "회원 정보 수정");
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/form/member.jsp");
			return;

		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect(cp + "/");
	}

	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원정보 수정 완료
		MemberDAO dao = new MemberDAO();
		HttpSession session = req.getSession();

		String cp = req.getContextPath();
		if (req.getMethod().equalsIgnoreCase("GET")) {
			resp.sendRedirect(cp + "/");
			return;
		}

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			if (info == null) { // 로그아웃 된 경우
				resp.sendRedirect(cp + "/form/login.do");
				return;
			}

			MemberDTO dto = new MemberDTO();

			dto.setUser_id(req.getParameter("user_id"));
			dto.setUser_pwd(req.getParameter("user_pwd"));
			dto.setUser_name(req.getParameter("user_name"));
			dto.setBirth(req.getParameter("birth"));
			
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			dto.setEmail(email1 + "@" + email2);
			
			String tel1 = req.getParameter("tel1");
			String tel2 = req.getParameter("tel2");
			String tel3 = req.getParameter("tel3");
			dto.setTel(tel1 + "-" + tel2 + "-" + tel3);

			dto.setZip(req.getParameter("zip"));
			dto.setAddr1(req.getParameter("addr1"));
			dto.setAddr2(req.getParameter("addr2"));

			dao.updateMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect(cp + "/");
	}

	protected void userIdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	protected void shoopingForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");

			List<MemberDTO> list = dao.listshopping(info.getUserId());
			MemberDTO dto = dao.shopfindById(info.getUserId());
			MemberDTO dto2 = dao.shoptotal(info.getUserId());
			
			if (list == null) {
				session.invalidate();
				resp.sendRedirect(cp + "/");
				return;
			} 
			
			req.setAttribute("dto", dto);
			req.setAttribute("dto2", dto2);
			req.setAttribute("list", list);
			forward(req, resp, "/WEB-INF/views/form/shopping.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/");
	}
	
	protected void userdataForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원정보
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		String cp = req.getContextPath();
		
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String user_id = info.getUserId();
				
			MemberDTO dto = dao.userdata(user_id);
			
			req.setAttribute("dto", dto);
			forward(req, resp, "/WEB-INF/views/form/userinfo.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(cp + "/");  
	}
}
