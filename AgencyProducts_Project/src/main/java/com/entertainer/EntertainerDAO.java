package com.entertainer;

import java.sql.CallableStatement;
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
	
//-----------------------------------------------------------------------------------------------------------

	public void insertEnterDetail(EntertainerDTO dto) throws SQLException{
		// 연예인 상세정보 등록
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
	
	
	public List<EntertainerDTO> detailList(String act_id) throws SQLException{
		// 연예인 상세정보 확인
		List<EntertainerDTO> list = new ArrayList<EntertainerDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			
			sql = "select enter_id, enter_name, to_char(enter_birth, 'YYYY/MM/DD') enter_birth, "
					+ " to_char(debut_date , 'YYYY/MM/DD') debut_date, a.img_name, job_num, a.act_id, stage_name"
					+ " from entertainer a, enter_detail b"
					+ " where a.act_id = b.act_id "
					+ " and a.act_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, act_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EntertainerDTO dto = new EntertainerDTO();
				
				dto.setEnter_id(rs.getString("enter_id"));
				dto.setEnter_name(rs.getString("enter_name"));
				dto.setEnter_birth(rs.getString("enter_birth"));
				dto.setDebut_date(rs.getString("debut_date"));
				dto.setImg_name(rs.getString("img_name"));
				dto.setJob_num(rs.getString("job_num"));
				dto.setAct_id(rs.getString("act_id"));
				dto.setStage_name(rs.getString("stage_name"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return list;
}
	
	public void updatedetail(EntertainerDTO dto) throws SQLException {
		// 연예인 상세정보 수정 
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "update enter_detail set enter_name = ?,"
					+ "	enter_birth = to_date( ?, 'YYYY/MM/DD'),"
					+ " debut_date = to_date( ?, 'YYYY/MM/DD'),"
					+ " job_num = ?, act_id =?, stage_name = ?"
					+ " where enter_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEnter_name());
			pstmt.setString(2, dto.getEnter_birth());
			pstmt.setString(3, dto.getDebut_date());
			pstmt.setString(4, dto.getJob_num());
			pstmt.setString(5, dto.getAct_id());
			pstmt.setString(6, dto.getStage_name());
			
			pstmt.setString(7, dto.getEnter_id());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public EntertainerDTO deleteFindBy(String enter_id) {
		// 삭제용
		EntertainerDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		try {
			sql = "select enter_id, enter_name, to_char(enter_birth, 'YYYY/MM/DD') enter_birth, "
					+ " to_char(debut_date , 'YYYY/MM/DD') debut_date, a.img_name, job_num, a.act_id, stage_name"
					+ " from entertainer a, enter_detail b"
					+ " where a.act_id = b.act_id "
					+ " and enter_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, enter_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new EntertainerDTO();
				
				dto.setEnter_id(rs.getString("enter_id"));
				dto.setEnter_name(rs.getString("enter_name"));
				dto.setEnter_birth(rs.getString("enter_birth"));
				dto.setDebut_date(rs.getString("debut_date"));
				dto.setImg_name(rs.getString("img_name"));
				dto.setJob_num(rs.getString("job_num"));
				dto.setAct_id(rs.getString("act_id"));
				dto.setStage_name(rs.getString("stage_name"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	public void deletedetail(String enter_id) throws SQLException {
		// 연예인 삭제
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = " delete from enter_detail where enter_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, enter_id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
//-----------------------------------------------------------------------------------------------------------
	
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
		CallableStatement cstmt = null;
		String sql;
		
		try {
			sql = "{CALL deleteEnter(?)}";
			
			cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, act_id);
			
			cstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(cstmt);
		}
	}

	///////////////////////////////////////////////////////////////////////////////////
	
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
			sql = "UPDATE enter_action SET action_num = ?, action_content = ?, start_date = ?, end_date = ?"
					+ "  WHERE ac_list_num = ? ";
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
			sql = "SELECT ac_list_num, action_num, action_content,"
					+ " to_char(start_date, 'YYYY/MM/DD') start_date, to_char(end_date, 'YYYY/MM/DD') end_date, act_id"
					+ " FROM enter_action WHERE ac_list_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, ac_list_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new EntertainerDTO();
				
				dto.setAc_list_num(rs.getLong("ac_list_num"));
				dto.setAction_num(rs.getString("action_num"));
				dto.setAction_content(rs.getString("action_content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setAct_id(rs.getString("act_id"));
				
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
	
	public List<EntertainerDTO> ActionList(String act_id) throws SQLException{
		List<EntertainerDTO> list = new ArrayList<EntertainerDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT ac_list_num, action_content, TO_CHAR(start_date, 'YYYY/MM/DD') start_date , "
					+ " TO_CHAR(end_date, 'YYYY/MM/DD') end_date, act_id "
					+ " FROM enter_action "
					+ " WHERE act_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, act_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EntertainerDTO dto = new EntertainerDTO();
				
				dto.setAc_list_num(rs.getLong("ac_list_num"));
				dto.setAction_content(rs.getString("action_content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setAct_id(rs.getString("act_id"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return list;
	}
}
