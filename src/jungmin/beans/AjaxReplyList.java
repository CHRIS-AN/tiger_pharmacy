package jungmin.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AjaxReplyList {

	int count;
	String status;

	@JsonIgnore
	String memo; // 제외할 데이터 !!!!!

	@JsonProperty("data")
	List<NonReplyDTO> list;

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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public List<NonReplyDTO> getList() {
		return list;
	}

	public void setList(List<NonReplyDTO> list) {
		this.list = list;
	}
	
}
