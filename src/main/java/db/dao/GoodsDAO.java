package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		String sql = " SELECT id, name, price "
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

				GoodsDTO desktop = new GoodsDTO(rs.getInt("id"), rs.getString("name"), rs.getInt("price"));
				deskList.add(desktop);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return deskList;
	}

	public GoodsDTO findDeskById(int caid) {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT ca_name "
				+ "FROM category c "
				+ "WHERE ca_id = ? ";

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
				+ "FROM goods "
				+ "WHERE id = ? ";

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

		String sql = " SELECT * "
				+ "FROM goods "
				+ "WHERE id = ? ";

		GoodsDTO desk = null;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, caid);
			rs = psmt.executeQuery(); 
			if(rs.next()) {
			
				desk = new GoodsDTO(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return desk;

	}

	public int saveGoodsInfo(GoodsDTO goodsInfo) { //등록날짜를 직접 입력하는 명령어

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO goods "
				+ " VALUES( ?, ?, ?, ?, ?, ?, ? ) ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, goodsInfo.getId());
			psmt.setString(2, goodsInfo.getName());
			psmt.setInt(3, goodsInfo.getPrice());
			psmt.setInt(4, goodsInfo.getQuantity());
			psmt.setString(5, goodsInfo.getContent());
			psmt.setTimestamp(6, MyConvertDateUtil.convertLocalDateTimeToTimestamp(goodsInfo.getRegist_date()));
			psmt.setInt(7, goodsInfo.getCa_id());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	public int saveGoodsInfo2(GoodsDTO goodsInfo) { //등록날짜를 default로 지정하는 경우

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO goods (id, name, price, quantity, content, ca_id) "
				+ " VALUES( ?, ?, ?, ?, ?, ? ) ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, goodsInfo.getId());
			psmt.setString(2, goodsInfo.getName());
			psmt.setInt(3, goodsInfo.getPrice());
			psmt.setInt(4, goodsInfo.getQuantity());
			psmt.setString(5, goodsInfo.getContent());
			psmt.setInt(6, goodsInfo.getCa_id());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	public int modifyGoodsInfo(GoodsDTO goodsInfo) {
		
		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE goods "
				   + " SET quantity = ? "
				   + " WHERE id = ? ";
		int result = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, goodsInfo.getQuantity());
			psmt.setInt(2, goodsInfo.getId());
			
			result = psmt.executeUpdate(); //1 , 0
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
	
		return result;
	}


}
