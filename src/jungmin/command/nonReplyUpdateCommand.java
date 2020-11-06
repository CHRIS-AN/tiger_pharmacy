package jungmin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonReplyDTO;

public class nonReplyUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println("수정 b_uid " + b_uid);
		int c_uid = Integer.parseInt(request.getParameter("c_uid"));
		System.out.println("수정 c_uid :" + c_uid);
		String reply = request.getParameter("reply");
		System.out.println("수정 reply : " + reply);
		
		if(reply != null && reply != "") {
			try {
				cnt = dao.replyUpdate(b_uid, c_uid, reply);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
