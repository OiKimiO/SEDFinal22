package com.pknufinal.openapi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class FindPartsController {
	
	public static StringBuilder sb;
	@RequestMapping(value="/FindParts", method=RequestMethod.GET, headers="Accept=application/json")
	public void searchCheck(@RequestParam(value="text1") String text1, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("엥?");
		String clientId = "Ajh1VRyL9G0ol4jGNv9s";// 애플리케이션 클라이언트 아이디값";
		//System.out.println(clientId);
        
        String clientSecret = "bTqURIoD18";// 애플리케이션 클라이언트 시크릿값";\
        int display = 1; // 검색결과갯수. 최대100개
        text1 = URLEncoder.encode(text1,"utf-8");
      
        String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text1 + "&display=" + display + "&";
        
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { 
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            br.close();
            con.disconnect();
            System.out.println(sb);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        response.setContentType("application/json;charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.print(sb);
	    out.flush();
	    out.close(); 	
 
    }

	
	
}
