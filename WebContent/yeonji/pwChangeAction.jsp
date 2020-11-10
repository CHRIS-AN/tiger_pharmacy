<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="yeonji.beans.JoinUserDAO"%>
<%@ page import="yeonji.beans.JoinUserDTO"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>

<%
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		JoinUserDTO dto = new JoinUserDTO();
		dto.setU_pw(pw);
		dto.setEmail(email);
		
		JoinUserDAO dao = JoinUserDAO.getInstance();
		int result = dao.changePW(dto);
		
		if (result == 1) { //비밀변경
		
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('비밀번호 변경 완료');");

			script.println("location.href = 'login.tp'");

			script.println("</script>");

			script.close();

			return;
		}else if(result == 0) {
			
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('비밀번호 변경 실패');");

			script.println("history.back();");

			script.println("</script>");

			script.close();
			
			return;
		}
		
%>

