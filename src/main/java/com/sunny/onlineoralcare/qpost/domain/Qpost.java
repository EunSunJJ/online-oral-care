package com.sunny.onlineoralcare.qpost.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class Qpost {

	private int id;
	private int userId;
	private String writer;
	private String title;
	private String content;
	private String imagePath;
	private String password;
	private boolean answer;
	private Date createdAt;
	private Date updatedAt;
}
