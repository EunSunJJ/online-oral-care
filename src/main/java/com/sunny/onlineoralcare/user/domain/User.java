package com.sunny.onlineoralcare.user.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class User {

	private int id;
	private String loginId;
	private String password;
	private String name;
	private String phoneNumber;
	private String birthday;
	private String email;
	private Date createdAt;
	private Date updatedAt;
	
	
}
