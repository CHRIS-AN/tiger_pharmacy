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

		String [] catagory1 = {"jin_bi", "jin_jung", "free"};
		WriteDAO dao1 = new WriteDAO();
		WriteDTO [] arr1 = null;
		
		int pageRows1 = 5;
		int curPage1 = 1;
		
		for (String cate : catagory1) {
			try {
				dao1 = new WriteDAO();
				
				arr1 = dao1.select1(cate, curPage1, pageRows1);
			
	
				request.setAttribute(cate, arr1);
				
			} catch(SQLException e) {
				e.printStackTrace();
			} // end try
		
		}
		
	}

} // end execute()

