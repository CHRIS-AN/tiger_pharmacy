package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NonDAO dao = new NonDAO(); // readByUid의 메소드를 사용하기위함으로 dao 생성자 객체를 만들어줌.
		NonDTO [] arr = null; // 이동을 위한 매개체의 공간을 만들어주어 null값으로 지정을해준다.
		
		int b_uid =  Integer.parseInt(request.getParameter("b_uid"));
		// 넘어온 b_uid 값을  int화를 시켜서 b_uid 값에 넘어준다.
		
		
		try {
			arr = dao.readByUid(b_uid); // 넘어온 b_uid값으로 readByUid 메소드에 변수에 넣어서 사용.
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
