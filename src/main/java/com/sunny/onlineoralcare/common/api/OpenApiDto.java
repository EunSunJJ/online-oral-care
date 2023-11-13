package com.sunny.onlineoralcare.common.api;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class OpenApiDto {
	private String dentalClinicName;
	private String status;
	private String treatSubject;
	private String address;
}
