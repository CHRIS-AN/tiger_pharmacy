package yesol.beans;

public class ComDTO {
	private int c_uid; // 댓글번호
	private int b_uid; // 게시글번호
	private int u_uid; // 회원번호
	private String reply; // reply
	private String c_regdate;
	
	private String u_nickname; // 회원테이블에서 조인하는 sql문 만들기
	
	
	public ComDTO() {
		super();
		System.out.println("comDTO() 객체 생성");
	}

	public ComDTO(int c_uid, int b_uid, int u_uid, String u_nickname, String reply) {
		super();
		this.c_uid = c_uid;
		this.b_uid = b_uid;
		this.u_uid = u_uid;
		this.u_nickname = u_nickname;
		this.reply = reply;
	}

	
	public int getC_uid() {
		return c_uid;
	}

	public void setC_uid(int c_uid) {
		this.c_uid = c_uid;
	}

	public int getB_uid() {
		return b_uid;
	}

	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}
	
	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
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
}
