package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.util.DBConnectionManager;

		public class DeleteMemberDAO {
			
			Connection conn;
			PreparedStatement psmt;
			ResultSet rs;
	//삭제
		public int deleteMemberInfoById(String id) { 
			//해당 아이디에 맞는 사람의 정보를 삭제!!
			
			conn = DBConnectionManager.connectDB();
			
			String sql = " DELETE FROM member_table "
					   + " WHERE id = ? ";
			
			int result = 0;
			
			try {
				psmt = conn.prepareStatement(sql);
				//Connection 활용해서 sql 명령을 실행하는 객체
				
				psmt.setString(1, id);
		
				result = psmt.executeUpdate();
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
