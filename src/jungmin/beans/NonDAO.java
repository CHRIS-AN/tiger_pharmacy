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

import org.apache.catalina.valves.CrawlerSessionManagerValve;

import common.D;

public class NonDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	
	public NonDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL,D.USERID,D.USERPW);
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
		
		String b_nickname = dto.getB_nickname();
		String b_pw = dto.getB_pw();
		String title = dto.getTitle();
		String content = dto.getContent();
		cnt = this.insert(b_nickname, b_pw, title, content);
		return cnt;
	} // end insert(DTO)
	public int insert(String b_nickname, String b_pw, String title, String content) throws SQLException {
		int cnt = 0;
		
		
		try {
			pstmt = conn.prepareStatement(D.N_B_INSERT);
			pstmt.setString(1, b_nickname);
			pstmt.setString(2, b_pw);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			cnt = pstmt.executeUpdate(); //트랜잭션이 끝난 다음에 2번
			System.out.println("cnt : " + cnt);
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public NonDTO [] pwChk (int b_uid) throws SQLException {

		NonDTO [] arr = null;
		try {
			try {
				pstmt= conn.prepareStatement(D.N_B_WRITE_PWCHK);
				pstmt.setInt(1, b_uid);
				rs = pstmt.executeQuery();	
				arr = createArray2(rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}finally {
			close();
		}
		return arr;
		
	}


	public NonDTO[] select() throws SQLException {
		NonDTO [] arr = null; // 똑같이 dto의 배열을 null값을 줌으로써 이 매개체 안에 객체를 담아서 사용하게끔하려한다.
		
		try {
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		return arr; // 여기 arr에 값들이 담고나서, command 내에 arr값에 값을 담아 두기 위함이다.
	}


	private NonDTO[] createArray(ResultSet rs) throws SQLException {
		NonDTO [] arr = null;
		ArrayList<NonDTO> list = new ArrayList<NonDTO>();
		
		
		while (rs.next()) {
			
			int b_uid = rs.getInt("b_uid");
			String b_nickname = rs.getString("b_nickname");
			String b_pw = rs.getString("b_pw");
			String title = rs.getString("title");
			String content = rs.getString("content");
			if(content == null) content = "";
			int viewCnt = rs.getInt("viewcnt");
			Date d = rs.getDate("b_regdate");  // 년, 월, 일
			Time t = rs.getTime("b_regdate");  // 시, 분, 초
			
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			// b_uid, title ,content, b_nickname_ viewCnt + regdate
			NonDTO dto = new NonDTO(b_uid, b_nickname, title, content, viewCnt);
			dto.setB_regDate(regDate);
			list.add(dto); 
		}
		int size = list.size();
		
		if(size == 0) return null;
		arr = new NonDTO[size];
		list.toArray(arr);  // 리스트 -> 배열 변환
		return arr;
	}
	private NonDTO[] createArray2(ResultSet rs) throws SQLException {
		NonDTO [] arr = null;
		ArrayList<NonDTO> list = new ArrayList<NonDTO>();
		
		
		while (rs.next()) {
			int b_uid = rs.getInt("b_uid");
			String b_pw = rs.getString("b_pw");
			NonDTO dto = new NonDTO(b_uid, b_pw);
			list.add(dto); 
		}
		int size = list.size();
		
		if(size == 0) return null;
		arr = new NonDTO[size];
		list.toArray(arr);  // 리스트 -> 배열 변환
		return arr;
	}


	
	public NonDTO [] readByUid(int b_uid) throws SQLException{
		int cnt = 0;
		NonDTO [] arr = null;

		try {
			conn.setAutoCommit(false); // 꼭 이부분을 false로 놔줘야 한다.
			//연결에 자동 커밋 모드를 사용하려면 true이고, 사용하지 않으려면 false입니다.
			pstmt = conn.prepareStatement(D.N_B_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, b_uid);
			cnt = pstmt.executeUpdate();
			pstmt.close();
//--------------------------------------------------------------------------------------
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT_UID);
			pstmt.setInt(1, b_uid);
			rs= pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit(); // 트랜잭션 성공!!!
		}catch (Exception e) {
			conn.rollback(); // 트랜잭션이 실패하면 rollback()
			throw e;
		}finally {
			close();
		}
		return arr;
	}


	public NonDTO[] selectByUid(int b_uid) throws SQLException {
		NonDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT_UID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		
		return arr;
	}


	public int update(int b_uid, String title, String content) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.N_B_WRITE_UPDATE_UID);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, b_uid);
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		
		return cnt;
	}


	public int deleteByUid(int b_uid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.N_B_WRITE_DELETE_UID);
			pstmt.setInt(1, b_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	}
}
