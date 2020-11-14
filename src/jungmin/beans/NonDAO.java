package jungmin.beans;

import java.io.File;
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
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import common.D;


public class NonDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	StringBuffer query;

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

	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	

	private NonDTO[] createArray(ResultSet rs) throws SQLException {
		NonDTO [] arr = null;
		ArrayList<NonDTO> list = new ArrayList<NonDTO>();


		while (rs.next()) {

			int b_uid = rs.getInt("b_uid");
			String b_nickname = rs.getString("b_nickname");
			String b_pw = rs.getString("b_pw");
			String title = rs.getString("title");
			String content = rs.getString("content").replace("\r\n", "<br>");
			if(content == null) content = "";
			int viewCnt = rs.getInt("viewcnt");
			Date d = rs.getDate("b_regdate"); 
			Time t = rs.getTime("b_regdate"); 

			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			NonDTO dto = new NonDTO(b_uid, b_nickname, b_pw, title, content, viewCnt);
			dto.setB_regDate(regDate);
			list.add(dto); 
		}
		int size = list.size();

		if(size == 0) return null;
		arr = new NonDTO[size];
		list.toArray(arr); 
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
		list.toArray(arr); 
		return arr;
	}

	private NonDTO[] createArray3(ResultSet rs) throws SQLException {
		NonDTO [] arr = null;
		ArrayList<NonDTO> list = new ArrayList<NonDTO>();


		while (rs.next()) {

			int b_uid = rs.getInt("b_uid");
			String file2 = rs.getString("file2");
			System.out.println("file2 : " + file2);
			NonDTO dto = new NonDTO(file2, b_uid);
			list.add(dto); 
		}
		int size = list.size();

		if(size == 0) return null;
		arr = new NonDTO[size];
		list.toArray(arr);  
		return arr;
	}	




	public int insert(String b_nickname, String b_pw, String title, String content,
			List<String> originalFileNames,
			List<String> fileSystemNames
			) throws SQLException {

		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.N_B_INSERT);
			pstmt.setString(1, b_nickname);
			pstmt.setString(2, b_pw);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			if(fileSystemNames.size()  == 0) {
				pstmt.setString(5,	"");

			}else {
				for (int i = 0; i < fileSystemNames.size(); i++) {
					pstmt.setString(5, fileSystemNames.get(i));					
				}
			}
			cnt = pstmt.executeUpdate();
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
		NonDTO [] arr = null;

		try {
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		return arr; 
	}

	public NonDTO [] readByUid(int b_uid, boolean f_cnt) throws SQLException{
		int cnt = 0;
		NonDTO [] arr = null;

		try {
			if(f_cnt) {
				conn.setAutoCommit(false); 
				pstmt = conn.prepareStatement(D.N_B_WRITE_INC_VIEWCNT);
				pstmt.setInt(1, b_uid);
				cnt = pstmt.executeUpdate();
				pstmt.close();
			}
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT_UID);
			pstmt.setInt(1, b_uid);
			rs= pstmt.executeQuery();

			arr = createArray(rs);
			conn.commit(); 
		}catch (Exception e) {
			conn.rollback(); 
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


	public int update(int b_uid, String title, String content, List<String> originalFileNames, List<String> fileSystemNames, String delFile) throws SQLException {
		int cnt = 0;

		try {
			
			if(delFile == null || delFile.length() == 0) {
				if(originalFileNames.size() == 0) {
					
					pstmt = conn.prepareStatement(D.N_B_WRITE_UPDATE_UID_NONFILE);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setInt(3, b_uid);
					
				} else {
					
					pstmt = conn.prepareStatement(D.N_B_WRITE_UPDATE_UID);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					
					for (int i = 0; i < originalFileNames.size(); i++) {
						pstmt.setString(3, fileSystemNames.get(i));					
					}
					
					pstmt.setInt(4, b_uid);
				}
				
			} else {
				if(originalFileNames.size() == 0) {
					pstmt = conn.prepareStatement(D.N_B_WRITE_UPDATE_UID);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, "");
					pstmt.setInt(4, b_uid);
				} else {
					pstmt = conn.prepareStatement(D.N_B_WRITE_UPDATE_UID);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
				}
				for (int i = 0; i < originalFileNames.size(); i++) {
					pstmt.setString(3, fileSystemNames.get(i));					
				}
				
				pstmt.setInt(4, b_uid);
			}
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
	//첨부파일★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	public NonDTO [] selectFilesByWrUid(int b_uid) throws SQLException{
		NonDTO [] arr = null;
		try{

			pstmt = conn.prepareStatement(D.N_FILE_SELECT);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray3(rs);

		}finally{
			close();
		} 	

		return arr;		
	}

	public void deleteFiles(NonDTO [] arr, HttpServletRequest request) {
		if(arr == null || arr.length == 0 || request == null) return;

		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");

		for(NonDTO dto : arr) {
			File f = new File(saveDirectory, dto.getFile2());  
			System.out.println("삭제시도--> " + f.getAbsolutePath()); 

			if(f.exists()) {
				if(f.delete()) {
					System.out.println("삭제 성공!");
				} else {
					System.out.println("삭제 실패!");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}

		} 

	}

	public int deleteByWrUid(int b_uid, HttpServletRequest request) throws SQLException{
		int cnt = 0;

		NonDTO [] arr = null;

		try {
			pstmt = conn.prepareStatement(D.N_FILE_SELECT);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray3(rs);
			deleteFiles(arr, request); // 파일 삭제
			pstmt.close();
			pstmt = conn.prepareStatement(D.N_B_WRITE_DELETE_UID);
			pstmt.setInt(1, b_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	public int deleteByUid(int uids, HttpServletRequest request) throws SQLException{
		
		int cnt = 0;
		try {

			StringBuffer sql = new StringBuffer("SELECT * FROM tp_board WHERE b_uid = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, uids);
			rs = pstmt.executeQuery();

			NonDTO [] arr = createArray3(rs);
			deleteFiles(arr, request); 			

		} finally {
			close();
		}

		return cnt;
	}
	//회원, 비회원 유무★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	

	private UserDto[] createArray4(ResultSet rs) throws SQLException {
		UserDto [] arr = null;
		ArrayList<UserDto> list = new ArrayList<UserDto>();


		while (rs.next()) {
			int u_uid = rs.getInt("u_uid");
			String u_nickname = rs.getString("u_nickname");

			UserDto dto = new UserDto(u_uid);
			list.add(dto); 
		}
		int size = list.size();

		if(size == 0) return null;
		arr = new UserDto[size];
		list.toArray(arr);  
		return arr;
	}
	public UserDto [] userSelect(int u_uid) throws SQLException {
		UserDto [] arr = null;

		try {
			pstmt = conn.prepareStatement(D.U_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray4(rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

	public UserDto [] chkUser (int u_uid) throws SQLException {
		UserDto [] arr = null;

		try {	
			pstmt = conn.prepareStatement(D.N_USERorNON);
			pstmt.setInt(1, u_uid);
			rs = pstmt.executeQuery();
			arr = createArray4(rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}



	//댓글★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★



	//댓글
	private NonReplyDTO[] createArray5(ResultSet rs) throws SQLException {
		NonReplyDTO [] arr = null;
		ArrayList<NonReplyDTO> list = new ArrayList<NonReplyDTO>();

		while (rs.next()) {

			int c_uid = rs.getInt("c_uid");
			int b_uid = rs.getInt("b_uid");
			int u_uid = rs.getInt("u_uid");
			String c_nickname = rs.getString("c_nickname");
			String reply = rs.getString("reply");
			if(reply == null) reply = "";
			String c_pw = rs.getString("c_pw");
			String u_nickname = rs.getString("u_nickname");
			Date d = rs.getDate("c_regdate"); 
			Time t = rs.getTime("c_regdate");  

			String c_regDate = "";
			if(d != null) {
				c_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);

				NonReplyDTO dto = new NonReplyDTO(c_uid, u_uid, b_uid, c_nickname, u_nickname, c_pw, reply);
				dto.setC_regdate(c_regDate);
				list.add(dto); 
			}
			int size = list.size();

			if(size == 0) return null;
			arr = new NonReplyDTO[size];
			list.toArray(arr);  // 리스트 -> 배열 변환
		}
		return arr;
	}


	public NonDTO[] replyselect(int b_uid) throws SQLException {
		NonDTO [] arr = null; 

		try {
			pstmt = conn.prepareStatement(D.N_C_SELECT);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}finally {
			close();
		}
		return arr; // 
	}
	public NonReplyDTO [] replySelect(int b_uid) throws SQLException {
		NonReplyDTO [] arr = null;

		try {
			pstmt = conn.prepareStatement(D.N_C_SELECT);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray5(rs);
		} finally {
			close();
		}

		return arr;

	}
	
	public int replyInsert(int b_uid, String c_nickname, String c_pw , String reply) throws SQLException {
		int error = 2;
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.N_C_INSERT);
			pstmt.setInt(1, b_uid);
			pstmt.setString(2, c_nickname);
			pstmt.setString(3, c_pw);
			pstmt.setString(4, reply);
			cnt = pstmt.executeUpdate();
			System.out.println("댓글 cnt 입니다 !! :" + cnt);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("테이블에 정해놓은 데이터보다 큰 값이 들어가있습니다.");
			return error; // 더 많은 값이 들어 갔을 때, cnt 값이 0을 반환.
		}finally {
			close();
		}
		return cnt;
	}


	public int replyDelete(int b_uid, int c_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.N_C_DELETE);
			pstmt.setInt(1, c_uid);
			pstmt.setInt(2, b_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	public int replyUpdate(int b_uid, int c_uid, String reply) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.N_C_UPDATE);
			pstmt.setString(1, reply);
			pstmt.setInt(2, c_uid);
			pstmt.setInt(3, b_uid);
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		return cnt;
	}

	public UserDto selectUser(int b_uid) {

		UserDto dto = null;

		try {
			pstmt = conn.prepareStatement(D.MELONG);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				int u_uid = rs.getInt("u_uid");
				String u_nickName = rs.getString("u_nickname");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				if(gender.equals("male"))
					gender = "남";
				else 
					gender = "여";
				Date birth = rs.getDate("birth");

				dto = new UserDto(u_uid, u_nickName, name, gender, birth);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("유저 정보:" + dto);

		return dto;

	}
	
	private NonReplyDTO[] createArray6(ResultSet rs) throws SQLException {
		
		NonReplyDTO [] arr = null;
		ArrayList<NonReplyDTO> list = new ArrayList<NonReplyDTO>(); 
		
		while (rs.next()) {	
			int c_uid = rs.getInt("c_uid");
			String c_pw = rs.getString("c_pw");
			
			NonReplyDTO dto = new NonReplyDTO(c_uid, c_pw);
			list.add(dto); 

			int size = list.size();
			if(size == 0) return null;
			arr = new NonReplyDTO[size];
			list.toArray(arr);
		}
		return arr;
	}
	
	public NonReplyDTO[] replyPsw(int c_uid) throws SQLException {
		
		NonReplyDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(D.MelongEjiLong);
			pstmt.setInt(1, c_uid);
			rs = pstmt.executeQuery();
			arr = createArray6(rs);
		}finally {
			close();
		}
		return arr;
	}

}

