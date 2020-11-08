package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NonDAO dao = new NonDAO();
		NonDTO [] arr = null;

		int b_uid = Integer.parseInt(request.getParameter("b_uid"));


		try {
			arr = dao.selectByUid(b_uid);
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		NonDAO fileDao = new NonDAO();
		NonDTO [] fileArr = null;

		try {
			if(arr != null && arr.length == 1) {
				fileArr = fileDao.selectFilesByWrUid(b_uid);
				request.setAttribute("fileList", fileArr);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
