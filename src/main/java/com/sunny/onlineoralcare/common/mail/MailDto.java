package com.sunny.onlineoralcare.common.mail;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class MailDto {

	private String sender; // 보내는 사람
	private String receiver; // 받는 사람
	private String title; // 메일 제목
	private String message; // 메일 내용

}
