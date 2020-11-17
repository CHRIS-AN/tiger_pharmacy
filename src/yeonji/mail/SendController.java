package yeonji.mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Send")
public class SendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SendController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		
		//DB 저장 했다고 가정 (DB에는 emailAuth 필드가 있어야 하고 최초에는 0이 저장되어 있음) 1 인증 0 미인증
		
		//DB에 저장했으니 google email 인증 페이지로 이동
		response.sendRedirect("/tiger_pharmacy/yeonji/pwFindAction.tp?email="+email);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
