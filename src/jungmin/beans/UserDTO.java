package jungmin.beans;

public class UserDTO {
	private int u_uid;
	private String u_nickname;
	private String u_pw;
	private String email;
	private String name;
	private String gender;
	private String birth;

	public UserDTO(int u_uid, String u_nickname, String u_pw, String email, String name, String gender) {
		super();
		this.u_uid = u_uid;
		this.u_nickname = u_nickname;
		this.u_pw = u_pw;
		this.email = email;
		this.name = name;
		this.gender = gender;
	}

	public UserDTO(int u_uid) {
		super();
		this.u_uid = u_uid;
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

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

}
