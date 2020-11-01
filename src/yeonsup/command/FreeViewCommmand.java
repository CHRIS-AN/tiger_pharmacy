package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.CommentDAO;
import yeonsup.beans.CommentDTO;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;
import yeonsup.beans.UserDAO;

public class FreeViewCommmand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		FreeTalkDAO b_dao = new FreeTalkDAO();
		UserDAO u_dao = new UserDAO();
		FreeTalkDTO b_dto = null;
		CommentDTO c_dto = null;
		
		
		// 1. 게시글 정보 댓글들 
		// - 댓글 정보 && - 유저 닉네임
		b_dto = b_dao.selectFTList_byBuid(b_uid);
		
		
		
		// 2. 게시글에 대한 유저 정보
		
		
		
		
		
		

	}

}
