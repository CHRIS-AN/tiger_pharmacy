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
			"UPDATE TP_BOARD SET TITLE = ?, CONTENT = ? WHERE B_UID = ?";
	// 게시판 작성 글 삭제.
	public static final String N_B_WRITE_DELETE_UID = 
			"DELETE FROM TP_BOARD WHERE B_UID = ?";
	
	// ★★★★★★★★ 진료톡 ★★★★★★★★
	public static final String JIN_B_WRITE_INSERT = 
			"INSERT INTO tp_board"
			+ "(b_uid, title, content, u_nickname, b_regdate) "
			+ "VALUES"
			+ "(TP_BOARD_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
	
	// 게시글 내림차순으로
	public static final String JIN_B_WRITE_SELECT = 
	         "SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = ?"
	         + " and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC";
	
	// 게시글 선택
	public static final String JIN_B_WRITE_SELECT_BY_BUID =
			"SELECT * FROM tp_board WHERE b_uid=?";
	
	// 조회수 증가
	public static final String JIN_B_WRITE_INC_VIEWCNT =
			"UPDATE tp_board SET WR_VIEWCNT = WR_VIEWCNT + 1 WHERE b_uid=?";
	
	// 해당 게시글에  제목 내용 업데이트하기
	public static final String JIN_B_WRITE_UPDATE =
			"UPDATE tp_board SET title = ?, content = ? WHERE b_uid = ?";
	
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

	public static final String N_FILE_DELETE = "";
	public static final String N_FILE_DELETE_UID = "";





//-------댓글 테이블 --------------------------------
	public static final String N_C_INSERT = "";
	public static final String N_C_WRITE_SELECT = "";

	// 진료톡 댓글
	public static final String M_COM_INSERT =
			"INSERT INTO tp_comments"
					+ "(c_uid, com_name, reply, c_regdate, b_uid) "
					+ "VALUES" + "(tp_comments_seq.NEXTVAL, ?, ?, SYSDATE, ?)";

	// ★★★★★★★★ 예솔 - 회원댓글 ★★★★★★★★
	// 해당 게시글 댓글 리스트 뽑을 때
	public static final String M_COM_SELECT =
			"SELECT * FROM tp_comments WHERE b_uid = ?"
					+ " ORDER BY c_uid DESC";

	// 댓글수정
	public static final String M_COM_UPDATE =
			"UPDATE tp_comments SET reply = ?, c_regdate = SYSDATE WHERE c_uid = ?";

	// 댓글 삭제
	public static final String M_COM_DELETE_BY_COMUID =
			"DELETE FROM tp_comments WHERE c_uid = ?";

	// 게시글 삭제시 댓글삭제
	public static final String M_COM_DELETE_BY_WRUID =
			"DELETE FROM tp_comments WHERE b_uid = ?";
}
