package yeonsup.beans;

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
import java.util.Arrays;
import java.util.List;

import common.D;
import jungmin.beans.NonDTO;

public class FreeTalkDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public FreeTalkDAO() {
		super();
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
	
	// 게시판 전체 리스트 가져오기
	public FreeTalkDTO[] selectFTList() {
		FreeTalkDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.B_SELECT_USER_JOIN);
			rs = pstmt.executeQuery();
			arr = createArray();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return arr;
	}
	
	// 페이징 - 페이지 총 수량 가져오기
	public int AllpageCnt() {
		int allPageCnt = 0;
		
		return allPageCnt;
	}
	// 배열 만들기
	private FreeTalkDTO[] createArray() throws SQLException {
		FreeTalkDTO [] arr = null;
		ArrayList<FreeTalkDTO> list = new ArrayList<FreeTalkDTO>();
		
		
		while (rs.next()) {
			
			int b_uid = rs.getInt("b_uid");
			String b_nickName = rs.getString("b_nickname");
			String b_pw = rs.getString("b_pw");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String catagory = rs.getString("catagory");
			String u_nickName = rs.getString("u_nickName");
			int u_uid = rs.getInt("u_uid");
			System.out.println(u_uid);
			if(content == null) content = "";
			int viewCnt = rs.getInt("viewcnt");
			System.out.println(b_nickName);
			Date d = rs.getDate("b_regdate");  // 년, 월, 일
			
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
			}
			
			FreeTalkDTO dto = new FreeTalkDTO(b_uid, b_nickName, b_pw, u_uid, title, content, viewCnt, catagory, u_nickName);
			dto.setB_regDate(regDate);
			
			list.add(dto); 
			
		}
		System.out.println("createArray() 호출");
		System.out.println("list : " + list);
		
		if(list.size() > 0) {
			arr = new FreeTalkDTO[list.size()];
			list.toArray(arr);
			System.out.println("arr : " + Arrays.deepToString(arr));
		}
		return arr;
	}
	public int insertFreeTalk(String title, String content, int u_uid, String catagory, String originalFileName, String fileSystemName) 
		{
			int result = 0;
			try {
				pstmt = conn.prepareStatement(D.F_B_INSERT);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setInt(3, u_uid);
				pstmt.setString(4, catagory);
				pstmt.setString(5, fileSystemName);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		
			return result;
		}

	public FreeTalkDTO selectFTList_byBuid(int b_uid) {
		FreeTalkDTO dto = null;
		CommentDTO [] arr = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement();
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String b_nickName = rs.getString("b_nickname");
				String b_pw = rs.getString("b_pw");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String catagory = rs.getString("catagory");
				String u_nickName = rs.getString("u_nickName");
				int u_uid = rs.getInt("u_uid");
				System.out.println(u_uid);
				if(content == null) content = "";
				int viewCnt = rs.getInt("viewcnt");
				System.out.println(b_nickName);
				Date d = rs.getDate("b_regdate");  // 년, 월, 일
				
				String regDate = "";
				if(d != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
				}
				
				dto = new FreeTalkDTO(b_uid, b_nickName, b_pw, u_uid, title, content, viewCnt, catagory, u_nickName);
				dto.setB_regDate(regDate);
			}
			
			pstmt.close();
			pstmt = conn.prepareStatement();
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			
			arr = createCommentArray(rs, arr);
			
			dto.setComments(arr);
			
			conn.commit();  // 트랜잭션 성공!
		} catch (SQLException e) {
			conn.rollback();  // 트랜잭션 실패하면 rollback()
			throw e;
		} finally {
			close();
		} // end try		
		return dto;
	}

	private CommentDTO[] createCommentArray(ResultSet rs, CommentDTO [] arr) {
		
	
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			while(rs.next()) {
				int u_uid = rs.getInt("u_uid");
				int c_uid = rs.getInt("c_uid");
				int b_uid = rs.getInt("b_uid");
				String c_nickName = rs.getString("c_nickName");
				String c_pw = rs.getString("c_pw");
				String reply = rs.getString("reply");
				String c_regdate = rs.getString("c_regdate");
				
				CommentDTO dto = new CommentDTO(c_uid, b_uid, u_uid, c_nickName, c_pw, reply);
				
				list.add(dto);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(list.size() > 0) {
			arr = new CommentDTO[list.size()];
			list.toArray(arr);
		}
		
		return arr;
	
	}
}
