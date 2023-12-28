package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.SignUpDTO;
import db.util.DBConnectionManager;

public class ModifyMemberDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public int modifyMember(SignUpDTO signUpDTO) { 
		//해당 아이디에 맞는 사람의 이름을 수정!
		
		conn = DBConnectionManager.connectDB();
		
		String sql = " UPDATE member_table " 
			       + " SET password = ?, name = ?, email = ?, phone = ?, "
			       + " zipcode = ?, address = ?, address2 = ? "
				   + " WHERE id = ? ";
		int result = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, signUpDTO.getPassword());
			psmt.setString(2, signUpDTO.getName());
			psmt.setString(3, signUpDTO.getEmail());
			psmt.setString(4, signUpDTO.getPhone());
			psmt.setString(5, signUpDTO.getZipcode());
			psmt.setString(6, signUpDTO.getAddress());
			psmt.setString(7, signUpDTO.getAddress2());
			psmt.setString(8, signUpDTO.getId());
			
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
