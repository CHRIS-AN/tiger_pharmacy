package jungmin.beans;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class UserDto {
	private int u_uid;
	private String u_nickname;
	private String u_pw;
	private String email;
	private String name;
	private String gender;
	private Date birth;
	private int age;

	
	public UserDto(int u_uid, String u_nickname) {
		super();
		this.u_uid = u_uid;
		this.u_nickname = u_nickname;
	}
	
	
	public UserDto(int u_uid, String u_nickname, String u_pw, String email, String name, String gender) {
		super();
		this.u_uid = u_uid;
		this.u_nickname = u_nickname;
		this.u_pw = u_pw;
		this.email = email;
		this.name = name;
		this.gender = gender;
	}
	
	
	public UserDto(int u_uid, String u_nickname, String name, String gender, Date birth) {
		super();
		this.u_uid = u_uid;
		this.u_nickname = u_nickname;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		
		setAge(birth);
	}
	
	public int getAge() {

		return age;
	}

	
	
	private void setAge(Date birth) {
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
	
	

	public UserDto(int u_uid) {
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

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

}
