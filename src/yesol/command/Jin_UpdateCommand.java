package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;



public class Jin_UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		//입력한 값을 받아오기
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if(title != null && title.trim().length() > 0) {
			
			try {
				cnt = dao.update(b_uid, title, content);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
