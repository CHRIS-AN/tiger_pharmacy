package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.UserDTO;


public class nonORuserChkCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		NonDAO dao = new NonDAO();
//		UserDTO [] arr = null;
//		int result = 0;
//		int u_uid = Integer.parseInt(request.getParameter("u_uid"));
//		try {
//		 arr = dao.userSelect(u_uid);	 
//		
//		 }
//		 request.setAttribute("chk", arr);
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
		
	}
}
//// 회원 로그인 후 연결 할 부분.