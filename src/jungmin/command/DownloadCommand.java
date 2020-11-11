package jungmin.command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class DownloadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NonDAO dao = new NonDAO();
		NonDTO [] fileArr = null;
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		FileInputStream in = null;
		ServletOutputStream sout = null;
		
		try {
			fileArr = dao.selectFilesByWrUid(b_uid);
			
			String fileSystemName = fileArr[0].getFile2();
			String downloadFilePath = request.getServletContext().getRealPath("upload")
					+ File.separator + fileSystemName;
			
			String fileType = request.getServletContext().getMimeType(downloadFilePath);
			
			if(fileType == null) {
				fileType = "application/octet-stream";
			}
			System.out.println("downloadFilePath: " + downloadFilePath);
			System.out.println("파일유형 (MIME) : " + fileType);
			
			response.setContentType(fileType);
			response.setHeader("Content-Disposition", "attachment; filename=" +
								URLEncoder.encode(fileSystemName, "utf-8"));

			File srcFile = new File(downloadFilePath);
			in = new FileInputStream(srcFile);
			sout = response.getOutputStream();
			
			byte [] buff = new byte[(int)srcFile.length()];
			
			int numRead = 0;
			int totalRead = 0;
			
			while((numRead = in.read(buff, 0, buff.length)) != -1) {
				totalRead += numRead;
				sout.write(buff, 0, numRead);
			}
			System.out.println("byte: " + totalRead);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(sout != null) { 
					sout.flush();  // 마지막까지 완전히 전송하고.
					sout.close();
				}
				if(in != null) in.close();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} // end try

	} // end execute()

} // end Command

