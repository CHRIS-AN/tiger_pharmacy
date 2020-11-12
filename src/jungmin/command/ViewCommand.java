package jungmin.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;
import jungmin.beans.UserDto;
import yeonsup.beans.UserDAO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean f_cnt = false;
		NonDAO dao = new NonDAO(); // readByUid의 메소드를 사용하기위함으로 dao 생성자 객체를 만들어줌.
		NonDTO [] arr = null; // 이동을 위한 매개체의 공간을 만들어주어 null값으로 지정을해준다.
		NonDTO [] fileArr = null;

		
		
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		System.out.println(b_uid);
		// 넘어온 b_uid 값을  int화를 시켜서 b_uid 값에 넘어준다.
		
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
			System.out.println("value.indexOf(\"\" + b_uid) " + value.indexOf("" + b_uid));
			if(value.indexOf("" + b_uid) < 0) {
				value = value + "" + b_uid;
				cookieview.setValue(value);
				response.addCookie(cookieview);
				f_cnt = true;
			}
		}
		
		
		try {
			arr = dao.readByUid(b_uid, f_cnt); // 넘어온 b_uid값으로 readByUid 메소드에 변수에 넣어서 사용.
			
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", arr);
		
		NonDAO dao2 = new NonDAO();
		
		
		try {
			if(arr != null && arr.length == 1) {
				fileArr = dao2.selectFilesByWrUid(b_uid);
			String realPath = request.getServletContext().getRealPath("upload");
			
			for(NonDTO fileDto : fileArr) {
				String downloadFilePath = realPath + File.separator + fileDto.getFile2();
				BufferedImage imgData = ImageIO.read(new File(downloadFilePath));
				
				if(imgData != null) {
					fileDto.setImage(true);
				}
			}
			request.setAttribute("fileList", fileArr);
			
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		NonDAO userDao = new NonDAO();
		UserDto userArr = null;
		
		
		try {
			userArr = userDao.selectUser(b_uid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("user", userArr);
		
	}
}
