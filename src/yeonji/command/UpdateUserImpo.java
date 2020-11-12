package yeonji.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import yeonji.beans.JoinUserDAO;
import yeonji.beans.JoinUserDTO;

@WebServlet("/updateUser")
public class UpdateUserImpo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateUserImpo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UpdateUserImpo 시작");
		int cnt=0;

		HttpSession session = request.getSession();
		Integer u_uid = (Integer)session.getAttribute("u_uid"); 
		
		String u_nickname = request.getParameter("nickname");
		String u_pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		
		JoinUserDTO dto = new JoinUserDTO();
		dto.setU_uid(u_uid);
		dto.setU_nickname(u_nickname);
		dto.setU_pw(u_pw);
		dto.setGender(gender);
		
		JoinUserDAO dao = JoinUserDAO.getInstance();
		try {
			cnt = dao.updateUser(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("cnt : "+ cnt);
		request.setAttribute("result", cnt);
	}

}
