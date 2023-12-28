package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import db.dto.SignUpDTO;
import db.util.DBConnectionManager;

public class LoginMemberDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

//	PersonInfoDTO findPersonInfoById 이름은 이렇게 구분하기 좋게
	public SignUpDTO login(String memberId, String password) {
		
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT * FROM member_table " 
			       + " WHERE id = ? AND password = ? ";
		
		SignUpDTO signUpDTO = null; //return 할 객체
		
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, memberId);
			psmt.setString(2, password);
			
			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			
			if(rs.next()) {
				
				signUpDTO = new SignUpDTO(rs.getString("id"), rs.getString("password"), rs.getString("name"),  rs.getString("email"), rs.getString("phone"), rs.getString("zipcode"), rs.getString("address"), rs.getString("address2"), rs.getString("birthday"), rs.getString("indate"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return signUpDTO;
	}
	
	public void logout() {
		
	}
	
}
