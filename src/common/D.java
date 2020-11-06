package common;

public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "chris_k";
	public static final String USERPW = "lion_b";

//-------회원--------------------------------------
	public static final String U_Insert = 
			"INSERT INTO TP_USER(u_uid, u_nickname, u_pw, email, name, gender, birth) VALUES(tp_USER_seq.nextval, ?, ?, ?, ?, ?, ?)";
	
	public static final String U_SELECT_UID = 
			"select * from tp_user where u_uid = ?";


//-------게시판 테이블 --------------------------------

	// 사용자가 게시판에 글을 작성한 글을 DB에 넣기
	public static final String N_B_INSERT = 
			"INSERT INTO TP_BOARD"
					+ "(b_uid, b_nickname, b_pw, U_UID ,CATAGORY ,title, content, B_REGDATE, file2_source, file2) "
					+ "VALUES"
					+ "(tp_board_seq.nextval, ?, ?, tp_board_seq.nextval, 'free', ?, ?, SYSDATE, ?, ?)";
	public static final String F_B_INSERT = 
			"INSERT INTO tp_board"
			+ "(b_uid, title, content, u_uid, catagory, b_regdate, file2) "
			+ "VALUES"
			+ "(tp_board_seq.nextval, ?, ?, ?, ?, SYSDATE, ?)";
	// 게시판 총 리스트 
	public static final String N_B_WRITE_SELECT = 
			"SELECT * FROM tp_board ORDER BY b_uid DESC";
	// 게시판 총 리스트 -- 연섭
	public static final String B_SELECT_USER_JOIN = 
			"SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = ? and tp_board.u_uid = tp_user.u_uid (+) ORDER BY b_uid DESC";
	// 게시판 작성한글 볼때 (회원)
	public static final String B_SELECT_USER_JOIN_BY_B_UID = 
			"SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where TP_BOARD.b_uid = ? ORDER BY b_uid DESC";

	public static final String N_B_WRITE_INC_VIEWCNT =
			"UPDATE TP_BOARD SET viewcnt = viewcnt + 1 WHERE b_uid = ?";
	// 게시판 작성한 글 볼 때 용.
	public static final String N_B_WRITE_SELECT_UID =
			"SELECT * FROM TP_BOARD WHERE b_uid = ?";
	// 게시판 비밀번호 확인용.
	public static final String N_B_WRITE_PWCHK = 
			"SELECT B_PW, B_UID FROM TP_BOARD WHERE B_UID = ?";
	// 게시판 작성 글 수정.
	public static final String F_B_WRITE_UPDATE_UID = "UPDATE tp_board SET title = ?, content = ?, file2 = ? where b_uid = ? ";
	public static final String N_B_WRITE_UPDATE_UID = 
			"UPDATE TP_BOARD SET TITLE = ?, CONTENT = ?, FILE2_SOURCE = ?, FILE2 = ? WHERE B_UID = ?";
	// 게시판 작성 글 삭제.
	public static final String N_B_WRITE_DELETE_UID = 
							"DELETE FROM tp_board WHERE b_uid = ?";
	// 게시판 페이징
	public static final String F_B_LIST_SELECT_FROM =
							"SELECT * FROM " +
							"(SELECT rownum AS RNUM, T.* FROM " + 
							"(SELECT TP_BOARD.*, TP_USER.U_nickName FROM TP_BOARD, TP_USER where catagory = ? and TP_BOARD.u_uid = TP_USER.u_uid (+) ORDER BY b_uid DESC) T) " +
							"WHERE RNUM >= ? AND RNUM < ?"
							;
	
	
	
	// ★★★★★★★★ 진료톡 ★★★★★★★★
	public static final String JIN_B_WRITE_INSERT = 
			"INSERT INTO tp_board"
			+ "(B_UID, U_UID, CATAGORY ,TITLE, CONTENT, VIEWCNT, B_REGDATE, FILE1, FILE2) "
			+ "VALUES"
			+ "(TP_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, 0, SYSDATE, ?, ?)";
	
	// 게시글 내림차순으로
	public static final String JIN_B_WRITE_SELECT = 
	         "SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = ?"
	         + " and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC";
	
	// 게시글 선택
	public static final String JIN_B_WRITE_SELECT_BY_BUID =
			"SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where b_uid = ? and tp_board.u_uid = tp_user.u_uid";
	
	// 조회수 증가
	public static final String JIN_B_WRITE_INC_VIEWCNT =
			"UPDATE tp_board SET VIEWCNT = VIEWCNT + 1 WHERE b_uid=?";
	
	// 해당 게시글에  제목 내용 업데이트하기
	public static final String JIN_B_WRITE_UPDATE =
			"UPDATE tp_board SET title = ?, content = ? "
			+ ", B_REGDATE = SYSDATE FILE1 = ? FILE2 = ? WHERE b_uid = ?";
	
	// 게시글 삭제
	public static final String JIN_B_WRITE_DELETE_BY_BUID =
			"DELETE FROM tp_board WHERE b_uid=?";
	// ★★★★★★★★ 진료톡 end ★★★★★★★★
	
	
