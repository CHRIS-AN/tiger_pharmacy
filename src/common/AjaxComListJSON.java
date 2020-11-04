package common;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import yesol.beans.ComDTO;

public class AjaxComListJSON {
	int count; // 데이터 갯수
	String status; // 처리 결과
	
	@JsonProperty("data") // 매핑할 JSon Property
	List<ComDTO> comments; // 댓글 데이터

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ComDTO> getComments() {
		return comments;
	}

	public void setComments(List<ComDTO> comments) {
		this.comments = comments;
	}
}
