package yesol.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;
import yeonsup.beans.UserDAO;
import yeonsup.beans.UserDTO;
import yesol.beans.Jin_UserDAO;
import yesol.beans.Jin_UserDTO;
import yesol.beans.WriteDAO;
import yesol.beans.WriteDTO;


public class Jin_ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean f_cnt = false;
		String str = request.getParameter("b_uid");
		
		if(str.equals("")) {
			return;
		}
		
		int b_uid = Integer.parseInt(str);
		
		Cookie[] cookies = request.getCookies();
		Cookie cookieview = null;
		
		if(cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("B_cookie")) {
					cookieview = cookies[i];
				}
			}
		}
		System.out.println(cookieview);
		
		if(cookieview == null) {
			String cookieName = "B_cookie";
			Cookie nCookie = new Cookie(cookieName,""+b_uid);
			nCookie.setMaxAge(60*30);
			response.addCookie(nCookie);
			f_cnt = true;
		} else {
			String value = cookieview.getValue();
			System.out.println(value.indexOf("" + b_uid));
			if(value.indexOf("" + b_uid) < 0) {
				value = value + "" + b_uid;
				cookieview.setValue(value);
				response.addCookie(cookieview);
				f_cnt = true;
			}
		}
		
		
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		Jin_UserDAO u_dao = new Jin_UserDAO();
		Jin_UserDTO u_dto = null;

		try {
			// 트랜잭션 수행
			arr = dao.readByUid(b_uid, f_cnt); // 읽기 + 조회수 증가

			request.setAttribute("list", arr);
			
			u_dto = u_dao.selectByUid(arr[0].getU_uid());

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(u_dto != null) {
			request.setAttribute("user", u_dto);
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