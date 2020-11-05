package yesol.beans;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import common.D;

public class WriteDAO {
	Connection conn; // DB와 연결해주는 역할
	PreparedStatement pstmt;
	// statement를 상속받는 인터페이스로 SQL구문을 실행시키는 기능을 갖는 객체
	// PreCompiled된 SQL문을 표현 즉
	// tatement객체는 실행시 sql명령어를 지정하여 여러 sql구문을 하나의 statement객체로 수행이 가능하다.(재사용 가능) 
	// 하지만, preparedStatement는 객체 생성시에 지정된 sql명령어만을 실행할수 있다.(다른 sql구문은 실행못함 ->재사용 못함)
	// 동일한 sql구문을 반복 실행한다면 preparedStatement가 성능면에서 빠름.
	// SQL문에서 변수가 들어갈 자리는 ' ? ' 로 표시한다. SQL문에서 Like키워드를 사용할경우 사용할수없다.
	// Connection 객체의 prepareStatement(String query)를 통해 생성된다.
	// PreparedStatement객체를 생성할때 SQL문이 인자로 주어진다.
	// SQL문에 매개변수를 사용하고, 실행전에 값을 지정할수있다.
	// SQL 문을 실행할때 execute(), executeQuery()또는 executeUpdate()를 사용한다.
	// PreparedStatement가 제공하는 메소드는 Statement가 제공하는 메소드와 거의 같다.
	Statement stmt; // DB로 명령전달하는 객체 -> 데이터 바인딩, SQL을 해석해주는 객체
	ResultSet rs; //DB에서 select한 결과를 담는다
	
	
	// DAO 객체 생성시 Connnection 도 생성
	public WriteDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			// ====== 이거두 지우기
			System.out.println("WriteDAO() 생성, db연결!!");
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
	
	
	// 새글 작성 <-- 제목, 내용, 작성자
	public int jin_b_insert(int u_uid, String catagory, String title, String content,
			List<String> originalFileNames,List<String> fileSystemNames) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_INSERT);
			pstmt.setInt(1, u_uid);
			pstmt.setString(2, catagory);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			// 파일 넣기
			pstmt.setNString(5, fileSystemNames.get(0)); // 증빙자료
			pstmt.setNString(6, fileSystemNames.get(1)); // 첨부파일
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	} // end insert()
	
	
	// ResultSet => DTO배열로 리턴 여기서 회원테이블과 조인해서 회원 닉네임값 받아오기
	public WriteDTO [] createArray(ResultSet rs) throws SQLException {
		// 받아오는 파라메타를 배열로 변환시켜준다
		WriteDTO [] arr = null;
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int b_uid = rs.getInt("b_uid");
			int u_uid = rs.getInt("u_uid");
			String catagory = rs.getString("catagory");
			String title = rs.getString("title");
			String content = rs.getString("content");
			if(content == null) content = "";
			int viewcnt = rs.getInt("viewcnt");
			String file1 = rs.getString("file1");
			String file2 = rs.getString("file2");
			
			String u_nickname = rs.getString("u_nickname");
			
			Date d = rs.getDate("b_regdate");
			Time t = rs.getTime("b_regdate");
			
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			WriteDTO dto = new WriteDTO(b_uid, u_uid, catagory, title, content, viewcnt,
					file1, file2, u_nickname);
			dto.setB_regdate(regDate);
			
			list.add(dto);
		} // end while
		
		int size = list.size();
		if(size == 0) return null;
		
		arr = new WriteDTO[size];
		list.toArray(arr); // 리스트 -> 배열 변환
		
		return arr;
	} // end createArray()
	
	
	// 전체 글 SELECT
	public WriteDTO [] select(String catagory) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_SELECT);
			pstmt.setString(1, catagory);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end select()
	
	
	// 특정 uid 의 글 만 SELECT
	public WriteDTO [] selectByUid(int b_uid) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_SELECT_BY_BUID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectByUid()
	
	
	// 특정 uid 의 글 내용 읽기 + 조회수 증가
	public WriteDTO [] readByUid(int b_uid) throws SQLException {
		int cnt = 0;
		WriteDTO [] arr = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, b_uid);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_SELECT_BY_BUID);
			pstmt.setInt(1, b_uid);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			conn.commit(); // 트랜잭션 성공!
		} catch (SQLException e) {
			conn.rollback(); // 트랜잭션 실패시 rollback()
			throw e;
		} finally {
			close();
		} // end try
		
		return arr;
	} // end readByUid()
	
	
	// 특정 uid 글 수정 (제목, 내용)
	public int update(int b_uid, String title, String content) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, b_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end update()
	
	
	// 특정 uid 글 삭제, dao는 데이터 전담
	public int deleteByUid(int b_uid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.JIN_B_WRITE_DELETE_BY_BUID);
			pstmt.setInt(1, b_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end deleteByUid(()
	
	
}
