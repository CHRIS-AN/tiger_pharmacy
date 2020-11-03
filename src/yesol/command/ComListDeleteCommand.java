package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.ComDAO;


public class ComListDeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		ComDAO dao = new ComDAO();
		
		int c_uid = Integer.parseInt(request.getParameter("c_uid"));
		
		try {
			cnt = dao.deleteByUid(c_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}
}
