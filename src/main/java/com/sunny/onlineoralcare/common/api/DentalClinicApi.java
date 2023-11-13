package com.sunny.onlineoralcare.common.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DentalClinicApi {

	// 문진표 기반 근처치과 list
	@GetMapping("/user/private/dentalClinic-view")
	public static String dentalClinicApi(
			@RequestParam("address") String address
			, Model model) throws IOException, ParseException {
		
		// 1. URL을 만들기 위한 StringBuilder.
		StringBuilder urlBuilder = new StringBuilder("https://openapi.gg.go.kr/DentistryPrivateHospital");

		urlBuilder.append("?" + URLEncoder.encode("KEY", "UTF-8") + "=b05cc4b4d56b41bdafa6bd033f6f6d1d");
		urlBuilder.append("&" + URLEncoder.encode("Type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pIndex", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pSize", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("SIGUN_NM", "UTF-8") + "=" + URLEncoder.encode(address, "UTF-8"));
		
		URL url = new URL(urlBuilder.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		//System.out.println("Response code: " + conn.getResponseCode()); 
		
		BufferedReader rd;
		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		
		String result;
		result = rd.readLine();

		rd.close();
		conn.disconnect();
		//System.out.println(result);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
		//System.out.println(jsonObject);
		
		JSONArray DentistryPrivateHospitalArr = (JSONArray)jsonObject.get("DentistryPrivateHospital");
		//System.out.println(DentistryPrivateHospitalArr);
		
		JSONArray rowArr = new JSONArray();
		JSONObject DentistryPrivateHospital = (JSONObject) DentistryPrivateHospitalArr.get(1);
		rowArr = (JSONArray)DentistryPrivateHospital.get("row");
		
		//System.out.println(rowArr);
		ArrayList<OpenApiDto> list = new ArrayList<OpenApiDto>();
		
		JSONObject data = new JSONObject();
		 for (int i = 0; i < rowArr.size(); i++) {
			 data = (JSONObject) rowArr.get(i);
			 
			 String data1 =  (String) data.get("BIZPLC_NM"); //치과이름
			 String data2 =  (String) data.get("BSN_STATE_NM"); // 영업상태
			 String data3 =  (String) data.get("TREAT_SBJECT_CONT"); // 진료과목
			 String data4 =  (String) data.get("REFINE_ROADNM_ADDR"); // 주소
			 
		
			 
			 OpenApiDto dto = OpenApiDto.builder()
					 .BIZPLC_NM(data1)
					 .BSN_STATE_NM(data2)
					 .TREAT_SBJECT_CONT(data3)
					 .REFINE_ROADNM_ADDR(data4)
					 .build();
			 
			 list.add(dto);
		 }		
		
		 model.addAttribute("list", list);
		 
		 return "user/dentalClinic";
	}

}