package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.ComDAO;
import yesol.beans.ComDTO;


public class ComListInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ComDAO dao = new ComDAO();
		ComDTO [] arr = null;
		
		String com_name = request.getParameter("com_name");
		String reply = request.getParameter("reply");
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		if(com_name != null && reply != null &&
			com_name.trim().length() > 0 && reply.trim().length() > 0) {
			try {
				cnt = dao.com_insert(com_name, reply, b_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end try
		} // end if
		request.setAttribute("result", cnt);
	}
}
