package com.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class FaqDAO {
	private Connection conn = DBConn.getConnection();
	
	// 데이터 추가
	public void insertFaq(FaqDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO faq(faq_num, faq_case, faq_subject, faq_content) "
					+ " VALUES (faq_seq.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getFaq_case());
			pstmt.setString(2, dto.getFaq_subject());
			pstmt.setString(3, dto.getFaq_content());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	/*
	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM qna";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
	}
	*/
	
	// faq 리스트
	public List<FaqDTO> listFaq() {
		List<FaqDTO> list = new ArrayList<FaqDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT faq_num, faq_case, faq_subject, faq_content "
					+ " FROM faq "
					+ " ORDER BY faq_num DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqDTO dto = new FaqDTO();
				
				dto.setFaq_num(rs.getLong("faq_num"));
				dto.setFaq_case(rs.getString("faq_case"));
				dto.setFaq_subject(rs.getString("faq_subject"));
				dto.setFaq_content(rs.getString("faq_content"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return list;
	}
	
	public FaqDTO findById(long faq_num) {
		FaqDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT faq_num, faq_case, faq_subject, faq_content "
					+ " FROM faq "
					+ " WHERE faq_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, faq_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new FaqDTO();
				
				dto.setFaq_num(rs.getLong("faq_num"));
				dto.setFaq_case(rs.getString("faq_case"));
				dto.setFaq_subject(rs.getString("faq_subject"));
				dto.setFaq_content(rs.getString("faq_content"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	// faq 수정
	public void updateFaq(FaqDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE faq SET faq_case = ?, faq_subject = ?, faq_content = ? "
					+ " WHERE faq_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getFaq_case());
			pstmt.setString(2, dto.getFaq_subject());
			pstmt.setString(3, dto.getFaq_content());
			pstmt.setLong(4, dto.getFaq_num());
			
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
	// 게시물 삭제
	public void deleteFaq(long faq_num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM faq WHERE faq_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, faq_num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
}
