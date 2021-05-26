package com.itbank.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailService {

	// 6자리 숫자 인증번호 만들기
	public String getAuthNumber() {
		Random ran = new Random();
		String authNumber = "";
		for(int i = 0; i < 6; i++) {
			authNumber += ran.nextInt(9);
		}
		return authNumber;
	}

	public String sendMail(String mailAddress, String authNumber, String account) {
		// 여기서부터 메일을 발송하는데 사용하는 코드
		String host = "smtp.naver.com";
		final String username = account.split("/")[0];
		final String password = account.split("/")[1];
		int port = 465;
		
		String subject = "[KGITBANK] 인증 메일입니다";
		String body = "인증번호는 [%s]입니다\n\n";
		
		body = String.format(body, authNumber);
		
		// 메일을 보내는 서버에 대한 인증과 속성을 설정한다 (smtp)
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		// 속성 + 인증(id, pw)을 이용하여 세션을 생성
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		// 세션에 대한 처리내용을 콘솔에 출력할 수 있도록 debug를 활성화
		mailSession.setDebug(true);
		
		// 메일의 전반적인 내용을 설정 (보내는 사람, 받는 사람, 제목, 내용)
		Message mimeMessage = new MimeMessage(mailSession);	// 
		
		try {
		mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailAddress));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		} catch(AddressException e) {
			return "주소가 잘못되었습니다";
		} catch(MessagingException e) {
			return "주소를 전송할 수 없습니다";
		}
		return authNumber;
	}
}