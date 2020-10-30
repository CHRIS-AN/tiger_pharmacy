package jungmin.beans;

public class NonDTO {
	private int b_uid;   // b_uid  게시판 고유번호
	private String b_nickname;  // b_nickname 게시판 닉네임
	private String b_pw; // b_pw 
	//-- ↓ 회원과도 공유가 되는 변수--------	
	private String title; // title
	private String content;  // content
	private int viewCnt;  // viewcnt
	private String b_regDate; // b_regdate
	
	
	public NonDTO(int b_uid, String b_nickname, String b_pw, String title, int viewCnt) {
		super();
		this.b_uid = b_uid;
		this.b_nickname = b_nickname;
		this.b_pw = b_pw;
		this.title = title;
		this.content = content;
		this.viewCnt = viewCnt;
	}


	public int getB_uid() {
		return b_uid;
	}
	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}
	public String getB_nickname() {
		return b_nickname;
	}
	public void setB_nickname(String b_nickname) {
		this.b_nickname = b_nickname;
	}
	public String getB_pw() {
		return b_pw;
	}
	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
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

}
