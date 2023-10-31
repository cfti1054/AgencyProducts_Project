package com.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;
import com.util.DBUtil;

public class GoodsDAO {
	private Connection conn = DBConn.getConnection();

	// 데이터 추가
	public void insertGoods(GoodsDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			conn.setAutoCommit(false);

			sql = "INSERT INTO goods(goods_id, goods_name, goods_price, "
					+ " act_id, goods_count, reg_date, goods_acc) " 
					+ " VALUES (?, ?, ?, ?, ?, SYSDATE, ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getGoods_id());
			pstmt.setString(2, dto.getGoods_name());
			pstmt.setInt(3, dto.getGoods_price());
			pstmt.setString(4, dto.getAct_id());
			pstmt.setInt(5, dto.getGoods_count());
			pstmt.setString(6, dto.getGoods_acc());

			pstmt.executeUpdate();

			pstmt.close();

			if (dto.getImg_names() != null) {
				sql = "INSERT INTO goods_photo(photo_num, goods_id, img_name) "
						+ " VALUES(goods_photo_seq.NEXTVAL, ?, ?)";

				pstmt = conn.prepareStatement(sql);

				for (int i = 0; i < dto.getImg_names().length; i++) {
					pstmt.setString(1, dto.getGoods_id());
					pstmt.setString(2, dto.getImg_names()[i]);

					pstmt.executeUpdate();
				}
			}

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

	// 연애인 목록
	public List<GoodsDTO> listEntertainer() {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			sql = " SELECT act_id, group_name " + " FROM entertainer ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsDTO dto = new GoodsDTO();

				dto.setAct_id(rs.getString("act_id"));
				dto.setGroup_name(rs.getString("group_name"));

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

	// 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT COUNT(*) FROM goods";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return result;
	}

	// 검색에서의 데이터 개수
	public int dataCount(String schType, String kwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT COUNT(*) " 
					+ " FROM goods g ";
			if (schType.equals("all")) {
				sql += " WHERE INSTR(goods_name, ?) >= 1 OR INSTR(goods_acc, ?) >= 1 ";
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sql += " WHERE TO_CHAR(req_date, 'YYYYMMDD') = ? ";
			} else {
				sql += " WHERE INSTR(" + schType + ", ?) >= 1 ";
			}

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, kwd);
			if (schType.equals("all")) {
				pstmt.setString(2, kwd);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return result;
	}

	// 리스트
	public List<GoodsDTO> listGoods(int offset, int size) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			sql = " SELECT g.goods_id, g.goods_name, goods_price, " 
					+ " TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, "
					+ " goods_acc, img_name, photo_num " 
					+ " FROM goods g "
					+ " LEFT OUTER JOIN ( "
					+ " 	SELECT photo_num, goods_id, img_name FROM ( "
					+ " 		SELECT photo_num, goods_id, img_name, "
					+ " 			ROW_NUMBER() OVER(PARTITION BY goods_id ORDER BY img_name ASC) rank "
					+ " 		FROM goods_photo "
					+ "		) WHERE rank = 1 "
					+ " ) i ON g.goods_id = i.goods_id "
					+ " ORDER BY reg_date DESC "
					+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsDTO dto = new GoodsDTO();

				dto.setGoods_id(rs.getString("goods_id"));
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setGoods_price(rs.getInt("goods_price"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setGoods_acc(rs.getString("goods_acc"));
				dto.setImg_name(rs.getString("img_name"));
				dto.setPhoto_num(rs.getLong("photo_num"));

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

	public List<GoodsDTO> listGoods(int offset, int size, String schType, String kwd) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append(" SELECT goods_id, goods_name, goods_price, ");
			sb.append(" TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
			sb.append(" goods_acc, img_name ");
			sb.append(" FROM goods g ");
			sb.append(" JOIN goods_photo p ON g.goods_id = p.goods_id ");
			if (schType.equals("all")) {
				sb.append(" WHERE INSTR(goods_name, ?) >= 1 OR INSTR(goods_acc, ?) >= 1 ");
			} else if (schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sb.append(" WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ?");
			}
			sb.append(" ORDER BY goods_id ASC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");

			pstmt = conn.prepareStatement(sb.toString());

			if (schType.equals("all")) {
				pstmt.setString(1, kwd);
				pstmt.setString(2, kwd);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, size);
			} else {
				pstmt.setString(1, kwd);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, size);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GoodsDTO dto = new GoodsDTO();

				dto.setGoods_id(rs.getString("goods_id"));
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setGoods_price(rs.getInt("goods_price"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setGoods_acc(rs.getString("goods_acc"));
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

	// 해당 게시물 보기
	public GoodsDTO findById(long photo_num) {
		GoodsDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = " SELECT g.goods_id, goods_name, goods_price, act_id, " 
					+ " goods_count, reg_date, goods_acc, "
					+ " photo_num, img_name " 
					+ " FROM goods g " 
					+ " JOIN goods_photo p ON g.goods_id = p.goods_id "
					+ " WHERE photo_num = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setLong(1, photo_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new GoodsDTO();

				dto.setGoods_id(rs.getString("goods_id"));
				dto.setGoods_name(rs.getString("goods_name"));
				dto.setGoods_price(rs.getInt("goods_price"));
				dto.setAct_id(rs.getString("act_id"));
				dto.setGoods_count(rs.getInt("goods_count"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setGoods_acc(rs.getString("goods_acc"));
				dto.setPhoto_num(rs.getLong("photo_num"));
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

	// 게시물 수정
	public void updateGoods(GoodsDTO dto, long photo_num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE goods_photo p " + " RIGHT JOIN goods g ON (p.goods_id = g.goods_id) "
					+ " SET p.img_name = ?, g.goods_name = ?, g.goods_price = ?, g.act_id = ?, "
					+ " g.goods_count = ?, g.goods_acc = ? " + " WHERE goods_photo.photo_num = ? ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getImg_name());
			pstmt.setString(2, dto.getGoods_name());
			pstmt.setInt(3, dto.getGoods_price());
			pstmt.setString(4, dto.getAct_id());
			pstmt.setInt(5, dto.getGoods_count());
			pstmt.setString(6, dto.getGoods_acc());
			pstmt.setLong(7, photo_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

	// 게시물 삭제
	public void deleteGoods(String goodsId) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			conn.setAutoCommit(false);

			sql = "DELETE FROM goods_photo WHERE goods_id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, goodsId);

			pstmt.executeUpdate();

			pstmt.close();
			pstmt = null;

			sql = "DELETE FROM goods WHERE goods_id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, goodsId);

			pstmt.executeUpdate();

		} catch (Exception e) {
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
}
