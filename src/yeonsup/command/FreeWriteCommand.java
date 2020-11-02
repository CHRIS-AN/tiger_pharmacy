package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.UserDAO;
import yeonsup.beans.UserDTO;

public class FreeWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String u_uid = request.getParameter("id");
		
		if(u_uid == null) {
			request.setAttribute("result", 0);
			return;
		}
		
		// 회원 정보 가져온다	
		
		UserDTO dto = null;
		UserDAO dao = new UserDAO();
		
		dto = dao.selectByUid(Integer.parseInt(u_uid));
		
		request.setAttribute("user", dto);
		
	}

}
