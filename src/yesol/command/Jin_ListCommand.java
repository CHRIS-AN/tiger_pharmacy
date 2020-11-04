package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;


public class Jin_ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		String catagory = request.getParameter("catagory");
		
		try {
			arr = dao.select(catagory);
			
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	} // end try
	
} // end execute()

