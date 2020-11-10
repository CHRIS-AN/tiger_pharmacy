<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="yeonji.mail.SHA256"%>
<%@ page import="yeonji.mail.MailAuth"%>
<%@ page import="yeonji.beans.JoinUserDAO"%>

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
		String to = request.getParameter("email");
		JoinUserDAO dao = JoinUserDAO.getInstance();
		boolean result = dao.confirmEmail(to);
		
		if (result == false) { //result:true
			System.out.println("해당이메일 없음");
			System.out.println("result:"+result);
		
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('해당 이메일은 호랭이약방 회원이 아닙니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

			return;
		} 
		
		String host = "http://localhost:8888/tiger_phamarcy/yeonji/";		
		String from = "yonjimonji@gmail.com";
		
		String code = SHA256.getEncrypt(to, "cos");
		
		//사용자에게 보낼 메시지
		String subject = "호랭이 약방 비밀번호 변경을 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. " 
		        + "<a style='color: red' href='http://localhost:8888/tiger_phamarcy/yeonji/pwfindEmailChkAction.tp?code=" + code + "&email=" + to + "'>이메일 인증하기 [클릭]</a>";

		Properties prop = new Properties();
		prop.put("mail.smtp.user", from);
		prop.put("mail.smtp.host", "smtp.googlemail.com");
		prop.put("mail.smtp.port", "465"); //TLS 587, SSL 465
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.debug", "true");
		prop.put("mail.smtp.socketFactory.port", "465"); 
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.sockerFactory.fallback", "false");

		try {
			Authenticator auth = new MailAuth();
			Session ses = Session.getInstance(prop, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setFrom(new InternetAddress(from,"관리자"));
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setSubject(subject);
			msg.setContent(content, "text/html; charset=UTF8");
			Transport.send(msg);
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일 인증 오류')");
			script.println("history.back();");
			script.println("</script>");
		}
	%>
<%@ include file="../layout/top.jsp"%>

<%@ include file="../layout/top1_2.jsp"%>
<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<link rel="stylesheet" href="CSS/mypage.css">

<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<!-- 반응형 본문 시작 -->
<div class="content">

	<div class="container" style="margin-top: 70px">
		<div class="row">

			<div class="alert alert-success mt-12 pt-4" role="alert">
				<h2>이메일 주소 인증메일이 전송되었습니다.<br><br> 이메일에 들어가셔서 링크를 클릭해주세요.</h2>
			</div>
		</div>
	</div>

</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>

