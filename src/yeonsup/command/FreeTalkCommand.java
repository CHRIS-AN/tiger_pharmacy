package yeonsup.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;

public class FreeTalkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FreeTalkDAO dao = new FreeTalkDAO();
		FreeTalkDTO [] arr = null;
		
		/*
		 총수량, 현재 페이지, 페이징에 표시될 수
		 total, cur, write
		 변수 선언
		 
		 파라미터로 넘어온 cur 페이지가 없으면 기본값 1
		 
		 1< 아래여도 1 
		 총페이지수 < 으면 마지막 페이지 수
		
		페이지 수 계산
		str 에 string 추가
		
		파라미터로 str 값 넘기기
		*/
		
		
		
		// 2. 게시판 리스트 불러오기
		arr = dao.selectFTList();
		
		
		// 3. 파라미터로 게시판 글이랑 총 수량 넘기기
		request.setAttribute("list", arr);
		
	}

}
