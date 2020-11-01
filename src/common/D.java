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
			+ "(b_uid, title, content, u_uid, catagory, b_regdate, file1) "
			+ "VALUES"
			+ "(tp_board_seq.nextval, ?, ?, ?, ?, SYSDATE, ?)";
	// 게시판 총 리스트 
	public static final String N_B_WRITE_SELECT = 
			"SELECT * FROM tp_board ORDER BY b_uid DESC";
	public static final String B_SELECT_USER_JOIN = 
			"SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER ORDER BY b_uid DESC";
	// 게시판 조회수
	public static final String N_B_WRITE_INC_VIEWCNT = "";
	// 게시판 작성한 글 볼 때 용.
	public static final String N_B_WRITE_SELECT_UID = "";
	// 게시판 작성 글 수정.
	public static final String N_B_WRITE_UPDATE_UID = "";
	// 게시판 작성 글 삭제.
	public static final String N_B_WRITE_DELETE_UID = "";
	
	
	
//-------첨부 파일----------------------------------
	public static final String N_FILE_INSERT = "";
	public static final String N_FILE_SELECT = "";
	public static final String N_FILE_SELECT_UID = "";
	
	public static final String N_FILE_DELETE = "";
	public static final String N_FILE_DELETE_UID = "";
	
	
	
	
	
//-------댓글 테이블 --------------------------------
	public static final String N_C_INSERT = "";
	public static final String N_C_WRITE_SELECT = "";
	
}
