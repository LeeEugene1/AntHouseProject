package kr.or.redant.user.join.controller;

import java.io.File;
import java.util.*;

import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Mail {
	public static void main(String[] args){
	}
	
	public static void sendMail(String title, String content, String mem_mail) throws Exception {
		// 발신자의 계정,비밀번호 설정
		final String FROM = mem_mail; // SMTP설정한 계정 이메일
		final String PASSWORD = "akgk1@"; // SMTP설정한 계정 패스워드
		final String FROM_NAME = "개미의집"; // 송신자 이름
		String userName = "고객님"; //수신자 이름
		
		// SMTP서버 설정
		String host = "smtp.naver.com"; //Gmail은 smtp.gmail.com
		int port = 587; //네이버 SMTP port번호 587 , Gmail SMTP port번호 465
		Properties props = new Properties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true");
		
		// 사용자 정보 인증 구간
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication(FROM, PASSWORD); //SMTP설정한 계정 정보를 인자값으로 넘김
			}
		}); 
		
		/*
		 * 위 부분은 고정.. 계정 정보, SMTP서버 설정만 변경하면됨 
		 */
		
		MimeMessage message = new MimeMessage(session); //위에서 인증된 session으로 message객체 생성
		
		//일반 메일 타입 전송부
		try {
			System.out.println("전송중...");
			message.setFrom(new InternetAddress(FROM,FROM_NAME)); //송신측 정보 
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(FROM,userName)); //수신측 정보  
			message.setSentDate(new Date());
			message.setSubject(title); //제목 설정
			message.setText(content); //본문 설정
			Transport.send(message); // 전송
			System.out.println("메일 전송이 완료되었습니다."); 
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("메일 전송이 실패했습니다.");
		}
	}
}