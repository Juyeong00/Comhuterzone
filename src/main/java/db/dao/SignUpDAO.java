package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import db.util.DBConnectionManager;
import db.util.MyConvertDateUtil;
import db.dto.SignUpDTO;

public class SignUpDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	
	public int saveSignUpInfo(SignUpDTO signUpDTO) { //abbb221
		
		conn = DBConnectionManager.connectDB();
		
		String sql = " INSERT INTO member_table " 
			       + " VALUES (  ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD' )) ";
		int result = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, signUpDTO.getId());
			psmt.setString(2, signUpDTO.getPassword());
			psmt.setString(3, signUpDTO.getName());
			psmt.setString(4, signUpDTO.getEmail());
			psmt.setString(5, signUpDTO.getPhone());
			psmt.setString(6, signUpDTO.getZipcode());
			psmt.setString(7, signUpDTO.getAddress());
			psmt.setString(8, signUpDTO.getAddress2());
			psmt.setString(9, signUpDTO.getBirthday());
			
			String currentDateStr2 = MyConvertDateUtil.convertLocalDateTimeToStringYYYYMMDD2(LocalDateTime.now());
			psmt.setString(10, currentDateStr2);
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
