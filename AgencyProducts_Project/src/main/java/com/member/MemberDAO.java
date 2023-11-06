package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class MemberDAO {
	private Connection conn = DBConn.getConnection();
	
	public MemberDTO loginMember(String userId, String userPwd) {
		// 로그인
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = " SELECT user_id, user_name, user_pwd"
					+ " FROM user1"
					+ " WHERE enabled = 1 and user_id = ? and user_pwd = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}	

	public void insertMember(MemberDTO dto) throws SQLException {
		// 회원가입
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql = "INSERT INTO user1(user_id, user_name, user_pwd, enabled) VALUES (?, ?, ?, 1)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_name());
			pstmt.setString(3, dto.getUser_pwd());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = null;
			
			sql = "INSERT INTO user2(user_id, birth, zip, addr1, addr2, tel, email, reg_date)"
					+ " VALUES (?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?, ?, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBirth());
			pstmt.setString(3, dto.getZip());
			pstmt.setString(4, dto.getAddr1());
			pstmt.setString(5, dto.getAddr2());
			
			
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, dto.getEmail());
			
			pstmt.executeUpdate();
			
			conn.commit();

		} catch (SQLException e) {
			DBUtil.rollback(conn);
			
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e2) {
			}
		}
		
	}

	public MemberDTO findById(String user_id) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT u1.user_id, user_name, user_pwd,");
			sb.append("      enabled, TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
			sb.append("      TO_CHAR(birth, 'YYYY-MM-DD') birth, ");
			sb.append("      email, tel,");
			sb.append("      zip, addr1, addr2");
			sb.append("  FROM user1 u1");
			sb.append("  LEFT OUTER JOIN user2 u2 ON u1.user_id=u2.user_id ");
			sb.append("  WHERE u1.user_id = ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setEnabled(rs.getInt("enabled"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				if(dto.getTel() != null) {
					String[] ss = dto.getTel().split("-");
					if(ss.length == 3) {
						dto.setTel1(ss[0]);
						dto.setTel2(ss[1]);
						dto.setTel3(ss[2]);
					}
				}
				dto.setEmail(rs.getString("email"));
				if(dto.getEmail() != null) {
					String[] ss = dto.getEmail().split("@");
					if(ss.length == 2) {
						dto.setEmail1(ss[0]);
						dto.setEmail2(ss[1]);
					}
				}
				dto.setZip(rs.getString("zip"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}	
	
	public void updateMember(MemberDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE user1 SET user_pwd=? WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_pwd());
			pstmt.setString(2, dto.getUser_id());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = null;
			
			sql = "UPDATE user2 SET birth=TO_DATE(?,'YYYY-MM-DD'), email=?, tel=?, zip=?, addr1=?, addr2=? WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBirth());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getZip());
			pstmt.setString(5, dto.getAddr1());
			pstmt.setString(6, dto.getAddr2());
			pstmt.setString(7, dto.getUser_id());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

	}
	
	public void deleteMember(String user_id) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE user1 SET enabled=0 WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = null;
			
			sql = "DELETE FROM user2 WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}

	}
	
	public MemberDTO shopfindById (String user_id) {
		// 장바구니 조회
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select goods_name, order_count, to_char(goods_price, '999,999,999,999,999,999,999') goods_price,"
					+ " to_char(goods_price* order_count, '999,999,999,999,999,999,999') total_price"
					+ " from shopping a, goods b"
					+ " where a.goods_id = b.goods_id and a.user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setOrder_count(rs.getLong("order_count"));
				dto.setGoods_price(rs.getString("goods_price"));
				dto.setTotal_price(rs.getString("total_price"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return dto;
	}
	
	public List<MemberDTO> listshopping(String user_id) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select goods_name, order_count, to_char(goods_price, '999,999,999,999,999,999,999') goods_price,"
					+ " to_char(goods_price* order_count, '999,999,999,999,999,999,999') total_price"
					+ " from shopping a, goods b"
					+ " where a.goods_id = b.goods_id and a.user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setOrder_count(rs.getLong("order_count"));
				dto.setGoods_price(rs.getString("goods_price"));
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
	
	public MemberDTO shoptotal(String user_id) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select to_char(sum(total_price) + 2500, '999,999,999,999,999,999,999') total from"
					+ " (select goods_name, order_count,"
					+ "	goods_price* order_count total_price"
					+ "	from shopping a, goods b"
					+ "	where a.goods_id = b.goods_id and a.user_id = ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setTotal(rs.getString("total"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return dto;
	}
	
	public MemberDTO userdata(String user_id) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT u1.user_id, user_name,");
			sb.append("      TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
			sb.append("      TO_CHAR(birth, 'YYYY-MM-DD') birth, ");
			sb.append("      email, tel,");
			sb.append("      zip, addr1, addr2");
			sb.append("  FROM user1 u1");
			sb.append("  LEFT OUTER JOIN user2 u2 ON u1.user_id=u2.user_id ");
			sb.append("  WHERE u1.user_id = ? and enabled = 1");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				if(dto.getTel() != null) {
					String[] ss = dto.getTel().split("-");
					if(ss.length == 3) {
						dto.setTel1(ss[0]);
						dto.setTel2(ss[1]);
						dto.setTel3(ss[2]);
					}
				}
				dto.setEmail(rs.getString("email"));
				if(dto.getEmail() != null) {
					String[] ss = dto.getEmail().split("@");
					if(ss.length == 2) {
						dto.setEmail1(ss[0]);
						dto.setEmail2(ss[1]);
					}
				}
				dto.setZip(rs.getString("zip"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}	
}
