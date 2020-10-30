package yeonsup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;

@WebServlet("*.tp")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		
		// 컨트롤러는 아래 두가지를 결정해야 한다.
		Command command = null;  // 1. 어떠한 로직을 수행할지 결정
		String viewPage = null;  // 2. 어떠한 페이지를(뷰) 보여줄지 결정
		
		// 컨트롤러는 커맨드에 따라, 로직을 수행 하고
		// 결과를 내보낼 view 를 결정한다
	}
}
