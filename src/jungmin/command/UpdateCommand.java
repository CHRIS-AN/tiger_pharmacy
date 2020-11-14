package jungmin.command;

import java.io.File;
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
import jungmin.beans.NonDTO;

public class UpdateCommand implements Command {

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
		File folder = new File(saveDirectory);
		folder.mkdir();
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
		
		int b_uid = Integer.parseInt(multi.getParameter("b_uid"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		String delFile = multi.getParameter("delfile");
		
		if(delFile != null && delFile.length() > 0) { // 삭제할 대상 파일이 있다면
			try {
				cnt = dao.deleteByUid(b_uid, request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	
		}// end if
		
		
		dao = new NonDAO();
		
		if( title != null && title.trim().length() > 0) {
			try {
				cnt = dao.update(b_uid, title, content, originalFileNames, fileSystemNames, delFile);
				System.out.println("cnt :" + cnt );
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("update", cnt);
		request.setAttribute("b_uid", b_uid);
	}

}
