<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="yeonji.beans.JoinUserDAO"%>
<%@ page import="yeonji.beans.JoinUserDTO"%>
<%
Integer u_uid = (Integer)session.getAttribute("u_uid");	

JoinUserDAO dao =  JoinUserDAO.getInstance();
JoinUserDTO dto = dao.getUserInfo(u_uid);

	String inputPW = request.getParameter("pw");
	String pw = dto.getU_pw();
	
	System.out.println("inputPW:"+inputPW);

	System.out.println("u_pw:"+pw);
	
	PrintWriter script = response.getWriter();
	
	if(pw.equals(inputPW)){
		System.out.println("들어옴?");
		response.sendRedirect("myPage4.tp"); 
	
	}else{
		script.println("<script>");
		script.println("alert('잘못된 비번.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
