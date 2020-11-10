package yeonji.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;

public class EmailPWChk implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userEmail = request.getParameter("userEmail");
		String pw = request.getParameter("pw");
		
		
		
	}

}
