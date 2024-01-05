package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import db.dto.GoodsDTO;
import db.dto.TotalOrderDTO;
import db.util.DBConnectionManager;
import db.util.MyConvertDateUtil;

public class TotalOrderDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	// 주문 목록 조회
	public TotalOrderDTO findTotalOrderList(String name, int amount) {
		
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT order_id, order_date, "
				+ " user_name, user_id, delivery_request, phone_num, member_add1,  member_add2, "
				+ " member_add3, payment_card, total_amount, processing  FROM total_order "
				+ " WHERE user_id = ? AND total_amount = ? ";
		
		TotalOrderDTO totalOrder = null;

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, name);
			psmt.setInt(2, amount);
			rs = psmt.executeQuery();
			

			if(rs.next()) {
				totalOrder = new TotalOrderDTO(
						rs.getInt("order_id"),
						rs.getString("order_date"),
						rs.getString("user_name"),
						rs.getString("user_id"),
						rs.getString("delivery_request"),
						rs.getString("phone_num"),
						rs.getInt("member_add1"),
						rs.getString("member_add2"),
						rs.getString("member_add3"),
						rs.getString("payment_card"),
						rs.getInt("total_amount"),
						rs.getString("processing")
						);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return totalOrder;
	}

	// 새로운 주문 저장
	public int saveTotalOrder(String user_name, String userId, String deliveryRequest, String phoneNum,
			int memberAdd1, String memberAdd2, String memberAdd3, String paymentCard, int totalAmount) {
		conn = DBConnectionManager.connectDB();
		
		String sql = "INSERT INTO total_order " +
				"(order_date, order_id, user_name, user_id, delivery_request, phone_num, " +
				"member_add1, member_add2, member_add3, payment_card, total_amount, processing) " +
				"VALUES (SYSDATE , order_id_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, '주문완료')";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_name);
			psmt.setString(2, userId);
			psmt.setString(3, deliveryRequest);
			psmt.setString(4, phoneNum);
			psmt.setInt(5, memberAdd1);
			psmt.setString(6, memberAdd2);
			psmt.setString(7, memberAdd3);
			psmt.setString(8, paymentCard);
			psmt.setInt(9, totalAmount);

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	public int modifyState(String state, int orderId) { //제품 수정 sql

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE total_order "
				   + " SET processing = ? "
				   + " WHERE order_id = ? ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, state);
			psmt.setInt(2, orderId);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}


}