package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import db.dto.GoodsDTO;
import db.util.DBConnectionManager;
import db.util.MyConvertDateUtil;

public class GoodsDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<GoodsDTO> findDesktopList(int caid) {

		conn = DBConnectionManager.connectDB();
		String sql = " SELECT * "
				+ "	FROM goods g, category c "
				+ "	WHERE g.ca_id IN (SELECT ca_id "
				+ "				      FROM category "
				+ "			              WHERE CONNECT_BY_ISLEAF = 1 "
				+ "		             START WITH ca_id = ? "
				+ "	                CONNECT BY PRIOR ca_id = ca_ref) "
				+ " AND g.ca_id = c.ca_id "
				+ " ORDER BY id ";

		List<GoodsDTO> deskList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, caid);
			rs = psmt.executeQuery();

			deskList = new ArrayList<GoodsDTO>();

			while(rs.next()) {

				GoodsDTO desktop = new GoodsDTO(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"));
				deskList.add(desktop);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return deskList;
	}

	public GoodsDTO findCategoryById(int caid) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT ca_name "
				   + " FROM category c "
				   + " WHERE ca_id = ? ";

		GoodsDTO desk = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, caid);
			rs = psmt.executeQuery();

			if(rs.next()) {

				desk = new GoodsDTO(rs.getString("ca_name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return desk;

	}

	public GoodsDTO findDeskDetailById(int caid) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT id, name, content, price "
				   + " FROM goods "
				   + " WHERE id = ? ";

		GoodsDTO desk = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, caid);
			rs = psmt.executeQuery();

			if(rs.next()) {

				desk = new GoodsDTO(rs.getInt("id"), rs.getString("name"), rs.getString("content"), rs.getInt("price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return desk;

	}

	public GoodsDTO findDeskDetailById2(int caid) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT id, name, price, content, quantity "
				   + " FROM goods "
				   + " WHERE id = ? ";

		GoodsDTO desk = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, caid);
			rs = psmt.executeQuery(); 
			if(rs.next()) {

				desk = new GoodsDTO(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("content"), rs.getInt("quantity"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return desk;

	}

	public List<GoodsDTO> findGoodsList() { //모든 제품을 출력해주는 sql

		conn = DBConnectionManager.connectDB();
		String sql = " SELECT * FROM goods ORDER BY id DESC ";

		List<GoodsDTO> goodsList = null;

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			goodsList = new ArrayList<GoodsDTO>();

			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int quantity = rs.getInt("quantity");
				String content = rs.getString("content");
				LocalDateTime regist_date
				= MyConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("regist_date"));
				int ca_id = rs.getInt("ca_id");

				GoodsDTO goods = new GoodsDTO(id, name, price, quantity, content, regist_date, ca_id);
				goodsList.add(goods);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return goodsList;
	}

	public int modifyGoodsInfo(GoodsDTO goodsInfo) { //제품 수정 sql

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE goods "
				   + " SET name = ? , price= ?, quantity= ?, content= ?, "
				   + " regist_date= SYSDATE, ca_id= ? "
				   + " WHERE id = ? ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, goodsInfo.getName());
			psmt.setInt(2, goodsInfo.getPrice());
			psmt.setInt(3, goodsInfo.getQuantity());
			psmt.setString(4, goodsInfo.getContent());
			psmt.setInt(5, goodsInfo.getCa_id());
			psmt.setInt(6, goodsInfo.getId());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}


		return result;
	}

	public GoodsDTO findGoodsById(int caid) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM goods "
				   + " WHERE id = ? ";

		GoodsDTO gooods = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, caid);
			rs = psmt.executeQuery();

			if(rs.next()) {

				gooods = new GoodsDTO(rs.getInt("id"),
						rs.getString("name"),
						rs.getInt("price"),
						rs.getInt("quantity"),
						rs.getString("content"),
						MyConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("regist_date")),
						rs.getInt("ca_id"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return gooods;

	}

	public int removeGoodsById(int id) {

		conn = DBConnectionManager.connectDB();

		String sql =  " DELETE FROM goods " 
				   	+ " WHERE id = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	public int saveGoodsInfo(GoodsDTO goodsInfo) {

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO goods "
				+ " VALUES(goods_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?) ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, goodsInfo.getName());
			psmt.setInt(2, goodsInfo.getPrice());
			psmt.setInt(3, goodsInfo.getQuantity());
			psmt.setString(4, goodsInfo.getContent());
			psmt.setInt(5, goodsInfo.getCa_id());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	public int modifyGoodsQuantity(int quantity, int id) { //제품 수정 sql

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE goods "
				   + " SET quantity = quantity - ? "
				   + " WHERE id = ? ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, quantity);
			psmt.setInt(2, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}


		return result;
	}
	
	public List<GoodsDTO> findGoodsListByName(String namein) { //모든 제품을 출력해주는 sql

		conn = DBConnectionManager.connectDB();
		String sql = " SELECT * FROM goods WHERE LOWER(name) LIKE LOWER(?) ORDER BY id DESC ";

		List<GoodsDTO> goodsList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + namein + "%");
			rs = psmt.executeQuery();

			goodsList = new ArrayList<GoodsDTO>();

			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int quantity = rs.getInt("quantity");
				String content = rs.getString("content");
				LocalDateTime regist_date
				= MyConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("regist_date"));
				int ca_id = rs.getInt("ca_id");

				GoodsDTO goods = new GoodsDTO(id, name, price, quantity, content, regist_date, ca_id);
				goodsList.add(goods);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return goodsList;
	}

}
