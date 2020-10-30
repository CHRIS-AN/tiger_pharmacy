package yeonsup.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.D;

public class OracleDBConector {
		
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Conneciton 도 생성된다.
	public OracleDBConector() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
//			System.out.println("WriteDAO 생성, 데이터베이스 연결!~");
		} catch(Exception e) {
			e.printStackTrace();
		} // end try		
	} // end 생성자
	
	// DB 자원 반납.
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close(); 
	} // end close()
}
