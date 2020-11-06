package yeonsup.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import common.D;

public class UserDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public UserDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
		} catch(Exception e) {
			e.printStackTrace();
		} // end try
	}
	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close();
	
	public UserDTO selectByUid(int u_uid) {
		
		UserDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(D.U_SELECT_UID);
			pstmt.setInt(1, u_uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				String u_nickName = rs.getString("u_nickname");
				String pw = rs.getString("u_pw");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				Date birth = rs.getDate("birth");
				
				dto = new UserDTO(u_uid, u_nickName, pw, email, name, gender, birth);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("유저 정보:" + dto);
		
		return dto;
		
	}
}