//-------첨부 파일----------------------------------
	public static final String N_FILE_INSERT = "";
	//파일 뷰
	public static final String N_FILE_SELECT = 
			"SELECT b_uid, file2_source, file2 FROM TP_BOARD WHERE b_uid = ?";

	public static final String N_FILE_SELECT_UID = "";
<<<<<<< HEAD
=======

	public static final String N_FILE_DELETE = "";
	
	public static final String FILE_SOURCE_SELECT_UID = "select file2 from TP_BOARD where b_uid = ?";
>>>>>>> branch 'master' of https://github.com/CHRIS-AN/tiger_pharmacy.git
	
	public static final String N_FILE_DELETE_UID =
			"DELETE FROM TP_BOARD WHERE b_uid = ?";

// ----- 회원 연결하는 곳입니다 -------------------------
	
<<<<<<< HEAD
	public static final String U_SELECT =
			"SELECT * FROM tp_user ORDER BY u_uid DESC";
	
=======
>>>>>>> branch 'master' of https://github.com/CHRIS-AN/tiger_pharmacy.git
//-------댓글 테이블 --------------------------------
<<<<<<< HEAD
	
	// 해당 게시글의 댓글 데이터를 SELECT 하는 것. 유저 닉네임 포함해서 나오는 것.
	public static final String N_C_SELECT = 
"SELECT tp_comments.*, tp_user.u_nickName FROM tp_comments, tp_user where b_uid = ? AND tp_comments.u_uid = tp_user.u_uid (+) order by c_uid DESC";
	

	public static final String N_C_INSERT = 	// 게시글 INSERT 하는 것.
	"INSERT INTO "
	+ "TP_COMMENTS "
	+ "(C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) "
	+ "VALUES "
	+ "(tp_comments_seq.nextval, ?, '', ?, ?, ?, SYSDATE)";
	
	public static final String N_C_UPDATE = // 댓글 수정
			"UPDATE  tp_comments\r\n" + 
			"SET REPLY = ?\r\n" + 
			"WHERE c_uid = ? AND C_UID IN \r\n" + 
			"(SELECT C_UID\r\n" + 
			"FROM tp_comments\r\n" + 
			"WHERE b_uid in\r\n" + 
			"(SELECT b_uid \r\n" + 
			"FROM tp_board\r\n" + 
			"WHERE b_uid = ?))";
	

	public static final String COMMENT_VIEWCNT = 	// 댓글 총 갯수 파악 및 갯수 증가
	"UPDATE TP_USER  SET c_viewcnt = C_VIEWCNT +1 WHERE c_uid = ?";
		
	public static final String N_C_DELETE =
			"DELETE \r\n" + 
			"FROM TP_COMMENTS\r\n" + 
			"WHERE c_uid = ? AND C_UID IN \r\n" + 
			"(SELECT C_UID\r\n" + 
			"FROM TP_COMMENTS\r\n" + 
			"WHERE b_uid in\r\n" + 
			"(SELECT B_UID \r\n" + 
			"FROM TP_BOARD\r\n" + 
			"WHERE B_UID = ?))";
	
=======
	public static final String N_C_INSERT_BY_B_UID = 
							"select tp_comments.*, tp_user.u_nickName from tp_comments, tp_user where b_uid = ?";
	public static final String N_C_WRITE_SELECT = "";

	// 진료톡 댓글
	public static final String M_COM_INSERT =
			"INSERT INTO tp_comments"
					+ "(c_uid, b_uid, u_uid, reply, c_regdate) "
					+ "VALUES" + "(tp_comments_seq.NEXTVAL, ?, ?, ?, SYSDATE)";

	// ★★★★★★★★ 예솔 - 회원댓글 ★★★★★★★★
	// 해당 게시글 댓글 리스트 뽑을 때
	public static final String M_COM_SELECT =
			 "SELECT TP_COMMENTS.*, tp_user.u_nickname FROM TP_COMMENTS, TP_USER where b_uid = ?"
			         + " and TP_COMMENTS.u_uid = tp_user.u_uid ORDER BY c_uid DESC";

	// 댓글수정
	public static final String M_COM_UPDATE =
			"UPDATE tp_comments SET reply = ?, c_regdate = SYSDATE WHERE c_uid = ?";

	// 댓글 삭제
	public static final String M_COM_DELETE_BY_COMUID =
			"DELETE FROM tp_comments WHERE c_uid = ?";

	// 게시글 삭제시 댓글삭제
	public static final String M_COM_DELETE_BY_WRUID =
			"DELETE FROM tp_comments WHERE b_uid = ?";
>>>>>>> branch 'master' of https://github.com/CHRIS-AN/tiger_pharmacy.git
}
