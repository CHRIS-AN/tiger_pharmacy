package jungmin.beans;

public class NonDTO {
	private int b_uid;   // b_uid  게시판 고유번호
	private String b_nickname;  // b_nickname 게 시판 닉네임
	private String b_pw; // b_pw 
	//-- ↓ 회원과도 공유가 되는 변수--------	
	private int u_uid;  // u_uid  회원 고유번호
	private String catagory;
	private String file1; // file1  증빙서류 
	private String file2; // file2  첨부파일
	private String title; // title
	private String content;  // content
	private int viewCnt;  // viewcnt
	private String b_regDate; // b_regdate


<<<<<<< HEAD

	public NonDTO(int b_uid, String b_nickname, String b_pw, int u_uid, String file1, String file2, String title,
			String content, int viewCnt) {
=======
	public NonDTO(int b_uid, String b_nickname, String b_pw, String title, int viewCnt) {
>>>>>>> branch 'master' of https://github.com/CHRIS-AN/tiger_pharmacy.git
		super();
		this.b_uid = b_uid;
		this.b_nickname = b_nickname;
		this.b_pw = b_pw;
		this.u_uid = u_uid;
		this.file1 = file1;
		this.file2 = file2;
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

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}

	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
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
