package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NonDAO dao = new NonDAO();
		NonDTO [] arr = null;
		
		try {
			arr = dao.select();
			request.setAttribute("list", arr);
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
