package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jungmin.command.DeleteCommand;
import jungmin.command.DownloadCommand;
import jungmin.command.ListCommand;
import jungmin.command.SelectCommand;
import jungmin.command.UpdateCommand;
import jungmin.command.ViewCommand;
import jungmin.command.WriteCommand;
import jungmin.command.pwChkCommand;
import yeonji.command.JoinOkCommand;
import yeonji.mail.MailSend;
import yeonsup.command.FreeDeleteCommmand;
import yeonsup.command.FreeDownloadCommand;
import yeonsup.command.FreeTalkCommand;
import yeonsup.command.FreeUpdateOkCommand;
import yeonsup.command.FreeViewCommmand;
import yeonsup.command.FreeWriteCommand;
import yeonsup.command.FreeWriteOkCommand;
import yeonsup.command.searchCommand;
import yeonsup.command.FreeUpdateCommand;
import yesol.command.Jin_DeleteCommand;
import yesol.command.Jin_FindWriterCommand;
import yesol.command.Jin_ListCommand;
import yesol.command.Jin_SelectCommand;
import yesol.command.Jin_UpdateCommand;
import yesol.command.Jin_ViewCommand;
import yesol.command.Jin_WriteCommand;

@WebServlet("*.tp")
public class TpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TpController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actioncTp(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actioncTp(request, response);
	}

	protected void actioncTp (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		System.out.println("actionTp() 호출\n");

		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com + "\n");
		
		Command command = null;  // 1. 어떠한 로직을 수행할지 결정
		String viewPage = null;  // 2. 어떠한 페이지를(뷰) 보여줄지 결정


		////////////////-----------------------------안정민------------------------//////////////////////////////////////////////////////////////////////
		switch(com) {
		case "/jungmin/nonList.tp":
			command = new ListCommand();  // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "nonList.jsp";   // 2. 페이지(뷰) 결정
			break;

		case "/jungmin/nonWrite.tp":
			viewPage = "nonWrite.jsp";
			break;

		case "/jungmin/nonWriteOk.tp":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "nonWriteOk.jsp";
			break;

		case "/jungmin/nonView.tp":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "nonView.jsp";
			break;

		case "/jungmin/pwChkD.tp":	
			command = new pwChkCommand();
			command.execute(request, response);
			viewPage = "pwChkD.jsp";
			break;

		case "/jungmin/pwChkU.tp":	
			command = new pwChkCommand();
			command.execute(request, response);
			viewPage = "pwChkU.jsp";
			break;


		case "/jungmin/nonUpdate.tp":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "nonUpdate.jsp";
			break;

		case "/jungmin/nonUpdateOk.tp":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "nonUpdateOk.jsp";
			break;

		case "/jungmin/nonDeleteOk.tp":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "nonDeleteOk.jsp";
			break;
			// 파일다운로드
		case "/jungmin/nonDownload.tp":
			command = new DownloadCommand();
			command.execute(request, response);
			break;
			// 연섭 영역 --------------------------------------------------------------------------침범 노노
		case "/yeonsub/freeTalk.tp":
			command = new FreeTalkCommand();
			command.execute(request, response);
			viewPage = "freeTalk.jsp";
			break;
		case "/yeonsub/freeWrite.tp":
			command = new FreeWriteCommand();
			command.execute(request, response);
			viewPage = "freeWrite.jsp";
			break;
		case "/yeonsub/freeWriteOk.tp":
			System.out.println("여기도?");
			command = new FreeWriteOkCommand();
			command.execute(request, response);
			viewPage = "freeWriteOk.jsp";
			break;
		case "/yeonsub/freeView.tp":
			command = new FreeViewCommmand();
			command.execute(request, response);
			viewPage = "freeView.jsp";
			break;
		case "/yeonsub/freeDeleteOk.tp":
			command = new FreeDeleteCommmand();
			command.execute(request, response);
			viewPage = "freeDeleteOk.jsp";
			break;
		case "/yeonsub/freeUpdateOk.tp":
			command = new FreeUpdateOkCommand();
			command.execute(request, response);
			viewPage = "freeUpdateOk.jsp";
			break;
		case "/yeonsub/freeUpdate.tp":
			command = new FreeUpdateCommand();
			command.execute(request, response);
			viewPage = "freeUpdate.jsp";
			break;
		case "/yeonsub/download.tp":
			command = new FreeDownloadCommand();
			command.execute(request, response);
			break;
		case "/yeonsub/searchList.tp":
			command = new searchCommand();
			command.execute(request, response);
			viewPage = "freeTalk.jsp";
			break;	
			
			// ★★★★★★★★ 예솔예솔 ★★★★★★★★
		case "/yesol/Jin_b_list.tp":
			new Jin_ListCommand().execute(request, response);
			viewPage = "Jin_b_list.jsp"; // 2.페이지(뷰) 결정

			break;

		case "/yesol/Jin_b_write.tp":
			new Jin_FindWriterCommand().execute(request, response);
			viewPage = "Jin_b_write.jsp";
			break;

		case "/yesol/Jin_b_writeOk.tp":
			new Jin_WriteCommand().execute(request, response);
			viewPage = "Jin_b_writeOk.jsp";
			break;

		case "/yesol/Jin_b_view.tp":
			new Jin_ViewCommand().execute(request, response);
			viewPage = "Jin_b_view.jsp";
			break;

		case "/yesol/Jin_b_update.tp":
			new Jin_SelectCommand().execute(request, response);
			viewPage = "Jin_b_update.jsp";
			break;

		case "/yesol/Jin_b_updateOk.tp":
			new Jin_UpdateCommand().execute(request, response);
			viewPage = "Jin_b_updateOk.jsp";
			break;

		case "/yesol/Jin_b_deleteOk.tp":
			new Jin_DeleteCommand().execute(request, response);
			viewPage = "Jin_b_deleteOk.jsp";
			break;
		
			// ★★★★★★★★ 연쥐스 ★★★★★★★★
			
		case "/yeonji/joinImpo-emailOk.tp":
			new JoinOkCommand().execute(request, response);
			viewPage = "joinOk.jsp";
			break;
		
		case "/yeonji/login.tp":
			viewPage = "login.jsp";
			break;	
			
		case "/yeonji/MailSend.tp":
			new MailSend().execute(request, response);
			break;
			
		} // end switch
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}

