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
				if(gender.equals("male"))
					gender = "남";
				else 
					gender = "여";
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
	
	public UserDTO selectByEmail(String email) {
		
		UserDTO dto = null;
		
		try {
			
			pstmt = conn.prepareStatement(D.U_SELECT_EMAIL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new UserDTO();
				dto.setEmail(rs.getString("email"));
				dto.setU_uid(rs.getInt("u_uid"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(dto != null) {
			System.out.println("유저 정보:" + dto.getEmail());
			System.out.println("내 email: " + email);
		} else {
			System.out.println("아이디 중복된 값 없음.");
		}
		
		return dto;
		
	}

	public boolean duplicatenickCheck(String nickname) {
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(D.U_SELECT_NICK);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
