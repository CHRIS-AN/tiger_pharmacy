package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yesol.command.AjaxComListCommand;
import yesol.command.ComListDeleteCommand;
import yesol.command.ComListInsertCommand;
import yesol.command.ComListUpdateCommand;
import yesol.command.CommentListCommand;


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
		// -====== 이거두 지워야 한다!!
		System.out.println("AjaxActionDo() 호출");	
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// ========= 이거도 지워라!!!
		System.out.println("uri :" + uri + ", conPath :" + conPath + ", com : " + com);

		switch(com) {
		// ★★★★★★★★ 예솔 ★★★★★★★★
		case "/commentList.ajax":
			new CommentListCommand().execute(request, response);
			new AjaxComListCommand().execute(request, response);
			break;
			
		case "/comList_Insert.ajax":
			new ComListInsertCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxComListCommand().execute(request, response);
			break;
			
		case "/comList_Delete.ajax":
			new ComListDeleteCommand().execute(request, response);
			break;
			
		case "/comList_Update.ajax":
			new ComListUpdateCommand().execute(request, response);
			break;
			
		}
	
	}

}
