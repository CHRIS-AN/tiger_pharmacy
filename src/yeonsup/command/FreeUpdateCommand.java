package yeonsup.command;

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
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;

public class FreeUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FreeTalkDAO dao = new FreeTalkDAO();
		FreeTalkDTO dto = null;
		
		int b_uid = Integer.parseInt(request.getParameter("b_uid"));  // 매개변수 검증 필요
		
		dto = dao.select_by_B_uid(b_uid);  // 읽기 only
		
		request.setAttribute("board", dto);	
		
	}

}
