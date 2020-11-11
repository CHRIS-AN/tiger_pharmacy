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

	try {
		arr = dao.replySelect(b_uid);
		request.setAttribute("list", arr);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}