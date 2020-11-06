package common;

public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "chris_k";
	public static final String USERPW = "lion_b";

//-------회원--------------------------------------
	
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
			+ "(b_uid, title, content, u_uid, catagory, b_regdate, file1) "
			+ "VALUES"
			+ "(tp_board_seq.nextval, ?, ?, ?, ?, SYSDATE, ?)";
	// 게시판 총 리스트 
	public static final String N_B_WRITE_SELECT = 
			"SELECT * FROM tp_board ORDER BY b_uid DESC";
	public static final String B_SELECT_USER_JOIN = 
			"SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER ORDER BY b_uid DESC";
	// 게시판 조회수
	
	public static final String N_B_WRITE_INC_VIEWCNT =
	"UPDATE TP_BOARD SET viewcnt = viewcnt + 1 WHERE b_uid = ?";
	// 게시판 작성한 글 볼 때 용.
	public static final String N_B_WRITE_SELECT_UID =
			"SELECT * FROM TP_BOARD WHERE b_uid = ?";
	// 게시판 비밀번호 확인용.
	public static final String N_B_WRITE_PWCHK = 
			"SELECT B_PW, B_UID FROM TP_BOARD WHERE B_UID = ?";
	// 게시판 작성 글 수정.
	public static final String N_B_WRITE_UPDATE_UID = 
			"UPDATE TP_BOARD SET TITLE = ?, CONTENT = ?, FILE2_SOURCE = ?, FILE2 = ? WHERE B_UID = ?";
	// 게시판 작성 글 삭제.
	public static final String N_B_WRITE_DELETE_UID = 
			"DELETE FROM TP_BOARD WHERE B_UID = ?";
	
	
//-------첨부 파일----------------------------------
	public static final String N_FILE_INSERT = "";
	//파일 뷰
	public static final String N_FILE_SELECT = 
			"SELECT b_uid, file2_source, file2 FROM TP_BOARD WHERE b_uid = ?";
	
	public static final String N_FILE_SELECT_UID = "";
	
	public static final String N_FILE_DELETE_UID =
			"DELETE FROM TP_BOARD WHERE b_uid = ?";

// ----- 회원 연결하는 곳입니다 -------------------------
	
	public static final String U_SELECT =
			"SELECT * FROM tp_user ORDER BY u_uid DESC";
	
//-------댓글 테이블 --------------------------------
	
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
	
}
