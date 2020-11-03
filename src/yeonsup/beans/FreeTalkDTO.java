package yeonsup.beans;

import java.util.List;

public class FreeTalkDTO {
	private int b_uid; // 게시판 고유번호
	private String b_nickName; // 비회원 닉네임 -- 작성자
	private String b_pw; // 비회원 비밀번호
	private int u_uid; // 게시판 회원 고유번호
	private String title; // 게시판 제목
	private String content; // 게시판 내용
	private int viewCnt;  // viewcnt 조회수
	private String b_regDate; // b_regdate 등록일
	private String source; // bf_source
	private String file;   // bf_file
	private boolean isImage; // 이미지 여부
	private String catagory;
	private String u_nickName;

	

	public FreeTalkDTO() {
		super();
	}



	public FreeTalkDTO(int b_uid, String b_nickName, String b_pw, int u_uid, String title, String content, int viewCnt, String catagory, String u_nickName) {
		super();
		this.b_uid = b_uid;
		this.b_nickName = b_nickName;
		System.out.println("b_nickName: " + b_nickName);
		this.b_pw = b_pw;
		this.u_uid = u_uid;
		this.title = title;
		this.content = content;
		this.viewCnt = viewCnt;
		this.catagory = catagory;
		this.u_nickName = u_nickName;
	}
	
	

	public FreeTalkDTO(int b_uid, String b_nickName, String b_pw, int u_uid, String title, String content, int viewCnt, String catagory) {
		super();
		this.b_uid = b_uid;
		this.b_nickName = b_nickName;
		this.b_pw = b_pw;
		this.u_uid = u_uid;
		this.title = title;
		this.content = content;
		this.viewCnt = viewCnt;
		this.b_regDate = b_regDate;
		this.catagory = catagory;
	}



	public String getU_nickName() {
		return u_nickName;
	}

	public void setU_nickName(String u_nickName) {
		this.u_nickName = u_nickName;
	}
	
	public String getCatagory() {
		return catagory;
	}
	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}
	public int getB_uid() {
		return b_uid;
	}
	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}
	public String getB_nickName() {
		return b_nickName;
	}
	public void setB_nickName(String b_nickName) {
		this.b_nickName = b_nickName;
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
