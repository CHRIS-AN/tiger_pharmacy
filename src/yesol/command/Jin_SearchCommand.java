package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;

public class Jin_SearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		String catagory = request.getParameter("catagory");
		String word = "%" + request.getParameter("word") + "%";
		String searchCate = request.getParameter("search");
		
		try {
			arr = dao.search(catagory, word, searchCate);
			
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
