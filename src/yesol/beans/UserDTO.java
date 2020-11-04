package yesol.beans;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class UserDTO {
	
	private int u_uid;
	private String u_nickName;
	private String pw;
	private String email;
	private String name;
	private String gender;
	private String birth;
	
	public UserDTO(int u_uid, String u_nickName, String pw, String email, String name, String gender, String birth) {
		super();
		this.u_uid = u_uid;
		this.u_nickName = u_nickName;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
	}
	
	

	public int getU_uid() {
		return u_uid;
	}
	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}
	public String getu_nickName() {
		return u_nickName;
	}
	public void setu_nickName(String u_nickName) {
		this.u_nickName = u_nickName;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
