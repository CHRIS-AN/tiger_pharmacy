package yesol.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.Command;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;



public class Jin_SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;

		int b_uid = Integer.parseInt(request.getParameter("b_uid")); // 매개변수 검증 필요

		try {
			// 트랜잭션 수행
			arr = dao.selectByBUid(b_uid); // 읽기 only

			request.setAttribute("list", arr);
		}catch (SQLException e) {
			e.printStackTrace();
		}

		// 첨부파일 읽어오기
		try {

			String [] imgFiles = { arr[0].getFile1(), arr[0].getFile2()};

			for(String imgfile : imgFiles) {
				if(imgfile != null) {

					String realPath = 
							request.getServletContext().getRealPath("upload");

					String imporFile = realPath + File.separator + imgfile;
					System.out.println("파일 경로와 위치 : " + imporFile);
					BufferedImage imgData =
							ImageIO.read(new File(imporFile));
					if(imgData != null)
						arr[0].setImage1(true);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	} // end execute()
}
