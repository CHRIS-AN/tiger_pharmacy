package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jungmin.command.AjaxListCommand;
import jungmin.command.ListCommand;
import jungmin.command.nonReplyDeleteCommand;
import jungmin.command.nonReplyListCommand;
import jungmin.command.nonReplyUpdateCommand;
import jungmin.command.nonReplyWriteCommand;

@WebServlet("*.ajax" )
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxController() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request,response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아자슥 메소드 호출된 것이다");
		
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩중!!!
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String ajaxPath = uri.substring(conPath.length());
		System.out.println("com ="  + ajaxPath );
		
		switch (ajaxPath) { //*.ajax 가 뜨면 나오는 것
		case "/jungmin/nonView.ajax":
			new nonReplyListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;

		case "/jungmin/nonWrite.ajax":
			new nonReplyWriteCommand().execute(request, response);
			new nonReplyListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;
			
		case "/jungmin/nonUpdateOk.ajax":
			new nonReplyUpdateCommand().execute(request, response);	
			new nonReplyListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;
			
			
		case "/jungmin/nonDeleteOk.ajax": // 댓글 데이터 삭제 ajax 맵핑
			new nonReplyDeleteCommand().execute(request, response);
			new nonReplyListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;
			
		}
		
	}

}
