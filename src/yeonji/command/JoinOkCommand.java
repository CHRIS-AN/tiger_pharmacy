package yeonji.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonji.beans.JoinUserDAO;

public class JoinOkCommand implements Command {

	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt=0;
		JoinUserDAO dao = new JoinUserDAO();
		
		//입력한 값을 받아오기
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String birthY = request.getParameter("birthY");
		String birthM = request.getParameter("birthM");
		String birthD = request.getParameter("birthD");

		String gender = request.getParameter("gender");
		
		
		// 유효성 체크 : null 이거나, 빈 문자열이면
		//이메일로 회원가입
		if(name != null && nickname != null && !birthY.equals("none") && !birthM.equals("none") && !birthD.equals("none")
			&& pw.trim().length() > 0 && name.trim().length() > 0 && nickname.trim().length() > 0) {
			
			String birth = birthY + "-" + birthM + "-" + birthD;
			
			try {
				cnt = dao.insert(nickname, pw, email, name, gender, birth);
			} catch(SQLException e) {
				e.printStackTrace();
			} 		
			
		}
		//구글로 회원가입
		else if (pw == null &&  name != null && nickname != null && !birthY.equals("none") && !birthM.equals("none") && !birthD.equals("none")
				&& name.trim().length() > 0 && nickname.trim().length() > 0) {
			
			String birth = birthY + "-" + birthM + "-" + birthD;
			
			try {
				cnt = dao.insert(nickname, pw, email, name, gender, birth);
			} catch(SQLException e) {
				e.printStackTrace();
			} 		
			
		}
		
		request.setAttribute("result", cnt);	
	}

}
