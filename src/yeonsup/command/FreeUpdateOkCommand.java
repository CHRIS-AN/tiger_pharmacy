package yeonsup.command;

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

public class FreeUpdateOkCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		FreeTalkDAO dao = new FreeTalkDAO();
		// 1. 업로드 파일 MultiPartPartRequest
		ServletContext context = request.getServletContext();
		// 서블릿 상의 upload 폴더 경로를 알아온다
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로: " + saveDirectory);
		
		int maxPostSize = 5 * 1024 * 1024;  // POST 받기, 최대 5M byte :1Kbyte = 1024 byte, 1Mbyte = 1024 Kbyte
		String encoding = "utf-8";  // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책
		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트

		// MultipartRequest 생성 단계에서 이미 파일은 저장됨.
		try {
			multi = new MultipartRequest(
					request,                 // JSP 내부객체 request
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		} catch (IOException e1) {
			e1.printStackTrace();
		}



		// 2. 업로드 된 파일의 원본이름들과 저장 된 이름들 가져오기
		
		// 2. 업로드 된 파일의 '원본이름' 과 저장된이름들 받아오기
		String originalFileName = "";
		String FileSystemName = "";
		Enumeration names = multi.getFileNames();
		if(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			originalFileName = multi.getOriginalFileName(name);
			FileSystemName = multi.getFilesystemName(name);
			
			
			System.out.println("첨부파일 : " + originalFileName + "->" + FileSystemName);
		}

		// 3. 물리적 파일도 삭제
		
		int b_uid = Integer.parseInt(multi.getParameter("b_uid"));
		String delFile = multi.getParameter("delfile");	
		
		if(delFile.length() > 0 && delFile != null) { // 삭제할 대상 파일이 있다면
			
			dao.deleteByUid(b_uid, request);
	
		}// end if
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String catagory = multi.getParameter("catagory");
		
		// System.out.println("u_uid 의 값은 " + u_uid + "입니다.");
		// System.out.println("title 의 값은 " + title + "입니다.");
		
		// 유효성 체크 : null 이거나, 빈 문자열이면
		
		if(content != null && title != null &&
				content.trim().length() > 0 && title.trim().length() > 0) {
			dao = new FreeTalkDAO(); 
			
			cnt = dao.FreeUpdateByBuid(b_uid ,title, content, originalFileName, FileSystemName);
			
		} // end if
		
		
		
		// 6. 결과	
		request.setAttribute("result", cnt);
		request.setAttribute("b_uid", b_uid); // MultiPart 로 받은 uid 값을 updateOK.jsp 로 넘긴다.
	}
}
