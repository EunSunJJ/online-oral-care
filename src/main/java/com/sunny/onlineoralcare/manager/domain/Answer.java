package com.sunny.onlineoralcare.manager.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Answer {

	private int id;
	private int postId;
	private int managerId;
	private String content;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
