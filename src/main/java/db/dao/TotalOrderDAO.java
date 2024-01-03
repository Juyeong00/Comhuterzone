package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.TotalOrderDTO;
import db.util.DBConnectionManager;

public class TotalOrderDAO {

    Connection conn;
    PreparedStatement psmt;
    ResultSet rs;

    // 주문 목록 조회
    // public List<TotalOrderDTO> findTotalOrderList() {
    //     conn = DBConnectionManager.connectDB();
    //     String sql = "SELECT * FROM total_order";
    //     List<TotalOrderDTO> totalOrderList = null;

    //     try {
    //         psmt = conn.prepareStatement(sql);
    //         rs = psmt.executeQuery();
    //         totalOrderList = new ArrayList<TotalOrderDTO>();

    //         while (rs.next()) {
    //             TotalOrderDTO totalOrderDTO = new TotalOrderDTO(
    //                     rs.getString("orderDate"),
    //                     rs.getInt("orderId"),
    //                     rs.getString("userName"),
    //                     rs.getString("userId"),
    //                     rs.getString("deliveryRequest"),
    //                     rs.getString("phoneNum"),
    //                     rs.getInt("memberAdd1"),
    //                     rs.getString("memberAdd2"),
    //                     rs.getString("memberAdd3"),
    //                     rs.getString("paymentCard"),
    //                     rs.getInt("totalAmount")
    //             );

    //             totalOrderList.add(totalOrderDTO);
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     } finally {
    //         DBConnectionManager.closeDB(conn, psmt, rs);
    //     }

    //     return totalOrderList;
    // }

    // 새로운 주문 저장
    public int saveTotalOrder(String user_name, String userId, String phoneNum,
            int memberAdd1, String memberAdd2, String memberAdd3, String paymentCard, int totalAmount) {
        conn = DBConnectionManager.connectDB();

        String sql = "INSERT INTO total_order " +
        	            "(order_date, order_id, user_name, user_id, phone_num, " +
        	            "member_add1, member_add2, member_add3, payment_card, total_amount) " +
        			"VALUES (SYSDATE, order_id_sq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";

        int result = 0;

        try {
            psmt = conn.prepareStatement(sql);

            psmt.setString(1, user_name);
            psmt.setString(2, userId);
            psmt.setString(3, phoneNum);
            psmt.setInt(4, memberAdd1);
            psmt.setString(5, memberAdd2);
            psmt.setString(6, memberAdd3);
            psmt.setString(7, paymentCard);
            psmt.setInt(8, totalAmount);

            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return result;
    }

    // 주문번호 생성
    public String generateOrderNumber() {
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String orderNumber = null;

        try {
            conn = DBConnectionManager.connectDB();
            String sql = "SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(ORDER_ID_SQ.NEXTVAL, 1, '0') FROM DUAL";
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();

            if (rs.next()) {
                orderNumber = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return orderNumber;
    }
}
