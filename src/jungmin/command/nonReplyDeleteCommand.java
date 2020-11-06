package jungmin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;

public class nonReplyDeleteCommand implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println("b_uid : " + b_uid );
		int c_uid = Integer.parseInt(request.getParameter("c_uid"));
		System.out.println("c_uid : " + c_uid);
		
		try {
			cnt = dao.replyDelete(b_uid, c_uid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", cnt);
	}
}
