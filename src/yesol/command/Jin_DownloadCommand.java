package yesol.command;

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
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;

public class Jin_DownloadCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO fileDao = new WriteDAO();
		WriteDTO [] fileArr = null;

		int b_uid = Integer.parseInt(request.getParameter("b_uid"));

		FileInputStream in = null;
		ServletOutputStream sout = null;

		try {
			fileArr = fileDao.selectByBUid(b_uid);

			String fileSystemName = fileArr[0].getFile2();

			String downloadFilePath = request.getServletContext().getRealPath("upload")
					+ File.separator + fileSystemName;

			String fileType = request.getServletContext().getMimeType(downloadFilePath);

			// 유형이 지정되지 않은 파일의 경우
			if(fileType == null) {
				fileType = "application/octet-stream";
			}

			System.out.println("downloadFilePath: " + downloadFilePath);
			System.out.println("파일유형(MIME): " + fileType);

			// response 세팅
			response.setContentType(fileType);
			response.setHeader("Content-Disposition", "attachment; filename=" +
					URLEncoder.encode(fileSystemName, "utf-8"));

			// 파일 읽기 -> 전송
			File srcFile = new File(downloadFilePath);
			in = new FileInputStream(srcFile);
			sout = response.getOutputStream();

			byte [] buff = new byte[(int)srcFile.length()];  //  파일크기만큼의 버퍼 준비

			int numRead = 0;
			int totalRead = 0;

			while((numRead = in.read(buff, 0, buff.length)) != -1) {
				totalRead += numRead;
				sout.write(buff, 0, numRead);
			}
			System.out.println("전송 byte: " + totalRead);			

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

	}
}
