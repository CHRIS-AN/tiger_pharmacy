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

		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		int u_uid = Integer.parseInt(request.getParameter("u_uid"));
		String reply = request.getParameter("reply");
		
		if(reply != null && reply.trim().length() > 0) {
			try {
				cnt = dao.com_insert(b_uid, u_uid, reply);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end try
		} // end if
		request.setAttribute("result", cnt);
	}
}
