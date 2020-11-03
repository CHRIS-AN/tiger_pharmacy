package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;


public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		String category = request.getParameter("category");
		
		try {
			arr = dao.select(category);
			
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	} // end try
	
} // end execute()

