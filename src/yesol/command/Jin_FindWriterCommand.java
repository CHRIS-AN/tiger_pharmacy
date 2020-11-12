package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Command;
import yesol.beans.Jin_UserDAO;
import yesol.beans.Jin_UserDTO;

public class Jin_FindWriterCommand implements Command{
	
	// 글작성시 해당 유저의 닉네임을 가져오기위해 사용

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int u_uid = (Integer)session.getAttribute("u_uid");
		
		Jin_UserDAO dao = new Jin_UserDAO();
		Jin_UserDTO dto = null;
		
		try {
			dto = dao.selectByUid(u_uid);
			
			request.setAttribute("nowuser", dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
