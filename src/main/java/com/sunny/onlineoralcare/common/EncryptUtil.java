package com.sunny.onlineoralcare.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtil {

	// md5 방식으로 암호화
	public static String md5(String message) {
		
		String resultString = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i++) {
				// 비트 연산 개념
				resultString += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
			
		}
		
		return resultString;
	}
}
