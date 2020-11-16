package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jungmin.command.J_AjaxListCommand;
import jungmin.command.nonReplyDeleteCommand;
import jungmin.command.nonReplyListCommand;
import jungmin.command.nonReplyUpdateCommand;
import jungmin.command.nonReplyWriteCommand;
import jungmin.command.replyChkPswCommand;
import yeonsup.beans.CommentDAO;
import yeonsup.command.AjaxListCommand;
import yeonsup.command.ListCommand;
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
		
		int b_uid = 0;
		int c_uid = 0;
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("uri :" + uri + ", conPath :" + conPath + ", com : " + com);

		switch(com) {
		// ★★★★★★★★ 예솔 ★★★★★★★★
		case "/yesol/commentList.ajax":
			new CommentListCommand().execute(request, response);
			new AjaxComListCommand().execute(request, response);
			break;
			
		case "/yesol/comList_Insert.ajax":
			new ComListInsertCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxComListCommand().execute(request, response);
			break;
			
		case "/yesol/comList_Delete.ajax":
			new ComListDeleteCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxComListCommand().execute(request, response);
			break;
			
		case "/yesol/comList_Update.ajax":
			new ComListUpdateCommand().execute(request, response);
			break;
			
		// 김연섭 영역 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		case "/yeonsub/insert.ajax":
			// 댓글 삽입하기
			new CommentDAO().insertComment(request);
			
			new ListCommand().execute(request, response);	 // 일단 글 목록 읽어오기
			new AjaxListCommand().execute(request, response);// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			break;
		case "/yeonsub/list.ajax":

			new ListCommand().execute(request, response);    // 일단 글 목록 읽어오기
			new AjaxListCommand().execute(request, response);// 읽어 온 데이터를 다음 커맨드에 넘겨줌.
			
			break;
		case "/yeonsub/del.ajax":
			c_uid = Integer.parseInt(request.getParameter("c_uid"));
			
			new CommentDAO().deleteComment(c_uid);
			new ListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			
			break;
		case "/yeonsub/update.ajax": // 글 목록 Ajax 요청
			String reply = request.getParameter("reply");
			c_uid = Integer.parseInt(request.getParameter("c_uid"));
			
			new CommentDAO().updateComment(c_uid, reply);
			new ListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			
			break;
		//연쥐쓰~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	

			
			
		//정민쓰!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
			
		case "/jungmin/nonView.ajax":
			new nonReplyListCommand().execute(request, response);
			new J_AjaxListCommand().execute(request, response);
			break;
	
		case "/jungmin/nonWrite.ajax":
			new nonReplyWriteCommand().execute(request, response);
			new nonReplyListCommand().execute(request, response);
			new J_AjaxListCommand().execute(request, response);
			break;
			
		case "/jungmin/nonUpdateOk.ajax":
			new nonReplyUpdateCommand().execute(request, response);	
			new nonReplyListCommand().execute(request, response);
			new J_AjaxListCommand().execute(request, response);
			break;
			
			
		case "/jungmin/nonDeleteOk.ajax": // 댓글 데이터 삭제 ajax 맵핑
			new nonReplyDeleteCommand().execute(request, response);
			new nonReplyListCommand().execute(request, response);
			new J_AjaxListCommand().execute(request, response);
			break;
			
		case "/jungmin/nonPswChk.ajax":
			new replyChkPswCommand().execute(request, response);
			//new J_AjaxListCommand().execute(request, response);
			break;
			
		}
			
		
	}

}
