package com.green.wiki.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

import com.green.wiki.service.WikiService;

@Service("wikiService")
public class WikiServiceImpl implements WikiService {

	
	private String serviceKey =
			"whlPlEex4rluP8rvhUk81%2F3xVX4xLPoWB0926oEUa4gwdZW0Rq6jN0lPDA0%2FPQxtrN9FTAne3TTyu6cDFAJJPQ%3D%3D";
	
	// Api data 받아오기
	@Override
	public String search(String keyword, int numOfRows, int pageNo) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.nature.go.kr/openapi/service/rest/PlantService/plntIlstrSearch"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("st","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1-국명/2-학명/3-국명일치/4-학명일치*/
        urlBuilder.append("&" + URLEncoder.encode("sw","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); /*검색대상어*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지 번호*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
       // System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        JSONObject jsonObject = XML.toJSONObject(sb.toString());
        String jsonStr = jsonObject.toString();
        System.out.println("흠:" + jsonStr);
        return jsonStr;
	}

}
