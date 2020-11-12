package yesol.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import common.D;

public class Jin_UserDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	public Jin_UserDAO() {
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

	public Jin_UserDTO selectByUid(int u_uid) throws SQLException {
		Jin_UserDTO dto = null;

		try {
			pstmt = conn.prepareStatement(D.U_SELECT_UID);
			pstmt.setInt(1, u_uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int uid = rs.getInt("u_uid");
				String u_nickname = rs.getString("u_nickname");
				String pw = rs.getString("u_pw");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				if(gender.equals("male"))
					gender = "남";
				else 
					gender = "여";
				Date birth = rs.getDate("birth");
				
				dto	= new Jin_UserDTO(uid, u_nickname, pw, email, name, gender, birth);
			}
			
		}  finally {
			close();
		}

		return dto;
	}
}
