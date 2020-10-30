package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.DaemonHttpServlet;

import command.Command;

@WebServlet("*.tp")
public class doController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public doController() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void actionTp (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println("com : " +  com);
		
		
		Command command = null;
		String viewPage = null;
		
		switch(com) {
		case "/":
			break;
		case "":
			break;
		}
		
		if(viewPage != null) {
			RequestDispatcher disp = request.getRequestDispatcher(viewPage);
			disp.forward(request, response);
		}
	}
}























