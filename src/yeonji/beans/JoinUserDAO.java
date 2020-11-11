package yeonji.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end try
		System.out.println("cnt2:"+cnt);
		return cnt;
	}

	public JoinUserDTO emailPWChk(String email, String pw) throws SQLException {

		JoinUserDTO dto = null;
		try {

			pstmt=conn.prepareStatement(D.U_EmailPWChk);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new JoinUserDTO();
				dto.setU_uid(rs.getInt("u_uid"));
				dto.setEmail(rs.getString("email"));
				dto.setU_pw(rs.getString("u_pw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		} // finally
		return dto;
	}
	
	public int deleteUser(int u_uid) throws SQLException {
		System.out.println("deleteUser들어옴");
		int cnt = 0;

		try {
			pstmt=conn.prepareStatement(D.U_deleteUser);
			pstmt.setInt(1, u_uid);
			
			cnt = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}// end try
		
		return cnt;
	}
	
	//회원정보
	 public JoinUserDTO getUserInfo(int u_uid) 
	    {
		 	JoinUserDTO dto = null;
	 
	        try {
	        	pstmt=conn.prepareStatement(D.U_getUserInfo);

				pstmt.setInt(1, u_uid);

				rs = pstmt.executeQuery();

	            if (rs.next()) // 회원정보를 DTO에 담는다.
	            { 
	                // 자바빈에 정보를 담는다.
	                dto = new JoinUserDTO();
	                dto.setU_uid(rs.getInt("u_uid"));
					dto.setEmail(rs.getString("email"));
					dto.setU_pw(rs.getString("u_pw"));
					dto.setU_nickname(rs.getString("u_nickname"));
	                dto.setName(rs.getString("name"));
	                dto.setGender(rs.getString("gender"));
	                dto.setBirth(rs.getString("birth"));
	            }
	 
	            return dto;
	 
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    }    // end getUserInfo


	 //회원수정
	    public int updateUser(JoinUserDTO dto) throws SQLException{
	 
	    	int cnt = 0;

			try {
				pstmt=conn.prepareStatement(D.U_updateUser);
				pstmt.setString(1, dto.getU_pw());
				pstmt.setString(2, dto.getU_nickname());
				pstmt.setString(3, dto.getGender());
				pstmt.setInt(4, dto.getU_uid());
				
				cnt = pstmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} // end try
			return cnt;

		}//updateUser


}

