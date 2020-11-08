package jungmin.command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.java.swing.plaf.windows.resources.windows;

import common.Command;
import jungmin.beans.AjaxReplyList;
import jungmin.beans.NonDTO;
import jungmin.beans.NonReplyDTO;

public class AjaxListCommand implements Command {

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
		// db에서 끌고 들어오는 것.
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
			System.out.println(jsonString);
			response.getWriter().write(jsonString);
			System.out.println("삭제 삭제삭제 샂게삭제");
		}catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
