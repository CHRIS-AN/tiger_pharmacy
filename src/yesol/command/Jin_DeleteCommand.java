package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;


public class Jin_DeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println("b_uid" + b_uid);
		
		try {
			cnt = dao.deleteByBUid(b_uid, request);
		}catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}
}
