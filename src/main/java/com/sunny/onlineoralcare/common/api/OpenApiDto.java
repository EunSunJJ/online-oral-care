package com.sunny.onlineoralcare.common.api;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Setter
@Getter
public class OpenApiDto {
	private String BIZPLC_NM;
	private String BSN_STATE_NM;
	private String TREAT_SBJECT_CONT;
	private String REFINE_ROADNM_ADDR;
}
