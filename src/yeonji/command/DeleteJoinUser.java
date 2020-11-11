package yeonji.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import yeonji.beans.JoinUserDAO;

@WebServlet("/delete")
public class DeleteJoinUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteJoinUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("DeleteJoinUser 시작");
		int cnt=0;
		
		HttpSession session = request.getSession();
		Integer u_uid = (Integer)session.getAttribute("u_uid"); 
		
		JoinUserDAO dao = JoinUserDAO.getInstance();
	
		try {
			cnt = dao.deleteUser(u_uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		Cookie[] cookies = request.getCookies() ;
	     
	    if(cookies != null){
	        for(int i=0; i < cookies.length; i++){
	             
	            // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
	            cookies[i].setMaxAge(0) ;
	             
	            // 응답 헤더에 추가한다
	            response.addCookie(cookies[i]) ;
	        }
	    }


		System.out.println("cnt : "+ cnt);
		request.setAttribute("result", cnt);
		
	}

}
