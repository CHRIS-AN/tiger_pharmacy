package yeonsup.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import common.D;

public class CommentDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	StringBuffer query;
	
	public CommentDAO() {
		super();
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close();
	
	public CommentDTO[] select(int b_uid) {
		
		CommentDTO [] arr = null;
		ArrayList<CommentDTO> commentArr = new ArrayList<CommentDTO>();
		
		try {
			
			query = new StringBuffer();
			query.append("SELECT tp_comments.*, tp_user.u_nickName FROM tp_comments, tp_user where b_uid = ? order by c_uid desc");
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, b_uid);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				
				int c_uid = rs.getInt("c_uid");
				int u_uid = rs.getInt("u_uid");
				
				String c_nickName = rs.getString("c_nickName");
				String c_pw = rs.getString("c_pw");
				String reply = rs.getString("reply");
				String u_nickName = rs.getString("u_nickName");
				
				Date d = rs.getDate("c_regdate");
				Time t = rs.getTime("c_regdate");
				String commentDate = "";
				
				if(d != null) {
					commentDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
				CommentDTO comment = new CommentDTO(c_uid, b_uid, u_uid, c_nickName, c_pw, reply);
				comment.setC_regdate(commentDate);
				comment.setU_nickName(u_nickName);
				commentArr.add(comment);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		int size = commentArr.size();
		
		if(size == 0) return null;
		arr = new CommentDTO[size];
		System.out.println("성공");
		return commentArr.toArray(arr);
	}

	public int deleteComment(int c_uid) {
		
		int result = 0;
		
	    try {
	    	
	    	conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
	    	query = new StringBuffer();
	    	query.append("DELETE from tp_comments where c_uid=?");
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, c_uid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	    
	    
	    return result;
	}

	public int updateComment(int c_uid, String content) {
		
		int result = 0;
		
	    try {
	    	
	    	conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			pstmt = conn.prepareStatement("UPDATE tp_comments SET reply = ? where c_uid = ?");
			pstmt.setString(1, content);
			pstmt.setInt(2, c_uid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	    return result;
	}

	public int insertComment(HttpServletRequest request) {
		
		int result = 0;
		
	    try {
	    	
	    	conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			pstmt = conn.prepareStatement("INSERT INTO tp_comments(c_uid, b_uid, u_uid, reply, c_regdate) VALUES(tp_comments_seq.nextval, ?, ?, ?, sysdate)");
			pstmt.setString(1, request.getParameter("b_uid"));
			pstmt.setString(2, request.getParameter("u_uid"));
			pstmt.setString(3, request.getParameter("reply"));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	    
	    return result;
	}
}
