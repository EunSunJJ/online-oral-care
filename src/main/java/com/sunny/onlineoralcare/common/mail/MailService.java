package com.sunny.onlineoralcare.common.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	private static final String FROM_ADDRESS = "developtest0122@naver.com";

	// 메일 보내기
	public void sendSimpleMessage(MailDto mailDto) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(FROM_ADDRESS);
		message.setTo(mailDto.getReceiver());
		message.setSubject(mailDto.getTitle());
		message.setText(mailDto.getMessage());
		
		javaMailSender.send(message);
	}
}