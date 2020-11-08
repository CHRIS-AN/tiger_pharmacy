package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Command;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.UserDAO;
import yeonsup.beans.UserDTO;

public class FreeWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		int u_uid = 0;
		System.out.println("session : " + session);
		if(session.getAttribute("u_uid") != null) {
			u_uid = (Integer)session.getAttribute("u_uid");
		}
		
		if(u_uid == 0) { // 회원 유무 판단
			request.setAttribute("result", 0);
			return;
		}
		
		// 회원 정보 가져온다	
		
		UserDTO dto = null;
		UserDAO dao = new UserDAO();
		
		dto = dao.selectByUid(u_uid);
		
		request.setAttribute("user", dto);
		
	}

}
