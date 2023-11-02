package com.entertainer;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class EntertainerDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertGroup(EntertainerDTO dto) throws SQLException{
		
		// entertainer table
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "INSERT INTO entertainer (act_id, group_name, img_name)"
					+ " VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAct_id());
			pstmt.setString(2, dto.getGroup_name());
			pstmt.setString(3, dto.getImg_name());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
			
		}
	}
	
	public void insertEnterDetail(EntertainerDTO dto) throws SQLException{
		// enter_detail table
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO enter_detail (enter_id, enter_name, enter_birth, debut_date, job_num, act_id, stage_name)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEnter_id());
			pstmt.setString(2, dto.getEnter_name());
			pstmt.setString(3, dto.getEnter_birth());
			pstmt.setString(4, dto.getDebut_date());
			pstmt.setString(5, dto.getJob_num());
			pstmt.setString(6, dto.getAct_id());
			pstmt.setString(7, dto.getStage_name());
			
			pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	public List<EntertainerDTO> listArtist(){
		List<EntertainerDTO> list = new ArrayList<EntertainerDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT DISTINCT e1.act_id, group_name, img_name "
					+ " FROM entertainer e1 ";
					
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EntertainerDTO dto = new EntertainerDTO();
				
				dto.setAct_id(rs.getString("act_id"));
				dto.setGroup_name(rs.getString("group_name"));
				dto.setImg_name(rs.getString("img_name"));
				
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
	
	public List<EntertainerDTO> listActor(){
		List<EntertainerDTO> list = new ArrayList<EntertainerDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT DISTINCT e1.act_id, group_name, img_name "
					+ " FROM entertainer e1 "
					+ " JOIN enter_detail e2 "
					+ " ON e1.act_id = e2.act_id "
					+ " WHERE job_num = '2'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EntertainerDTO dto = new EntertainerDTO();
				
				dto.setAct_id(rs.getString("act_id"));
				dto.setGroup_name(rs.getString("group_name"));
				dto.setImg_name(rs.getString("img_name"));
				
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
	
	public List<EntertainerDTO> listSinger(){
		List<EntertainerDTO> list = new ArrayList<EntertainerDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT DISTINCT e1.act_id, group_name, img_name "
					+ " FROM entertainer e1 "
					+ " JOIN enter_detail e2 "
					+ " ON e1.act_id = e2.act_id "
					+ " WHERE job_num = '1'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EntertainerDTO dto = new EntertainerDTO();
				
				dto.setAct_id(rs.getString("act_id"));
				dto.setGroup_name(rs.getString("group_name"));
				dto.setImg_name(rs.getString("img_name"));
				
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
	
	
	public EntertainerDTO findById(String act_id) {
		EntertainerDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT act_id, group_name, img_name "
					+ "FROM entertainer "
					+ "WHERE act_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, act_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new EntertainerDTO();
				
				dto.setAct_id(rs.getString("act_id"));
				dto.setGroup_name(rs.getString("group_name"));
				dto.setImg_name(rs.getString("img_name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return dto;
	}
	
	public void updateGroup(EntertainerDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE entertainer SET group_name=?,  img_name = ? "
					+ " WHERE act_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getGroup_name());
			pstmt.setString(2, dto.getImg_name());
			pstmt.setString(3, dto.getAct_id());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void deleteGroup(String act_id) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM entertainer WHERE act_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, act_id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void insertAction(EntertainerDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO enter_action(ac_list_num, action_num, action_content, start_date, end_date, act_id) "
					+ " VALUES(enter_action_seq.NEXTVAL, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAction_num());
			pstmt.setString(2, dto.getAction_content());
			pstmt.setString(3, dto.getStart_date());
			pstmt.setString(4, dto.getEnd_date());
			pstmt.setString(5, dto.getAct_id());
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void updateAction(EntertainerDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE enter_action SET action_num = ?, action_content = ?, start_date = ?, end_date = ? WHERE ac_list_num = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAction_num());
			pstmt.setString(2, dto.getAction_content());
			pstmt.setString(3, dto.getStart_date());
			pstmt.setString(4, dto.getEnd_date());
			pstmt.setLong(5, dto.getAc_list_num());
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void deleteAction(long ac_list_num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM enter_action WHERE ac_list_num = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, ac_list_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public EntertainerDTO findByActionListNum(long ac_list_num) throws SQLException {
		EntertainerDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT ac_list_num, action_num, action_content, start_date, end_date, act_id FROM enter_action WHERE ac_list_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, ac_list_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new EntertainerDTO();
				
				dto.setAc_list_num(rs.getLong("ac_list_num"));
				dto.setAction_num(rs.getString("action_num"));
				dto.setAction_content(rs.getString("action_content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return dto;
	}
}
