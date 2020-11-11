package yeonji.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeonji.beans.JoinUserDAO;

public class MailSend{

	public void execute1(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userEmail = request.getParameter("userEmail");// 사용자가 입력한 이메일 받아오기
		System.out.println("userEmail :" + userEmail);

		JoinUserDAO dao = JoinUserDAO.getInstance();
		boolean result = dao.confirmEmail(userEmail);

		if (result) { //result:true
			System.out.println("이미존재");
			System.out.println("result:"+result);
			
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().write("1");
			
			
		} else { //result:flase
			System.out.println("해당이메일 없음");
			System.out.println("result:"+result);
			
			/*
			 * Properties 클래스는 시스템의 속성을 객체로 생성하는 클래스이다. Hashtable을 상속받은 클래스로 속성과 값은 1:1로 저장이
			 * 된다.
			 */
			System.out.println("mailSend커맨드");
			Properties prop = System.getProperties();
			/*
			 * 이 부분은 TLS와 SSL의 사용에 따라 설정값이 다른데 위 코드는 TLS의 경우이다.
			 * prop.put("mail.smtp.starttls.enable", "true"); - 로그인시 TLS를 사용할 것인지 설정
			 * prop.put("mail.smtp.host", "smtp.gmail.com"); - 이메일 발송을 처리해줄 SMTP서버
			 * prop.put("mail.smtp.auth", "true"); - SMTP 서버의 인증을 사용한다는 의미
			 * prop.put("mail.smtp.port", "587"); - TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
			 */
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");

			/*
			 * MailAuth.java 에서 Authenticator를 상속받아 생성한 MailAuth 클래스를 받아 세션을 생성한다.
			 * getDefaultInstance의 첫 번째 파라미터는 앞서 설정한 메일 처리 환경이다.
			 */
			Authenticator auth = new MailAuth();
			Session session = Session.getDefaultInstance(prop, auth);

			// MimeMessage는 Message (추상)클래스를 상속받은 인터넷 메일을 위한 클래스이다. 위에서 생성한 세션을 담아 msg 객체를
			// 생성한다.
			MimeMessage msg = new MimeMessage(session);
			
			try {
				// 보내는 날짜 지정
				msg.setSentDate(new Date());
				System.out.println(new Date());
				// Message 클래스의 setFrom() 메소드를 사용하여 발송자를 지정한다.
				// 발송자의 메일, 발송자명 InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
				msg.setFrom(new InternetAddress("yonjimonji@gmail.com", "관리자"));
				// 수신자의 메일을 생성한다.

				// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. Message.RecipientType.TO :
				// 받는 사람
				InternetAddress to = new InternetAddress(userEmail); // 수신자
				msg.setRecipient(Message.RecipientType.TO, to);

				// 메일의 제목 지정
				msg.setSubject("호랑이약방 회원가입을 위한 인증번호 메일입니다.", "UTF-8");
				

				String code = request.getParameter("emailChk");
				// 메일의 내용 입력
				msg.setText("안녕하세요. 인증번호 : " + code, "UTF-8");
				System.out.println("code:" + code);
				
				// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
				Transport.send(msg);

			} catch (AddressException ae) {
				System.out.println("AddressException : " + ae.getMessage());
			} catch (MessagingException me) {
				// 메일 계정인증 관련 예외 처리
				System.out.println("MessagingException : " + me.getMessage());
			} catch (UnsupportedEncodingException e) {
				// 지원되지 않는 인코딩을 사용할 경우 예외 처리
				System.out.println("UnsupportedEncodingException : " + e.getMessage());
			}
			
				
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().write("0");
		}

	}

}
