package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.ComDAO;


public class ComListUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ComDAO dao = new ComDAO();
		
		int c_uid = Integer.parseInt(request.getParameter("c_uid"));
		String reply = request.getParameter("reply");
		
		if(reply != null) {
			try {
				cnt = dao.update(c_uid, reply);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
	}
}
