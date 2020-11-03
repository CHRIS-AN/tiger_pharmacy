package yesol.command;

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
import yesol.beans.WriteDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		
		// 파일 생성 -> 업로드
		ServletContext context = request.getServletContext();
		// 서블릿 상의 upload 폴더 경로 읽어오기
		String saveDirectory = context.getRealPath("upload");
		// ====== 여기 지우기
		System.out.println("업로드 경로 : " + saveDirectory);
		
		int maxPostSize = 5 * 1024 * 1024; // 파일 용량 최대 5M
		String encoding = "utf-8"; // respone 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(
					request, saveDirectory, maxPostSize, encoding, policy);
		} catch(IOException e){
			e.printStackTrace();
		}
		
		// 업로드 될 파일 원본이름, 저장이름 받아오기
		List<String> originalFileNames= new ArrayList<String>();
		List<String> fileSystemNames= new ArrayList<String>();
		
		Enumeration names = multi.getFileNames();
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			String fileSystemName = multi.getFilesystemName(name);
			
			// ===== 여기 지우기
			System.out.println("첨부파일: " + originalFileName + "->" + fileSystemName);
			
			if(originalFileName != null && fileSystemName != null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
		} // end while
		
		// 입력한 값 받아오기
		String u_nickName = multi.getParameter("u_nickName");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		if(u_nickName != null && title != null &&
			u_nickName.trim().length() > 0 && content.trim().length() > 0) {
			 try {
				 cnt = dao.wr_insert(title, content, u_nickName, originalFileNames, fileSystemNames);
			 } catch(SQLException e) {
				 e.printStackTrace();
			 }
		} // end if
		request.setAttribute("result", cnt);
	} // end execute()
} // end WriteCommand
