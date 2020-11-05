package yeonsup.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.CommentDAO;
import yeonsup.beans.CommentDTO;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CommentDAO dao = new CommentDAO();  // DAO 객체 생성
		CommentDTO [] arr = null;
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println("댓글 확인용 b_uid:" + b_uid);
		
		
		// 트랜잭션 수행
		arr = dao.select(b_uid);
		
		// "list" 란 name 으로 request 에 arr 값 저장
		// 즉, request 에 담아서 컨트롤러에 전달되는 셈
		request.setAttribute("list", arr);
		
	} // end execute()
} // end Command
