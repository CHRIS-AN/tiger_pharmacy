package yesol.command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.AjaxComListJSON;
import common.Command;
import yesol.beans.ComDTO;

public class AjaxComListCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String reqType = request.getParameter("reqType");

		if(reqType == null) reqType = "json";
		
		switch(reqType) {
		default:
			responseJSON(request, response);
			break;
		}
	}

	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		ComDTO [] dtoArr = (ComDTO [])request.getAttribute("com_list");
		
		AjaxComListJSON com_list = new AjaxComListJSON(); // response 할 Java 객체
		
		if(dtoArr == null) {
			com_list.setStatus("FAIL");
		} else {
			com_list.setStatus("OK");
			com_list.setCount(dtoArr.length);
			com_list.setComments(Arrays.asList(dtoArr));
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = mapper.writeValueAsString(com_list);
			System.out.println(jsonString.toString());
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
