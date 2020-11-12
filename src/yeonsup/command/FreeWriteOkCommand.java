package yeonsup.command;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.Command;
import yeonsup.beans.FreeTalkDAO;

public class FreeWriteOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("1번");
		int cnt = 0;
		FreeTalkDAO dao = new FreeTalkDAO();
		
		
		//1. MultipartRequest 생성 -> 파일업로드
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로: " + saveDirectory);
		File folder = new File(saveDirectory);
		folder.mkdir();
		
		int maxPostSize = 5 * 1024 * 1024;  					 // POST 받기, 최대 5M byte :1Kbyte = 1024 byte, 1Mbyte = 1024 Kbyte
		String encoding = "utf-8"; 								 // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책
		MultipartRequest multi = null; 							 // com.oreilly.servlet.MultipartRequest 임포트
		
		// MultipartRequest 생성 단계에서 이미 파일은 저장됨.
		try {
			
			multi = new MultipartRequest(
					request,                 
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
			
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		
		// 2. 업로드 된 파일의 '원본이름' 과 저장된이름들 받아오기
		String originalFileName = "";
		String FileSystemName = "";
		Enumeration names = multi.getFileNames();
		
		if(names.hasMoreElements()) {
			String name      = (String)names.nextElement();
			originalFileName = multi.getOriginalFileName(name);
			FileSystemName   = multi.getFilesystemName(name);
			
			System.out.println("첨부파일 : " + originalFileName + "->" + FileSystemName);
		}
		
		//입력한 값을 받아오기
		int u_uid = 0;
		if(!multi.getParameter("u_uid").equals("") || multi.getParameter("u_uid").length() > 0) {
			u_uid = Integer.parseInt(multi.getParameter("u_uid"));
			// u_uid = session.getAttribute("u_uid"); 로그인 구현 후 사용될 uid
		}
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String catagory = multi.getParameter("catagory");
		
		// ❤  널값 확인용 ❤
		// System.out.println("u_uid 의 값은 " + u_uid + "입니다.");
		// System.out.println("title 의 값은 " + title + "입니다.");
		// 유효성 체크 : null 이거나, 빈 문자열이면
		
		if(content != null && title != null &&
				content.trim().length() > 0 && title.trim().length() > 0) {
			System.out.println("content: " + content);
			cnt = dao.insertFreeTalk(title, content, u_uid, catagory, originalFileName, FileSystemName);
			
		} // end if
		
		System.out.println("글 작성 성공!!");
		request.setAttribute("result", cnt);	
	
	}

}
