package jungmin.command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.Command;
import jungmin.beans.AjaxReplyList;

import jungmin.beans.NonReplyDTO;

public class J_AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String reqType = request.getParameter("reqType");
		if(reqType == null ) { 
			reqType = "json";
		}
		
		switch (reqType) {
		case "json":
			respJSON(request, response);
			break;

		default:
			respJSON(request, response);
			break;
		}
	}

	private void respJSON(HttpServletRequest request, HttpServletResponse response) {
		
		NonReplyDTO [] dtoArr = (NonReplyDTO [] )request.getAttribute("list");
		
		AjaxReplyList list = new AjaxReplyList();
		
		if(dtoArr == null) {
			list.setStatus("Fail");
		}else {
			list.setStatus("OK");
			list.setCount(dtoArr.length);
			list.setList(Arrays.asList(dtoArr));	
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = mapper.writeValueAsString(list);
			response.setContentType("application/json; charset=utf-8");
			System.out.println("ajax 데이터 잘 드들어왔늬??? 비번 chk " +jsonString);
			response.getWriter().write(jsonString);

		}catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
