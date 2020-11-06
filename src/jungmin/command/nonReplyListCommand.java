package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonReplyDTO;

public class nonReplyListCommand implements Command {
	
	public void execute(HttpServletRequest request, HttpServletResponse response){
	NonDAO dao = new NonDAO();
	NonReplyDTO [] arr = null;
	
	int b_uid = Integer.parseInt(request.getParameter("b_uid"));
	System.out.println("여기는 list커맨드 삭제 다음 오는 곳");
	System.out.println(b_uid);
	try {
		arr = dao.replySelect(b_uid);
		System.out.println("arr :" + arr);
		request.setAttribute("list", arr);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}