package jungmin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.UserDto;

public class LoginChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//  이 곳은 진료톡을 클릭 했을 시, 회원일 경우에는 진료톡 커뮤니티를 볼 수 있게,
		//  					 	비회원일 경우에는 로그인 하라는 알림창이 뜰 수 있게,
		
		NonDAO dao = new NonDAO();
		UserDto [] arr = null;
		
		String u_uid = request.getParameter("u_uid");
		// 현재는 u_uid가 널값일 것이다!!!!!!
		if(u_uid == null)
			request.setAttribute("result", 0);

	}

}
