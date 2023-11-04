package com.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class QnaDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 추가
	public void insertQuestion(QnaDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "INSERT INTO question(question_num, user_id, category_name, q_content, q_subject, q_reg_date) "
					+ " VALUES (question_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getCategory_name());
			pstmt.setString(3, dto.getQ_content());
			pstmt.setString(4, dto.getQ_subject());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	// 데이터 개수
		public int dataCount() {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				sql = "SELECT NVL(COUNT(*), 0) FROM question";
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					result = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return result;
		}

		// 검색에서의 데이터 개수
		public int dataCount(String kwd) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				sql = "SELECT NVL(COUNT(*), 0) "
						+ " FROM question "
						+ " WHERE INSTR(q_subject, ?) >= 1 OR INSTR(q_content, ?) >= 1 OR INSTR(ans_content, ?) >= 1 ";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, kwd);
				pstmt.setString(2, kwd);
				pstmt.setString(3, kwd);

				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					result = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return result;
		}
		
		// 게시물 리스트
		public List<QnaDTO> listQuestion(int offset, int size) {
			List<QnaDTO> list = new ArrayList<QnaDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();

			try {
				sb.append(" SELECT question_num, category_name, q.user_id, q_subject, ");
				sb.append("       TO_CHAR(q_reg_date, 'YYYY/MM/DD') q_reg_date, ans_content ");
				sb.append(" FROM question q ");
				sb.append(" JOIN user1 u1 ON q.user_id = u1.user_id ");
				sb.append(" ORDER BY question_num DESC ");
				sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, offset);
				pstmt.setInt(2, size);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					QnaDTO dto = new QnaDTO();

					dto.setQuestion_num(rs.getLong("question_num"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_reg_date(rs.getString("q_reg_date"));
					dto.setAns_content(rs.getString("ans_content"));
					
					list.add(dto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return list;
		}
		
		public List<QnaDTO> listQuestion(int offset, int size, String kwd) {
			List<QnaDTO> list = new ArrayList<QnaDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();

			try {
				sb.append(" SELECT question_num, q.user_id, category_name, q_content, q_subject, ");
				sb.append("       TO_CHAR(q_reg_date, 'YYYY/MM/DD') q_reg_date, ans_content ");
				sb.append(" FROM question q ");
				sb.append(" JOIN user1 m ON q.user_id = m.user_id ");
				sb.append(" WHERE INSTR(q_subject, ?) >= 1 OR INSTR(q_content, ?) >= 1 OR INSTR(ans_content, ?) >= 1 ");
				sb.append(" ORDER BY question_num DESC ");
				sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, kwd);
				pstmt.setString(2, kwd);
				pstmt.setString(3, kwd);
				pstmt.setInt(4, offset);
				pstmt.setInt(5, size);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					QnaDTO dto = new QnaDTO();
					
					dto.setQuestion_num(rs.getLong("question_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_reg_date(rs.getString("q_reg_date"));
					dto.setAns_content(rs.getString("ans_content"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return list;
		}

		// 해당 게시물 보기
		public QnaDTO findById(long question_num) {
			QnaDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				sql = "SELECT question_num, q.user_id, category_name, "
						+ " q_content, q_subject, q_reg_date, "
						+ " ans_content, ans_date "
						+ " FROM question q "
						+ " JOIN user1 u1 ON q.user_id=u1.user_id "
						+ " WHERE question_num = ? ";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setLong(1, question_num);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new QnaDTO();
					
					dto.setQuestion_num(rs.getLong("question_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setQ_content(rs.getString("q_content"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_reg_date(rs.getString("q_reg_date"));
					dto.setAns_date(rs.getString("ans_date"));
					dto.setAns_content(rs.getString("ans_content"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return dto;
		}

		// 이전글
		public QnaDTO findByPrev(long question_num, String kwd) {
			QnaDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();

			try {
				if (kwd != null && kwd.length() != 0) {
					sb.append(" SELECT question_num, category_name, q_subject, user_id ");
					sb.append(" FROM question ");
					sb.append(" WHERE ( question_num > ? ) ");
					sb.append("     AND ( INSTR(q_subject, ?) >= 1 OR INSTR(q_content, ?) >= 1 OR INSTR(ans_content, ?) >= 1) ");
					sb.append(" ORDER BY question_num ASC ");
					sb.append(" FETCH FIRST 1 ROWS ONLY ");

					pstmt = conn.prepareStatement(sb.toString());
					
					pstmt.setLong(1, question_num);
					pstmt.setString(2, kwd);
					pstmt.setString(3, kwd);
					pstmt.setString(4, kwd);
				} else {
					sb.append(" SELECT question_num, category_name, q_subject, user_id ");
					sb.append(" FROM question ");
					sb.append(" WHERE question_num > ? ");
					sb.append(" ORDER BY question_num ASC ");
					sb.append(" FETCH FIRST 1 ROWS ONLY ");

					pstmt = conn.prepareStatement(sb.toString());
					
					pstmt.setLong(1, question_num);
				}

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new QnaDTO();
					
					dto.setQuestion_num(rs.getLong("question_num"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setQ_subject(rs.getString("q_subject"));
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return dto;
		}

		// 다음글
		public QnaDTO findByNext(long question_num, String kwd) {
			QnaDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();

			try {
				if (kwd != null && kwd.length() != 0) {
					sb.append(" SELECT question_num, category_name, q_subject, user_id ");
					sb.append(" FROM question ");
					sb.append(" WHERE ( question_num < ? ) ");
					sb.append("     AND ( INSTR(q_subject, ?) >= 1 OR INSTR(q_content, ?) >= 1 OR INSTR(ans_content, ?) >= 1) ");
					sb.append(" ORDER BY question_num ASC ");
					sb.append(" FETCH FIRST 1 ROWS ONLY ");
					

					pstmt = conn.prepareStatement(sb.toString());
					
					pstmt.setLong(1, question_num);
					pstmt.setString(2, kwd);
					pstmt.setString(3, kwd);
					pstmt.setString(4, kwd);
				} else {
					sb.append(" SELECT question_num, category_name, q_subject, user_id ");
					sb.append(" FROM question ");
					sb.append(" WHERE question_num < ? ");
					sb.append(" ORDER BY question_num DESC ");
					sb.append(" FETCH FIRST 1 ROWS ONLY ");

					pstmt = conn.prepareStatement(sb.toString());
					
					pstmt.setLong(1, question_num);
				}

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new QnaDTO();
					dto.setQuestion_num(rs.getLong("question_num"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setQ_subject(rs.getString("q_subject"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
			}

			return dto;
		}

		// 게시물 수정
		public void updateQuestion(QnaDTO dto) throws SQLException {
			PreparedStatement pstmt = null;
			String sql;

			try {
				sql = "UPDATE question SET q_subject=?, q_content=? WHERE question_num=? AND user_id=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getQ_subject());
				pstmt.setString(2, dto.getQ_content());
				pstmt.setLong(3, dto.getQuestion_num());
				pstmt.setString(4, dto.getUser_id());
				
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			} finally {
				DBUtil.close(pstmt);
			}
		}

		public void updateAnswer(QnaDTO dto) throws SQLException {
			PreparedStatement pstmt = null;
			String sql;

			try {
				sql = "UPDATE question SET ans_content= ?, ";
				if(dto.getAns_content().length() == 0) {
					sql += " ans_date = NULL ";
				} else {
					sql += " ans_date = SYSDATE ";
				}
				sql += " WHERE question_num = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getAns_content());
				pstmt.setLong(2, dto.getQuestion_num());
				
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			} finally {
				DBUtil.close(pstmt);
			}

		}
		
		// 게시물 삭제
		public void deleteQuestion(long question_num, String user_id) throws SQLException {
			PreparedStatement pstmt = null;
			String sql;

			try {
				if (user_id.equals("admin")) {
					sql = "DELETE FROM question WHERE question_num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setLong(1, question_num);
					
					pstmt.executeUpdate();
				} else {
					sql = "DELETE FROM question WHERE question_num=? AND user_id=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setLong(1, question_num);
					pstmt.setString(2, user_id);
					
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			} finally {
				DBUtil.close(pstmt);
			}
		}
}
