package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println("b_uid : " + b_uid);
		String title = request.getParameter("title");
		System.out.println("title :" + title);
		String content = request.getParameter("content");
		System.out.println("content :" + content);
		if( title != null && title.trim().length() > 0) {
			try {
				cnt = dao.update(b_uid, title, content);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("update", cnt);
	}

}
