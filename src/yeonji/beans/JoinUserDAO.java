package yeonji.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import common.D;

public class JoinUserDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다
	public JoinUserDAO(){
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO생성, 데이터베이스 연결!!");
		} catch (Exception e) {			
			e.printStackTrace();
		} // end try
	}// 생성자
	
	// DB 자원 반납 메소드, 만들어놓으면 편함..
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close();
	

	public int insert(String u_nickname, String u_pw, String email, String name, String gender, String birth) throws SQLException {
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(D.U_Insert);
			
			pstmt.setString(1, u_nickname);
			pstmt.setString(2, u_pw);
			pstmt.setString(3, email);
			pstmt.setString(4, name);
			pstmt.setString(5, gender);
			pstmt.setString(6, birth);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}

	public static JoinUserDAO getInstance() {
		JoinUserDAO judao = new JoinUserDAO();
		return judao;
	}
	
	public boolean confirmEmail(String email) {
		boolean result = false;
		try {
			pstmt=conn.prepareStatement(D.U_confirmEmail);
			
			pstmt.setString(1, email);
			//executeQuery : 데이터베이스에서 데이터를 가져와서 결과 집합을 반환합니다. 이 메서드는 Select 문에서만 실행하는 특징이 있습니다.
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {rs.close();}catch (SQLException e) {}
			try {pstmt.close();}catch (SQLException e) {}
			try {conn.close();}catch (SQLException e) {}
		}
		return result;
	}
	
	public int changePW(JoinUserDTO dto) throws SQLException {
		int cnt = 0;

		try {
			pstmt=conn.prepareStatement(D.U_changePW);
			pstmt.setString(1, dto.getU_pw());
			pstmt.setString(2, dto.getEmail());
			cnt = pstmt.executeUpdate();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // end try
		System.out.println("cnt2:"+cnt);
		return cnt;
	}
}
