package jungmin.beans;

public class NonReplyDTO {
	private int c_uid; // c_uid 댓글고유번호
	private int u_uid; // u_uid 회원 고유번호
	private int b_uid; // b_uid 게시글 고유번호.
	private String c_nickname; // c_nickname 댓글 비회원 닉네임
	private String c_pw; // c_pw 댓글 비회원 비밀번호
	private String reply; //  reply 댓글 내용
	private String c_regdate; // c_regdate 댓글 작성 날짜.
	private String u_nickname;
	
	public NonReplyDTO(int c_uid, String c_pw) {
		super();
		this.c_uid = c_uid;
		this.c_pw = c_pw;
	}
	
	
	public NonReplyDTO(int c_uid, int u_uid, int b_uid, String c_nickname,String u_nickname, String c_pw, String reply) {
		super();
		this.c_uid = c_uid;
		this.u_uid = u_uid;
		this.b_uid = b_uid;
		this.c_nickname = c_nickname;
		this.c_pw = c_pw;
		this.reply = reply;
		this.u_nickname = u_nickname;
	}
	
	public NonReplyDTO(int c_uid, int b_uid, String c_nickname, String reply ,String c_pw) {
		super();
		this.c_uid = c_uid;
		this.b_uid = b_uid;
		this.c_nickname = c_nickname;
		this.c_pw = c_pw;
		this.reply = reply;
	}

	public int getC_uid() {
		return c_uid;
	}

	public void setC_uid(int c_uid) {
		this.c_uid = c_uid;
	}

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}

	public int getB_uid() {
		return b_uid;
	}

	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}

	public String getC_nickname() {
		return c_nickname;
	}

	public void setC_nickname(String c_nickname) {
		this.c_nickname = c_nickname;
	}

	public String getC_pw() {
		return c_pw;
	}

	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}



	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	@Override
	public String toString() {
		return "nonReplyDTO [c_uid=" + c_uid + ", u_uid=" + u_uid + ", b_uid=" + b_uid + ", c_nickname=" + c_nickname
				+ ", c_pw=" + c_pw + ", reply=" + reply + ", c_regdate=" + c_regdate + "]";
	}
	
	
	
}
