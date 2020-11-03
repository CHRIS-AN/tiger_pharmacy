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
			+ "(b_uid, b_nickname, b_pw, U_UID ,CATAGORY ,title, content, B_REGDATE) "
			+ "VALUES"
			+ "(tp_board_seq.nextval, ?, ?, tp_board_seq.nextval, 'free', ?, ?, SYSDATE)";
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
	// 게시판 조회수
	public static final String N_B_WRITE_INC_VIEWCNT =
	"UPDATE TP_BOARD SET viewcnt = viewcnt + 1 WHERE b_uid = ?";
	// 게시판 작성한 글 볼 때 용.
	public static final String N_B_WRITE_SELECT_UID =
			"SELECT * FROM TP_BOARD WHERE b_uid = ?";
	// 게시판 작성 글 수정.
	public static final String N_B_WRITE_UPDATE_UID = "UPDATE tp_board SET title = ?, content = ?, file2 = ? where b_uid = ? ";
	// 게시판 작성 글 삭제.
	public static final String N_B_WRITE_DELETE_UID = 
							"DELETE FROM tp_board WHERE b_uid = ?";

	
	
	
	
//-------첨부 파일----------------------------------
	public static final String N_FILE_INSERT = "";
	public static final String N_FILE_SELECT = "";
	public static final String N_FILE_SELECT_UID = "";
	
	public static final String N_FILE_DELETE = "";
	public static final String N_FILE_DELETE_UID = "";
	
	
	public static final String FILE_SOURCE_SELECT_UID = "select file2 from TP_BOARD where b_uid = ?";
	
	
	
	
//-------댓글 테이블 --------------------------------
	public static final String N_C_INSERT_BY_B_UID = 
							"select tp_comments.*, tp_user.u_nickName from tp_comments, tp_user where b_uid = ?";
	public static final String N_C_WRITE_SELECT = "";
	
}
