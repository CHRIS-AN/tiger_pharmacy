package yesol.beans;

public class ComDTO {
	private int c_uid; // 댓글번호
	private int b_uid; // 게시글번호
	private int u_uid; // 회원번호
	private String com_name; // com_name
	private String reply; // reply
	private String c_regdate;
	
	
	public ComDTO() {
		super();
		System.out.println("comDTO() 객체 생성");
	}

	public ComDTO(int c_uid, int b_uid, int u_uid, String com_name, String reply) {
		super();
		this.c_uid = c_uid;
		this.b_uid = b_uid;
		this.u_uid = u_uid;
		this.com_name = com_name;
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

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
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
