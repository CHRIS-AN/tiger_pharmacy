package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		//입력한 값을 받아오기
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		
		// 유효성 체크 : null 이거나, 빈 문자열이면
		if(nickname != null && title != null &&
				nickname.trim().length() > 0 && title.trim().length() > 0) {
			
			try {
				cnt = dao.insert(nickname, password, title, content);
			} catch(SQLException e) {
				e.printStackTrace();
			} 		
			
		} // end if
		
		request.setAttribute("result", cnt);	

	}

}
