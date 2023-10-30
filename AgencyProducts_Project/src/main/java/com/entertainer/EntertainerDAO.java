package com.entertainer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.util.DBConn;
import com.util.DBUtil;

public class EntertainerDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertEnter(EntertainerDTO dto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			sql = "INSERT INTO entertainer (act_id, group_name, photo_num, img_name)"
					+ " VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAct_id());
			pstmt.setString(2, dto.getGroup_name());
			pstmt.setString(3, dto.getPhoto_num());
			pstmt.setString(4, dto.getImg_name());
			
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = null;
			
			sql = "";
			pstmt = conn.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
		}
	}
}
