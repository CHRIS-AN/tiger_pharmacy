package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.ComDAO;
import yesol.beans.ComDTO;


public class CommentListCommand implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ComDAO dao = new ComDAO();
		ComDTO [] arr = null;
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		try {
			arr = dao.selectComByBUid(b_uid);
			request.setAttribute("com_list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
