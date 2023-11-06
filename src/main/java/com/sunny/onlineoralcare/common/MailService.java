package com.sunny.onlineoralcare.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	// 메일 보내기
	public void sendSimpleMessage(MailDto mailDto) {
		
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(mailDto.getSender());
		message.setSubject(mailDto.getReceiver());
		message.setTo(mailDto.getTitle());
		message.setText(mailDto.getMessage());
		
		javaMailSender.send(message);
	}
}
