package jungmin.beans;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import jungmin.sql.SQL;

public class NonDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	
	public NonDAO() {
		try {
			Class.forName(SQL.DRIVER);
			conn = DriverManager.getConnection(SQL.URL,SQL.USERID,SQL.USERPW);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close(); 
	} 
	// 
	public int insert(NonDTO dto) throws SQLException {
		int cnt = 0;
		
		String name = dto.getB_nickname();
		String pw = dto.getB_pw();
		String title = dto.getTitle();
		String content = dto.getContent();
		cnt = this.insert(name, pw, title, content);
		return cnt;
	} // end insert(DTO)
	public int insert(String name, String pw, String title, String content) throws SQLException {
		int cnt = 0;
		
		
		try {
			pstmt = conn.prepareStatement(SQL.N_B_INSERT);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, name);
			cnt = pstmt.executeUpdate(); //트랜잭션이 끝난 다음에 2번
		}finally {
			close();
		}
		
		return cnt;
	}

}
