package com.sunny.onlineoralcare.common.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
			,@RequestParam("address") String address){

		String key = "b05cc4b4d56b41bdafa6bd033f6f6d1d";    
		String result = "";
		
		try{
		String apiURL = "https://openapi.gg.go.kr/DentistryPrivateHospital?KEY="
				+ key + "&Type=json&pIndex=1&pSize=10" 
				+ "&SIGUN_NM=" + address;
		
		URL url = new URL(apiURL);
		
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		
		//요청방식: GET
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		
		BufferedReader br;
		
		if(responseCode==200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		result = br.readLine();
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		// result 값을 String -> JSON으로 바꿔주기
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
		
		// 데이터 보면서 확인
		JSONArray DentistryPrivateHospital = (JSONArray) jsonObject.get("DentistryPrivateHospital");
		

		
		return "user/dentalClinic";
	}
}