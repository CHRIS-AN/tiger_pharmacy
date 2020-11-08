package jungmin.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import jungmin.beans.NonDAO;
import jungmin.beans.NonDTO;

public class J_ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NonDAO dao = new NonDAO(); // dao 생성자를 생성함으로 써, dao의 메소드를 사용 할 수 있게 하려한다.
		NonDTO [] arr = null; // DTO는 객체들을 전달을 해주려는 매개체를 의미한다. 큰 dto배열을만들어논다.

		try {
			arr = dao.select();
			request.setAttribute("list", arr); // request하기 전에 arr를 list라는 곳에 담아둔다. 
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
