package yeonji.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import yeonji.beans.JoinUserDAO;
import yeonji.beans.JoinUserDTO;

public class EmailPWChk{

	public void execute1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("EmailPWChk 시작");
		JoinUserDTO dto = null;
		
		String userEmail = request.getParameter("userEmail");
		String pw = request.getParameter("pw");
		
		JoinUserDAO dao = JoinUserDAO.getInstance();
		try {
			dto = dao.emailPWChk(userEmail, pw);
			System.out.println("자바userEmail:"+userEmail);
			System.out.println("자바pw:"+pw);
			System.out.println("dto : "+dto);
		
			if(dto != null) {
				if(dto.getEmail().equals(userEmail)&& dto.getU_pw().equals(pw)) { //로그인 성공
					HttpSession session = request.getSession();
					session.setAttribute("u_uid", dto.getU_uid());
					session.setAttribute("email", dto.getEmail());
					
					response.setContentType("text/plain; charset=utf-8");
					response.getWriter().write("1");
				}else if(dto.getEmail().equals(userEmail)&&!dto.getU_pw().equals(pw)) { //비밀번호 불일치
					
					response.setContentType("text/plain; charset=utf-8");
					response.getWriter().write("0");
				}
			}else{ //해당아이디 없음
				
				response.setContentType("text/plain; charset=utf-8");
				response.getWriter().write("-1");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return;
	}

}
