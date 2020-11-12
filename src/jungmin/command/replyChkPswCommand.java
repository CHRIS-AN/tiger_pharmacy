package jungmin.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonReplyDTO;

public class replyChkPswCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		NonDAO dao = new NonDAO();
		NonReplyDTO [] arr = null;

		
		int c_uid = Integer.parseInt(request.getParameter("c_uid"));
		String userPsw = request.getParameter("userPsw");


		try {
			
			arr = dao.replyPsw(c_uid);
			if(arr[0].getC_pw().equals(userPsw)) {
				response.setContentType("text/plain; charset=utf-8");
				response.getWriter().write("1");
			}else {
				response.setContentType("text/plain; charset=utf-8");
				response.getWriter().write("0");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
