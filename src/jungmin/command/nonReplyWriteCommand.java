package jungmin.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;

public class nonReplyWriteCommand implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)  {
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		String c_nickname = "Guest_" + request.getParameter("c_nickname");
		String c_pw = request.getParameter("c_pw");
		String reply = request.getParameter("reply");
		
		
		if(c_nickname != null && c_pw != null && 
				c_nickname.trim().length() > 0 && c_pw.trim().length() > 0) {
				
			try {
				cnt = dao.replyInsert(b_uid, c_nickname, c_pw, reply);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		request.setAttribute("result", cnt);
		}
	}
}
