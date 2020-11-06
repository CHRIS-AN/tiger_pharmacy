package yeonji.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	/*
	 * 메일을 보내기 위해 추가한 mail-1.4.7 jar에는 javax.mail 패키지가 들어있다. 
	 * javax.mail 패키지의 주요 클래스는 Session, Message, Address, Authenticator, Tranport 등이 있다. 
	 * SMTP 서버에 연결해 사용자 인증을 하기 위해서 Authenticator 클래스 사용이 필요하다.
	 */

	PasswordAuthentication pa;

	public MailAuth() {
		String mail_id = "yonjimonji";
		String mail_pw = "monji0831";

		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	/*
	 * Authenticator를 사용하기 위해서는 PasswordAuthenticator 클래스로부터 인스턴스를 생성하고
	 * getPasswordAuthentication 메소드로 리턴받아야 한다.
	 * PasswordAuthentication 클래스는 사용자의 아이디와 패스워드를 입력받아 반환하도록 재정의한다.
	 */
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
