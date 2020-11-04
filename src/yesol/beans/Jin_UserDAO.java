package yesol.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

	public Jin_UserDTO [] selectByUid(int u_uid) throws SQLException {
		Jin_UserDTO [] arr = null;
		ArrayList<Jin_UserDTO> list = new ArrayList<Jin_UserDTO>();

		try {
			pstmt = conn.prepareStatement(D.U_SELECT_UID);
			pstmt.setInt(1, u_uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int uid = rs.getInt("u_uid");
				String u_nickName = rs.getString("u_nickname");
				String pw = rs.getString("u_pw");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				
				Jin_UserDTO dto
				= new Jin_UserDTO(uid, u_nickName, pw, email, name, gender, birth);
				list.add(dto);
			}
			
			int size = list.size();
			if(size == 0) return null;
			
			arr = new Jin_UserDTO[size];
			list.toArray(arr); // 리스트 -> 배열 변환
			
		}  finally {
			close();
		}

		return arr;
	}
}
