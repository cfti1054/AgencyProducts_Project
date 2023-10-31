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
			sql = "INSERT INTO entertainer (act_id, group_name, img_name)"
					+ " VALUES (?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAct_id());
			pstmt.setString(2, dto.getGroup_name());
			pstmt.setString(3, dto.getImg_name());
			System.out.println(":" + dto.getAct_id());
			System.out.println(":" + dto.getGroup_name());
			System.out.println(":" + dto.getImg_name());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
		}
	}
}
