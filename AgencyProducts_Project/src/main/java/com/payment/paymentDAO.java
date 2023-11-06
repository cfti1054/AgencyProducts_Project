package com.payment;

import java.sql.Connection;   
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class paymentDAO {
	private Connection conn = DBConn.getConnection();
	
	public List<paymentDTO> listpayment(String user_id) {
		List<paymentDTO> list = new ArrayList<paymentDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT a.payment_id, order_count,"
					+ " goods_name, "
					+ " to_char(pd.goods_price, '999,999,999,999,999,999,999') goods_price, "
					+ " to_char(b.goods_price*order_count, '999,999,999,999,999,999,999') total_price, "
					+ " to_char(payment_date, 'YYYY-MM-DD') payment_date"
					+ " from payment a "
					+ " join payment_detail pd on a.payment_id = pd.payment_id "
					+ " join goods b on pd.goods_id = b.goods_id "
					+ " where a.user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				paymentDTO dto = new paymentDTO();
				
				dto.setPayment_id(rs.getString("payment_id"));
				dto.setOrder_count(rs.getLong("order_count"));
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setTotal_price(rs.getString("goods_price"));
				dto.setPayment_date(rs.getString("payment_date"));
				dto.setTotal_price(rs.getString("total_price"));
				
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
}
