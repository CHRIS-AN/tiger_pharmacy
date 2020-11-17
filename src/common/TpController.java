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
import jungmin.command.J_ListCommand;
import jungmin.command.LoginChkCommand;
import jungmin.command.SelectCommand;
import jungmin.command.UpdateCommand;
import jungmin.command.ViewCommand;
import jungmin.command.WriteCommand;
import jungmin.command.nonORuserChkCommand;
import jungmin.command.pwChkCommand;
import yeonji.command.DeleteJoinUser;
import yeonji.command.DuplicateNickCommand;
import yeonji.command.EmailPWChk;
import yeonji.command.GoogleLoginCommand;
import yeonji.command.JoinOkCommand;
import yeonji.command.MainListCommand;
import yeonji.command.UpdateUserImpo;
import yeonji.command.searchHeaderCommand;
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
import yesol.command.Jin_DownloadCommand;
import yesol.command.Jin_DeleteCommand;
import yesol.command.Jin_FindWriterCommand;
import yesol.command.Jin_ListCommand;
import yesol.command.Jin_SearchCommand;
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
      if(com.substring(com.lastIndexOf("/")).equals("/search-header.tp")) {
         com = "/layout" + com.substring(com.lastIndexOf("/"));
         System.out.println("com: " + com + "\n");
      }
      Command command = null;  // 1. 어떠한 로직을 수행할지 결정
      String viewPage = null;  // 2. 어떠한 페이지를(뷰) 보여줄지 결정


      ////////////////-----------------------------안정민------------------------//////////////////////////////////////////////////////////////////////
      switch(com) {
      case "/jungmin/nonList.tp":
         command = new J_ListCommand();  // 1. 커맨드(로직) 결정
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


      case "/jungmin/nonORuserChk.tp":
         command = new nonORuserChkCommand();
         command.execute(request, response);
         viewPage = "nonORuserChk.jsp";


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
         // 진료톡 클릭 시, 로그인 상태인지 chk!
      case "/yeonsub/loginChk.tp":
         command = new LoginChkCommand();
         command.execute(request, response);
         viewPage = "loginAlert.jsp";
         break;
         
         // 연섭 영역 --------------------------------------------------------------------------침범 노노
         //////////////////////////////////////
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
      case "/redirect.tp":
         command = new GoogleLoginCommand();
         command.execute(request, response);
         viewPage = "/yeonji/joinImpo-google.jsp";
         break;
         
      case "/googleLogin.tp":
         command = new GoogleLoginCommand();
         command.execute(request, response);
         viewPage = "/yeonji/loginOk.jsp";
         break;
         
         // ==============================================================================
         // ★★★★★★★★ 예솔예솔 ★★★★★★★★
      case "/yesol/Jin_b_list.tp":
         new Jin_ListCommand().execute(request, response);
         viewPage = "Jin_b_list.jsp"; // 2.페이지(뷰) 결정
         break;
         
      case "/yesol/Jin_b_search.tp":
         new Jin_SearchCommand().execute(request, response);
         viewPage = "Jin_b_list.jsp";
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

      case "/yesol/download.tp":
         new Jin_DownloadCommand().execute(request, response);
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
         // ==============================================================================

         // ★★★★★★★★ 연쥐스 ★★★★★★★★
         
      case "/layout/index.tp":
         new MainListCommand().execute(request, response);
         viewPage = "index.jsp";
         break;   
		case "/yeonji/login.tp":
			viewPage = "login.jsp";
			break;
		case "/login.tp":
			viewPage = "login.jsp";
			break;
			
		case "/yeonji/joinSelect.tp":
			viewPage = "joinSelect.jsp";
			break;
			
		case "/yeonji/joinBrowsewrap.tp":
			viewPage = "joinBrowsewrap.jsp";
		break;
		
		case "/yeonji/emailChk.tp":
			viewPage = "emailChk.jsp";
		break;
		
		case "/yeonji/emailChkOk.tp":
			viewPage = "emailOk.jsp";
		break;
		
		case "/yeonji/joinImpo-email.tp":
			viewPage = "joinImpo-email.jsp";
		break;
		
		case "/yeonji/joinImpo-emailOk.tp":
			new JoinOkCommand().execute(request, response);
			viewPage = "joinOk.jsp";
			break;
		case "/joinImpo-googleOk.tp":
			new JoinOkCommand().execute(request, response);
			viewPage = "/yeonji/googleJoinOk.jsp";
			break;
			
		case "/yeonji/MailSend.tp":
			new MailSend().execute1(request, response);
			break;
			
		case "/yeonji/pwfind.tp":
			viewPage = "pwfind.jsp";
			break;
			
		case "/yeonji/pwfindEmailChkAction.tp":
			viewPage = "pwfindEmailChkAction.jsp";
			break;
			
		case "/yeonji/pwFindAction.tp":
			viewPage = "pwFindAction.jsp";
			break;
			
		case "/yeonji/pwChange.tp":
			viewPage = "pwChange.jsp";
			break;
			
		case "/usernickcheck.tp":
			new DuplicateNickCommand().execute(request, response);
			break;
		case "/yeonji/usernickcheck.tp":
			new DuplicateNickCommand().execute(request, response);
			break;
			
		case "/layout/search-header.tp":
			new searchHeaderCommand().execute(request, response);
			viewPage = "../yeonji/search-header.jsp";
			break;
			
		case "/yeonji/EmailPWChk.tp":
			new EmailPWChk().execute1(request, response);
			break;
			
		case "/yeonji/myPage.tp":
			viewPage = "myPage.jsp";
			break;
			
		case "/yeonji/myPage3.tp":
			viewPage = "myPage3.jsp";
			break;
			
		case "/yeonji/myPage4.tp":
			viewPage = "myPage4.jsp";
			break;
			
		case "/yeonji/myPage4OK.tp":
			new DeleteJoinUser().execute(request, response);
			viewPage = "deleteOK.jsp";
			break;
			
		case "/yeonji/myPage3Ok.tp":
			new UpdateUserImpo().execute(request, response);
			viewPage = "updateUserOK.jsp";
			break;
		}

      if(viewPage != null) {
         RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
         dispatcher.forward(request, response);
      }
   }
}
