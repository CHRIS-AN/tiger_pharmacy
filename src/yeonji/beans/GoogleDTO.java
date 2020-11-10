package yeonji.beans;

public class GoogleDTO {
	private String id;
	private String email;
	private String verified_email;
	private String picture;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVerified_email() {
		return verified_email;
	}
	public void setVerified_email(String verified_email) {
		this.verified_email = verified_email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Override
	public String toString() {
		return "GoogleDTO [id=" + id + ", email=" + email + ", verified_email=" + verified_email + ", picture="
				+ picture + "]";
	}
}
