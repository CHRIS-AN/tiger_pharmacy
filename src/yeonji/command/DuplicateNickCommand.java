package yeonji.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.Command;
import yeonsup.beans.UserDAO;

public class DuplicateNickCommand implements Command {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String nickname = request.getParameter("nickname");
		TreeMap map = new TreeMap();
		UserDAO dao = new UserDAO();
		
		boolean result = dao.duplicatenickCheck(nickname);
		
		if(!result) map.put("result", "0");
		else 	   map.put("result", "1");
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = mapper.writeValueAsString(map);
			System.out.println(jsonString.toString());
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
			
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
