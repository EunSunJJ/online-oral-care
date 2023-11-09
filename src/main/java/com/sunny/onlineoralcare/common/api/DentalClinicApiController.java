package com.sunny.onlineoralcare.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DentalClinicApiController {

	// 문진표 기반 근처치과 list
	@GetMapping("/user/private/dentalClinic-view")
	public String dentalClinicApi(
			Model model
			,@RequestParam("address") String address) throws IOException, ParseException {

		// 1. URL을 만들기 위한 StringBuilder.
		StringBuilder urlBuilder = new StringBuilder("https://openapi.gg.go.kr/DentistryPrivateHospital");

		// 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
		urlBuilder.append("?" + URLEncoder.encode("KEY", "UTF-8") + "=b05cc4b4d56b41bdafa6bd033f6f6d1d");
		urlBuilder.append("&" + URLEncoder.encode("Type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pIndex", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pSize", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("SIGUN_NM", "UTF-8") + "=" + URLEncoder.encode(address, "UTF-8"));

		// 3. URL 객체 생성.
		URL url = new URL(urlBuilder.toString());

		// 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		// 5. 통신을 위한 메소드 SET.
		conn.setRequestMethod("GET");

		// 6. 통신을 위한 Content-type SET.
		conn.setRequestProperty("Content-type", "application/json");

		// 7. 통신 응답 코드 확인.
		System.out.println("Response code: " + conn.getResponseCode());

		// 8. 전달받은 데이터를 BufferedReader 객체로 저장.
		BufferedReader rd;

		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		// 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		// 10. 객체 해제.
		rd.close();
		conn.disconnect();

		// 11. 전달받은 데이터 확인.
		System.out.println(sb.toString());

		// JSON-parsing

		// 1. 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
		JSONParser parser = new JSONParser();

		// 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
		JSONObject obj = (JSONObject) parser.parse(sb.toString());

		// 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
		JSONArray dataArr = (JSONArray) obj.get("data");

		// 4. model에 담아준다.
		model.addAttribute("apiData", dataArr);

		return "user/dentalClinic";
	}
}