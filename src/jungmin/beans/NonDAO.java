package jungmin.beans;


import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
			pstmt.setString(1, name);
			pstmt.setString(2, pw);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			cnt = pstmt.executeUpdate(); //트랜잭션이 끝난 다음에 2번
		}finally {
			close();
		}
		
		return cnt;
	}


	public NonDTO[] select() throws SQLException {
		NonDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(SQL.N_B_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray();
		}finally {
			close();
		}
		return arr;
	}


	private NonDTO[] createArray() throws SQLException {
		NonDTO [] arr = null;
		ArrayList<NonDTO> list = new ArrayList<NonDTO>();
		
		
		while (rs.next()) {
			
			int b_uid = rs.getInt("b_uid");
			String b_nickname = rs.getString("b_nickname");
			String title = rs.getString("title");
			String content = rs.getString("content");
			int viewCnt = rs.getInt("viewcnt");
			
			Date d = rs.getDate("b_regdate");  // 년, 월, 일
			Time t = rs.getTime("b_regdate");  // 시, 분, 초
			
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			NonDTO dto = new NonDTO(b_uid, b_nickname, title, content, viewCnt);
			dto.setB_regDate(regDate);
			
			list.add(dto);
		}

		return arr;
	}

}
