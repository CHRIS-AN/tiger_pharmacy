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

public class WriteCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		NonDAO dao = new NonDAO();
		
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		System.out.println("�뾽濡쒕뱶 寃쎈줈 : " + saveDirectory);
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

		Enumeration<String> names = multi.getFileNames();
		
		if(names != null) {
			while (names.hasMoreElements()) {
				String name = (String) names.nextElement();
				String originalFileName = multi.getOriginalFileName(name);
				String fileSystemName = multi.getFilesystemName(name);
				
				System.out.println("泥⑤��뙆�씪 : " + originalFileName + " ->" + fileSystemName);
				
				if(originalFileName != null && fileSystemName != null) {
					originalFileNames.add(originalFileName);
					fileSystemNames.add(fileSystemName);
				}
			}
		}
		//�엯�젰�븳 媛믪쓣 諛쏆븘�삤湲�
		String b_nickname = multi.getParameter("b_nickname");
		String b_pw = multi.getParameter("b_pw");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		System.out.println("b_nickname :" + b_nickname );

		// �쑀�슚�꽦 泥댄겕 : null �씠嫄곕굹, 鍮� 臾몄옄�뿴�씠硫�
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
