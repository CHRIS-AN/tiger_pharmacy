package yesol.command;

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
import yesol.beans.WriteDAO;



public class Jin_UpdateCommand implements Command {

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
		String encoding = "utf-8"; // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책
		MultipartRequest multi = null;

		File folder = new File(saveDirectory);
		folder.mkdir();
		
		try {
			multi = new MultipartRequest(
					request, saveDirectory, maxPostSize, encoding, policy);
		} catch(IOException e){
			e.printStackTrace();
		}
		
		
		// 업로드 될 파일 원본이름, 저장이름 받아오기
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();

		Enumeration names = multi.getFileNames();
		System.out.println("nams : " + names);
		
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
		
		// 3. 삭제될 첨부파일(들) -> DB에서 삭제, 물리적 파일도 삭제
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		String [] delFiles = multi.getParameterValues("delfile");
		
		if(delFiles != null && delFiles.length > 0) { // 삭제할 대상 파일이 있다면

			try {
				dao.deleteByFileBUid(b_uid, delFiles , request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if

		
		// 4. 입력한 값을 받아오기
		String title = multi.getParameter("title");
		String content = "방문병원: " + multi.getParameter("hospital") + 
				", 방문일자: " + multi.getParameter("visit") + 
				", 증상: " + multi.getParameter("symptom") + 
				", 내용: " + multi.getParameter("content");
		
		System.out.println("originalFileNames : " + originalFileNames);
		System.out.println("fileSystemNames : " + fileSystemNames);
		System.out.println("b_uid : " + b_uid);

		if(title != null && title.trim().length() > 0) {

			try {
				dao = new WriteDAO();
				cnt = dao.jin_b_update
						(b_uid, title, content, originalFileNames, fileSystemNames, delFiles);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute("result", cnt);
		request.setAttribute("uid", b_uid); // MultiPart 로 받은 uid 값을 updateOK.jsp로 넘긴다.
	}

}
