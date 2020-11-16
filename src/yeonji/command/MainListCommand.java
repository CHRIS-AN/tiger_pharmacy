package yeonji.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;


public class MainListCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String [] catagory = {"jin_bi", "jin_jung", "free"};
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		int pageRows = 5;
		int curPage = 1;
		
		for (String cate : catagory) {
			try {
				dao = new WriteDAO();
				
				arr = dao.select(cate, curPage, pageRows);
			
	
				request.setAttribute(cate, arr);
				
			} catch(SQLException e) {
				e.printStackTrace();
			} // end try
		
		}
		
	}

} // end execute()

