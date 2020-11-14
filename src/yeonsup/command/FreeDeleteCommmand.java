package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.FreeTalkDAO;

public class FreeDeleteCommmand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int result = 0;
		int cnt = 0;
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		FreeTalkDAO dao = new FreeTalkDAO();
		cnt = dao.deleteByUid(b_uid, request);
		dao = new FreeTalkDAO();
		result = dao.deleteBoardByUid(b_uid);
		
		request.setAttribute("result", result);
		
	}

}
