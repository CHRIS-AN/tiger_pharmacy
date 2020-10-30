package yeonsup.beans;

public class FreeTalkDTO {
	private int b_uid; // 게시판 고유번호
	private String b_ninckName; // 비회원 닉네임 -- 작성자
	private String b_pw; // 비회원 비밀번호
	private int u_uid; // 게시판 회원 고유번호
	private String title; // 게시판 제목
	private String content; // 게시판 내용
	private int viewCnt;  // viewcnt 조회수
	private String b_regDate; // b_regdate 등록일
	private String source; // bf_source
	private String file;   // bf_file
	private boolean isImage; // 이미지 여부
	
	
	public int getB_uid() {
		return b_uid;
	}
	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}
	public String getB_ninckName() {
		return b_ninckName;
	}
	public void setB_ninckName(String b_ninckName) {
		this.b_ninckName = b_ninckName;
	}
	public String getB_pw() {
		return b_pw;
	}
	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}
	public int getU_uid() {
		return u_uid;
	}
	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getB_regDate() {
		return b_regDate;
	}
	public void setB_regDate(String b_regDate) {
		this.b_regDate = b_regDate;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public boolean isImage() {
		return isImage;
	}
	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}
	
	
}
