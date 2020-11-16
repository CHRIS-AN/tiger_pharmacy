package yeonsup.beans;

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
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import common.D;
import jungmin.beans.NonDTO;

public class FreeTalkDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	String catag = "free";

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
	public FreeTalkDTO[] selectFTList(int curPage, int pageRows) {
		FreeTalkDTO [] arr = null;
		int fromRow = (curPage - 1) * pageRows + 1;
		
		try {
			pstmt = conn.prepareStatement(D.F_B_LIST_SELECT_FROM);
			pstmt.setString(1, catag);
			pstmt.setInt(2, fromRow);
			pstmt.setInt(3, fromRow + pageRows);
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
			
			if(catagory.equals("free"))
				catagory = "자유";
			if(catagory.equals("jin_bi"))
				catagory = "비뇨기과";
			if(catagory.equals("jin_jung"))
				catagory = "정신과";
				
			String u_nickName = rs.getString("u_nickName");
			int u_uid = rs.getInt("u_uid");
			
			if(content == null) content = "";
			
			int viewCnt = rs.getInt("viewcnt");
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
	
	// 다운로드만 파일 소스만 필요
	public FreeTalkDTO select_byUid(int b_uid) {
		System.out.println("selectFTList_byBuid() 호출");
		FreeTalkDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(D.FILE_SOURCE_SELECT_UID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String file2 = rs.getString("file2");
				
				dto = new FreeTalkDTO();
				dto.setFile(file2);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 게시글 정보와 조회 수 가져오기
	public FreeTalkDTO selectFTList_byBuid(int b_uid, boolean f_cnt) throws SQLException {
		// System.out.println("selectFTList_byBuid() 호출");
		int cnt = 0;
		FreeTalkDTO dto = null;

		try { // 게시글 정보 가져오기 (회원)
			// 트랜잭션 처리
			conn.setAutoCommit(false); // 자동 커밋 안함
			if(f_cnt) {
				// 조회수 1 증가
				pstmt = conn.prepareStatement(D.N_B_WRITE_INC_VIEWCNT);
				pstmt.setInt(1, b_uid);
				cnt = pstmt.executeUpdate();
				pstmt.close();
			}
			//1. 게시글 정보 가져오기
			pstmt = conn.prepareStatement(D.N_B_WRITE_SELECT_UID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				
				String b_nickName = rs.getString("b_nickname");
				String b_pw = rs.getString("b_pw");
				String title = rs.getString("title");
				String content = rs.getString("content").replace("\r\n", "<br>");
				String catagory = rs.getString("catagory");
				String file = rs.getString("file2");

				int u_uid = rs.getInt("u_uid");
				
				System.out.println("u_uid : " + u_uid);

				if(content == null) content = "";

				int viewCnt = rs.getInt("viewcnt");

				Date d = rs.getDate("b_regdate");  // 년, 월, 일				
				String regDate = "";

				if(d != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
				}

				dto = new FreeTalkDTO(b_uid, b_nickName, b_pw, u_uid, title, content, viewCnt, catagory);
				dto.setB_regDate(regDate);
				dto.setFile(file);
			}
			
			conn.commit();
			
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // end try		

		System.out.println("selectFTList_byBuid() 성공====");
		System.out.println("selectFTList_byBuid() dto : " + dto);
		return dto;
	}



	public int deleteBoardByUid(int b_uid) {
		int result = 0;

		try {

			pstmt = conn.prepareStatement(D.N_B_WRITE_DELETE_UID);
			pstmt.setInt(1, b_uid);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}


		return result;
	}

	public int deleteByUid(int uid, HttpServletRequest request) {

		int cnt = 0;

		// 101, 204, 319 번 파일을 읽어오려면
		// SELECT * FROM test_file WHERE bf_uid = 101 OR bf_uid = 204 OR bf_uid = 319
		// SELECT * FROM test_file WHERE bf_uid IN (101, 204, 319)

		// 101, 204, 319 번 파일을 지우려면? 
		// DELETE FROM test_file WHERE bf_uid = 101 OR bf_uid = 204 OR bf_uid = 319
		// DELETE FROM test_file WHERE bf_uid IN (101, 204, 319)

		try {
			// 1. 물리적인 파일(들) 삭제
			StringBuffer sql = new StringBuffer("SELECT * FROM tp_board WHERE b_uid = " + uid);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			FreeTalkDTO dto = new FreeTalkDTO();
			if(rs.next())
				dto.setFile(rs.getString("file2"));

			deleteFiles(dto, request);  // 파일 삭제

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cnt;
	}

	private void deleteFiles(FreeTalkDTO dto, HttpServletRequest request) {
		// 물리적인 경로
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");



		File f = new File(saveDirectory, dto.getFile());  // 물리적인 삭제 대상
		System.out.println("삭제시도--> " + f.getAbsolutePath());

		if(f.exists()) {
			if(f.delete()) {  // 삭제!
				System.out.println("삭제 성공!");
			} else {
				System.out.println("삭제 실패!");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}

	}

	public FreeTalkDTO select_by_B_uid(int b_uid) {


		FreeTalkDTO dto = null;

		try { // 게시글 정보 가져오기 (회원)
			// 트랜잭션 처리
			pstmt = conn.prepareStatement(D.B_SELECT_USER_JOIN_BY_B_UID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				String b_nickName = rs.getString("b_nickname");
				String b_pw = rs.getString("b_pw");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String catagory = rs.getString("catagory");
				String u_nickName = rs.getString("u_nickName");
				String file2 = rs.getString("file2");

				int u_uid = 0;

				if(b_pw != null ) {
					u_uid = rs.getInt("u_uid");
				}


				if(content == null) content = "";

				int viewCnt = rs.getInt("viewcnt");

				Date d = rs.getDate("b_regdate");  // 년, 월, 일				
				String regDate = "";

				if(d != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
				}

				dto = new FreeTalkDTO(b_uid, b_nickName, b_pw, u_uid, title, content, viewCnt, catagory, u_nickName);
				dto.setB_regDate(regDate);
				dto.setFile(file2);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // end try		


		return dto;
	}

	public int FreeUpdateByBuid(int b_uid, String title, String content, String originalFileName, String fileSystemName, String delFile) {
		int cnt = 0;

		try {
			
			if(delFile == null || delFile.length() == 0) {
				if(originalFileName != null && originalFileName.length() > 0) {
					pstmt = conn.prepareStatement(D.F_B_WRITE_UPDATE_UID); 
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, fileSystemName);
					pstmt.setInt(4, b_uid);
				} else {
					pstmt = conn.prepareStatement(D.F_B_WRITE_UPDATE_UID_NonFile); 
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setInt(3, b_uid);
				}
			} else {
				if(originalFileName != null && originalFileName.length() > 0) {
					pstmt = conn.prepareStatement(D.F_B_WRITE_UPDATE_UID);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, fileSystemName);
					pstmt.setInt(4, b_uid);
				} else {
					pstmt = conn.prepareStatement(D.F_B_WRITE_UPDATE_UID);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, "");
					pstmt.setInt(4, b_uid);
				}
			}
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
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

		return cnt;
	}

	public FreeTalkDTO[] selectSerach(String s_col, String word, int curPage, int pageRows) {
		System.out.println("selectSearch () 호출");
		FreeTalkDTO[] arr = null;
		int fromRow = (curPage - 1) * pageRows + 1;
		
		StringBuffer query = new StringBuffer("SELECT * FROM (SELECT rownum AS RNUM, T.* FROM (SELECT tp_board.*, tp_user.u_nickName FROM TP_board, TP_user where catagory = 'free' and tp_board.u_uid = tp_user.u_uid (+) and ");
		
		try {
			System.out.println("s_col : " + s_col);
			System.out.println("word : " + word);
			if(s_col.equals("title")) {
	
				query.append("tp_board.title like ? order by tp_board.b_uid desc) T) ");
				query.append("WHERE RNUM >= ? AND RNUM < ?");
				System.out.println(query.toString());
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" + word + "%");
				pstmt.setInt(2, fromRow);
				pstmt.setInt(3, fromRow + pageRows);
				
			} else if (s_col.equals("title_content")) {
				
				query.append("tp_board.title like ? and tp_board.content like ? order by tp_board.b_uid desc T) ");
				query.append("WHERE RNUM >= ? AND RNUM < ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" + word + "%");
				pstmt.setString(2, "%" + word + "%");
				pstmt.setInt(2, fromRow);
				pstmt.setInt(3, fromRow + pageRows);
				
			}

			rs = pstmt.executeQuery();
			
			arr = createArray();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return arr;
	}

	public int selectTotalBoard(int pageRows) {		
		int total = 0;
		
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) as total FROM tp_board where catagory = ? ");
			pstmt.setString(1, catag);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
	public int selectTotalBoardByWord(int pageRows, String s_col, String word) {		
		int total = 0;
		
		try {
			System.out.println("s_col : " + s_col);
			System.out.println("word : " + word);
			if(s_col.equals("title")) {
	
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total FROM tp_board where catagory = ? and tp_board.title like ? ");
				pstmt.setString(1, catag);
				pstmt.setString(2, "%" + word + "%");
				
			} else if (s_col.equals("title_content")) {
				
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total FROM tp_board where catagory = ? and tp_board.title like ? or tp_board.content like ? ");
				pstmt.setString(1, catag);
				pstmt.setString(2, "%" + word + "%");
				pstmt.setString(3, "%" + word + "%");
				
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
	public int selectTotalBoardByWord(int pageRows, String word) {		
		int total = 0;
		
		try {
			System.out.println("word : " + word);
		
			pstmt = conn.prepareStatement("SELECT COUNT(*) as total FROM tp_board where catagory in ('free', 'jin_jung', 'jin_bi') and tp_board.title like ? or tp_board.content like ? ");
			pstmt.setString(1, "%" + word + "%");
			pstmt.setString(2, "%" + word + "%");
				
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total;
	}

	public FreeTalkDTO[] selectSerach(String word, int curPage, int pageRows) {
		System.out.println("selectSearch () 호출");
		FreeTalkDTO[] arr = null;
		int fromRow = (curPage - 1) * pageRows + 1;
		StringBuffer query = new StringBuffer("SELECT * FROM (SELECT rownum AS RNUM, T.* FROM (SELECT tp_board.*, tp_user.u_nickName FROM TP_board, TP_user where catagory in ('free', 'jin_jung', 'jin_bi') and tp_board.u_uid = tp_user.u_uid (+) and ");
		
		try {
				query.append(" (TITLE LIKE ? OR CONTENT LIKE ?) order by tp_board.b_uid desc) T) ");
				query.append("WHERE RNUM >= ? AND RNUM < ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" + word + "%");
				pstmt.setString(2, "%" + word + "%");
				pstmt.setInt(3, fromRow);
				pstmt.setInt(4, fromRow + pageRows);
				

			rs = pstmt.executeQuery();
			
			arr = createArray();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return arr;

	}
}
