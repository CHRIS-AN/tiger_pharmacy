package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.Jin_UserDAO;
import yesol.beans.Jin_UserDTO;

public class Jin_FindWriterCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Jin_UserDAO dao = new Jin_UserDAO();
		Jin_UserDTO [] arr = null;
		
		int u_uid = Integer.parseInt(request.getParameter("u_uid"));
		
		try {
			arr = dao.selectByUid(u_uid);
			
			request.setAttribute("nowuser", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
