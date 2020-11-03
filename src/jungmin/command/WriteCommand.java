package jungmin.command;

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
import jungmin.beans.NonDAO;

public class WriteCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		System.out.println("업로드 경로 : " + saveDirectory);
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(
					request,
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		}catch (Exception e) {
			e.printStackTrace();
		}
		// 2. 업로드된 ㅏㅍ일의 원본이름(들)과 저장된 이름들을 받아오기.
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();
		
		Enumeration names = multi.getFileNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			String fileSystemName = multi.getFilesystemName(name);
			
			System.out.println("첨부파일 : " + originalFileName + " ->" + fileSystemName);
			
			if(originalFileName != null && fileSystemName != null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
		}
		
		//입력한 값을 받아오기
		String b_nickname = multi.getParameter("b_nickname");
		String b_pw = multi.getParameter("b_pw");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		

		// 유효성 체크 : null 이거나, 빈 문자열이면
		if(b_nickname != null && title != null &&
				b_nickname.trim().length() > 0 && title.trim().length() > 0) {
			
			try {

				cnt = dao.insert(b_nickname, b_pw, title, content, originalFileNames, fileSystemNames);
			} catch(SQLException e) {
				e.printStackTrace();
			} 		
			
		} // end if
		
		request.setAttribute("result", cnt);	

	}

}
