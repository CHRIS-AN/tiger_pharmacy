package yeonsup.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
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
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));
		
		FreeTalkDAO b_dao = new FreeTalkDAO(); // 게시판 DAO
		FreeTalkDTO b_dto = null;			   // 게시판 DTO
		UserDTO u_dto = null;				   // 유저 DTO
		
		
		// 1. 게시글 정보 댓글들 
		// 	  - 댓글 정보와 유저 닉네임 가져오기
		try {
			b_dto = b_dao.selectFTList_byBuid(b_uid);
			request.setAttribute("board", b_dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("board 쿼리 완료 ====== \n");
		
		
		// 첨부 파일 읽기
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
		
		
		// 2. 게시글에 대한 유저 정보
		UserDAO u_dao = new UserDAO(); // 유저 DAO
		u_dto = u_dao.selectByUid(b_dto.getU_uid());
		
		if(u_dto != null) {
			request.setAttribute("user", u_dto);
		}
		
		System.out.println("user 쿼리 완료 ====== ");
		
	}

}
