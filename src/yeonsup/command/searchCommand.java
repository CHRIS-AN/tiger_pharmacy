package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;

public class searchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) { 
		
		// 구분 = s_col, 검색 내용 = word 
		String s_col = request.getParameter("s_col");
		String word = request.getParameter("word");
		
		word = word.replace(" ", "");
		
		
		// dao, dto
		FreeTalkDAO dao = new FreeTalkDAO();
		FreeTalkDTO [] arr = null;
		
		arr = dao.selectSerach(s_col, word);
		
		request.setAttribute("list", arr);
		

	}

}
