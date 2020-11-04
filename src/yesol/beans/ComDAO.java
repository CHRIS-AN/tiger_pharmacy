package yesol.beans;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.D;

public class ComDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public ComDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("ComDAO()생성, db연결!!"); // ==== 여기 지워야된다
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // end try
	
	
	// DB 자원 반납
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	
	// 새 댓글 작성 <-- 내용, 작성자
	public int com_insert(int b_uid, int u_uid, String reply) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.M_COM_INSERT);
			pstmt.setInt(1, b_uid);
			pstmt.setInt(2, u_uid);
			pstmt.setString(3, reply);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	

	// ResultSet --> DTO배열로 리턴
	public ComDTO [] createArray(ResultSet rs) throws SQLException{
		ComDTO [] arr = null;
		
		ArrayList<ComDTO> list = new ArrayList<ComDTO>();
		
		while(rs.next()) {
			int c_uid = rs.getInt("c_uid");
			int b_uid = rs.getInt("b_uid");
			int u_uid = rs.getInt("u_uid");
			String u_nickname = rs.getString("u_nickname");
			String reply = rs.getString("reply");
			
			Date d = rs.getDate("c_regdate");
			Time t = rs.getTime("c_regdate");
			
			String c_regdate = "";
			if(d != null) {
				c_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			ComDTO dto = new ComDTO(c_uid, b_uid, u_uid, u_nickname, reply);
			dto.setC_regdate(c_regdate);
			
			list.add(dto);
		} // end while
		
		int size = list.size();
		if(size == 0) return null;
		
		arr = new ComDTO[size]; // 리스트에 담긴 DTO 의 개수만큰의 배열 생성
		list.toArray(arr); // 리스트 -> 배열로 변환
		
		return arr;
	} // end createArray()
	
	
	// 해당 글의 댓글들 불러오기
	public ComDTO [] selectComByBUid(int b_uid) throws SQLException{
		ComDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.M_COM_SELECT);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end selectByUid()
	

	// 댓글 수정
	public int update(int c_uid, String reply) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.M_COM_UPDATE);
			pstmt.setNString(1, reply);
			pstmt.setInt(2, c_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end update()
	
	
	// 댓글 삭제
	public int deleteByUid(int c_uid) throws SQLException{
		int cnt = 0;
		
		try {
		pstmt = conn.prepareStatement(D.M_COM_DELETE_BY_COMUID);
		pstmt.setInt(1, c_uid);
		cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end deleteByUid()
		
}
