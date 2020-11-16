package yeonsup.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.CommentDAO;
import yeonsup.beans.CommentDTO;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;
import yeonsup.beans.UserDAO;
import yeonsup.beans.UserDTO;

public class FreeViewCommmand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean f_cnt = false;
		String str = request.getParameter("b_uid");
		
		if(str.equals("")) {
			return;
		}
		
		int b_uid = Integer.parseInt(str);
		FreeTalkDAO b_dao = new FreeTalkDAO(); // 게시판 DAO
		FreeTalkDTO b_dto = null;			   // 게시판 DTO
		UserDTO u_dto = null;				   // 유저 DTO
		
		Cookie[] cookies = request.getCookies();
		Cookie cookieview = null;
		
		if(cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("B_cookie")) {
					cookieview = cookies[i];
				}
			}
		}
		
		System.out.println("cookieview : " + cookieview);
		
		if(cookieview == null) {
			String cookieName = "B_cookie";
			Cookie nCookie = new Cookie(cookieName,""+b_uid);
			nCookie.setMaxAge(60*30);
			response.addCookie(nCookie);
			f_cnt = true;
		} else {
			String value = cookieview.getValue();
			System.out.println("value.indexOf(\"\" + b_uid) : " + value.indexOf("" + b_uid));
			if(value.indexOf("" + b_uid) < 0) {
				value = value + "" + b_uid;
				cookieview.setValue(value);
				response.addCookie(cookieview);
				f_cnt = true;
			}
		}
		
		// 1. 게시글 정보 댓글들 
		// 	  - 댓글 정보와 유저 닉네임 가져오기
		try {
			b_dto = b_dao.selectFTList_byBuid(b_uid, f_cnt);
			request.setAttribute("board", b_dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(b_dto == null) {
			System.out.println("게시글 조회 실패");
			return;
		}
		
		System.out.println("board 쿼리 완료 ====== \n");
		
		
		// 첨부 파일 읽기
		if(b_dto != null) {
			try {
				if(b_dto.getFile() != null) {
					
					String realPath = request.getServletContext().getRealPath("upload");
					
					String downloadFilePath = realPath + File.separator + b_dto.getFile();
					System.out.println("파일 경로: " + downloadFilePath);
					BufferedImage imgData = ImageIO.read(new File(downloadFilePath));
					
					// 이미지 파일 여부 셋팅
					if(imgData != null) {
						b_dto.setImage(true); // 이미지 다!
					}
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("파일여부 확인 완료 ====== \n");
			
			UserDAO u_dao = new UserDAO(); // 유저 DAO
			u_dto = u_dao.selectByUid(b_dto.getU_uid());
		}
		
		// 2. 게시글에 대한 유저 정보
		
		if(u_dto != null) {
			request.setAttribute("user", u_dto);
		}
		
		System.out.println("user 쿼리 완료 ====== ");
		
	}

}
