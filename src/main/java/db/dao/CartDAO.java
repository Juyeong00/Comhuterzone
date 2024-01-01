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
		String sql = " SELECT cart_id, name, price * c. quantity price, c.quantity, content "
				+ " FROM goods g, cart c "
				+ " WHERE g.id = c.goods_id "
				+ " AND user_id = ? ";

		List<CartDTO> cartList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			cartList = new ArrayList<CartDTO>();

			while(rs.next()) {

				CartDTO cart = new CartDTO(rs.getInt("cart_id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("content"));
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

		String sql = " INSERT INTO cart "
				   + " VALUES(cart_seq.NEXTVAL, ?, ?, ? ) ";
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
					+ " WHERE cart_id = ? ";
		
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
