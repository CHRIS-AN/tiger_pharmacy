package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeonsup.beans.CommentDAO;
import yeonsup.command.AjaxListCommand;
import yeonsup.command.ListCommand;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajaxAction() 호출");
		
		int b_uid = 0;
		int c_uid = 0;
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		switch(com) {
		case "/yeonsub/insert.ajax": // 글 목록 Ajax 요청
			// 댓글 삽입하기
			new CommentDAO().insertComment(request);
			// 일단 글 목록 읽어오기
			new ListCommand().execute(request, response);
			// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			new AjaxListCommand().execute(request, response);
			break;
		case "/yeonsub/list.ajax": // 글 목록 Ajax 요청
		
			// 일단 글 목록 읽어오기
			new ListCommand().execute(request, response);
			// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			new AjaxListCommand().execute(request, response);
			break;
		case "/yeonsub/del.ajax": // 글 목록 Ajax 요청
			
			c_uid = Integer.parseInt(request.getParameter("c_uid"));
			new CommentDAO().deleteComment(c_uid);
			
			// 일단 글 목록 읽어오기
			new ListCommand().execute(request, response);
			// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			new AjaxListCommand().execute(request, response);
			break;
		case "/yeonsub/update.ajax": // 글 목록 Ajax 요청
			String reply = request.getParameter("reply");
			c_uid = Integer.parseInt(request.getParameter("c_uid"));
			new CommentDAO().updateComment(c_uid, reply);
			
			// 일단 글 목록 읽어오기
			new ListCommand().execute(request, response);
			// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			new AjaxListCommand().execute(request, response);
			break;
		} // end switch

	} // end action()
	
}














