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

	//필드변수
		Connection conn;
		PreparedStatement psmt;
		ResultSet rs;

	//1. 기본 student 전체 조회 메소드
	public List<TotalOrderDTO> findTotalOrderList() {

	//DB 연결
			conn = DBConnectionManager.connectDB();


	//데이터처리
			// sql 쿼리 -> select 데이터 읽어와서 -> 객체 형태로 저장 -> return
			String sql = " SELECT * FROM total_order ";
			
			List<TotalOrderDTO> totalOrderList =null;
			
			try {
				psmt = conn.prepareStatement(sql);
				
				
				
				rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
				
				totalOrderList = new ArrayList<TotalOrderDTO>();
				
				
				while(rs.next()) { 
					TotalOrderDTO totalOrderDTO = new TotalOrderDTO(
							rs.getString("orderDate"),
							rs.getInt("orderId"),
							rs.getString("userName"),
							rs.getString("userId"),
							rs.getString("deliveryRequest"), 
							rs.getString("phoneNum"),
							rs.getInt("memberAdd1"),
							rs.getString("memberAdd2"),
							rs.getString("memberAdd3"),  
							rs.getString("paymentCard"),
							rs.getString("totalAmount"));
					
					totalOrderList.add(totalOrderDTO);
				
							
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			

			return totalOrderList;
		
}
	
	public int saveTotalOrder(String orderDatd, String orderId, String user_name, String userId,
			String deliveryRequest, String phoneNum, String memberAdd1, String memberAdd2,
			String memberAdd3, String paymentCard, String totalAmount ) {

		conn = DBConnectionManager.connectDB();

		String sql =  " INSERT INTO total_order " 
				+ " VALUES ( ?, ?, ?, ? ,?, ?, ?, ?, ?, ?, ?  ) ";
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체

			psmt.setString (1, orderDatd);
			psmt.setString (2, orderId);
			psmt.setString (3, user_name);
			psmt.setString (4, userId);
			psmt.setString (5, deliveryRequest);
			psmt.setString(6, phoneNum);
			psmt.setString(7, memberAdd1);
			psmt.setString(8, memberAdd2);
			psmt.setString(9, memberAdd2);
			psmt.setString(10, paymentCard);
			psmt.setString(11, totalAmount);

			result = psmt.executeUpdate(); //1 , 0 
			//rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

			/*
			SELECT 쿼리 : psmt.executeQuery(); -> 결과로 ResultSet
			INSERT, UPDATE, DELETE 쿼리 : psmt.executeUpdate();
										-> 결과로 적용된 행의 숫자  
			 */
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}


		return result;
	}
	
	
	
	
	
	
	
	
	
	
	}
