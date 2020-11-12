package yesol.beans;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Jin_UserDTO {
	
	private int u_uid;
	private String u_nickName;
	private String pw;
	private String email;
	private String name;
	private String gender;
	private Date birth;
	private int age;
	
	public Jin_UserDTO(int u_uid, String u_nickName, String pw, String email, String name, String gender, Date birth) {
		super();
		this.u_uid = u_uid;
		this.u_nickName = u_nickName;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		
		setAge(birth);
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

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(Date birth) {
		int a = 0;
		
		Date d = birth;
		
		int birthYear = 0;
		int birthMonth = 0;
		int birthDay = 0;
		if(d != null) {
			birthYear = Integer.parseInt(new SimpleDateFormat("yyyy").format(d));
			birthMonth = Integer.parseInt(new SimpleDateFormat("mm").format(d));
			birthDay = Integer.parseInt(new SimpleDateFormat("dd").format(d));
		}
		
		Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
       
        a = currentYear - birthYear;
        
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)  
            a--;
        
		this.age = a;
	}

}
