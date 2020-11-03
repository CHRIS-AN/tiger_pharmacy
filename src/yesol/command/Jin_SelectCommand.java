package yesol.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;



public class Jin_SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid")); // 매개변수 검증 필요
		
		try {
			// 트랜잭션 수행
			arr = dao.selectByUid(b_uid); // 읽기 only
			
			request.setAttribute("list", arr);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	} // end try
} // end execute()
