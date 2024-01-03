package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.CartDTO;
import db.util.DBConnectionManager;

public class CartDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<CartDTO> findCartList(String user_id) {

		conn = DBConnectionManager.connectDB();
		String sql = " SELECT c.goods_id as goods_id, g.name as name, g.price * SUM(c.quantity) AS price, SUM(c.quantity) AS quantity, g.content as content "
				+ " FROM goods g, cart c "
				+ " WHERE g.id = c.goods_id "
				+ " AND user_id = ? "
				+ " GROUP BY c.goods_id, g.name, g.price, g.content ";

		List<CartDTO> cartList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			cartList = new ArrayList<CartDTO>();

			while(rs.next()) {

				CartDTO cart = new CartDTO(rs.getInt("goods_id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("content"));
				cartList.add(cart);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return cartList;
	}
	
	public int saveCartInfo(CartDTO cart) { //장바구니 추가

		conn = DBConnectionManager.connectDB();

		String sql = " MERGE INTO cart c "
				+ " USING (SELECT ? AS user_id, ? AS goods_id, ? AS quantity FROM dual) s "
				+ " ON (c.user_id = s.user_id AND c.goods_id = s.goods_id) "
				+ " WHEN MATCHED THEN "
				+ "    UPDATE SET c.quantity = c.quantity + s.quantity "
				+ " WHEN NOT MATCHED THEN "
				+ "    INSERT (user_id, goods_id, quantity) "
				+ "    VALUES (s.user_id, s.goods_id, s.quantity) ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, cart.getUser_id());
			psmt.setInt(2, cart.getGoods_id());
			psmt.setInt(3, cart.getQuantity());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	public int removeCartById(int id) {
		
		conn = DBConnectionManager.connectDB();

		String sql =  " DELETE FROM cart " 
					+ " WHERE goods_id = ? ";
		
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
	
	
	
	
}
