package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class pwChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;		
		NonDAO dao = new NonDAO();
		NonDTO [] arr = null;
		
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		try {
			
			arr = dao.pwChk(b_uid);
			request.setAttribute("psw", arr);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
