package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		NonDAO dao = new NonDAO();
		NonDAO filedao = new NonDAO();
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		try {
			
			filedao.deleteByWrUid(b_uid, request);
			cnt = dao.deleteByUid(b_uid);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}
