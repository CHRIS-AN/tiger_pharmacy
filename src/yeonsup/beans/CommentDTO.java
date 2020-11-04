package yeonsup.beans;

public class CommentDTO {
	
	private int c_uid;
	private int b_uid;
	private int u_uid;
	private String c_nickName;
	private String c_pw;
	private String reply;
	private String c_regdate;
	private String u_nickName;
	
	public CommentDTO(int c_uid, int b_uid, int u_uid, String c_nickName, String c_pw, String reply) {
		super();
		this.c_uid = c_uid;
		this.b_uid = b_uid;
		this.u_uid = u_uid;
		this.c_nickName = c_nickName;
		this.c_pw = c_pw;
		this.reply = reply;
	}

	public String getU_nickName() {
		return u_nickName;
	}

	public void setU_nickName(String u_nickName) {
		this.u_nickName = u_nickName;
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
	public String getC_nickName() {
		return c_nickName;
	}
	public void setC_nickName(String c_nickName) {
		this.c_nickName = c_nickName;
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
}
