package common;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import yeonsup.beans.GoogleDTO;
import yeonsup.beans.Token;

public class GoogleLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		String query = "code=" + code;
		query += "&client_id=" + "1009736396986-j8pui1ntu7sbsfhkkk23fcrhldkd3a7r.apps.googleusercontent.com";
		query += "&client_secret=" + "IinwlmqW27kMVwXC4gF7ShTP";
		query += "&redirect_uri=" + "http://localhost:8888" + request.getContextPath() + "/redirect.tp" ;
		query += "&grant_type=authorization_code";
		String tokenJson;
		try {
			tokenJson = getHttpConnection("https://accounts.google.com/o/oauth2/token", query);
			System.out.println(tokenJson.toString());
			Gson gson = new Gson();
			Token token = gson.fromJson(tokenJson, Token.class);
			String ret = getHttpConnection("https://www.googleapis.com/userinfo/v2/me?access_token=" + token.getAccess_token());
			System.out.println(ret);
			GoogleDTO gdto = gson.fromJson(ret, GoogleDTO.class);
			System.out.println(gdto.toString());
			request.setAttribute("gInfo", gdto);
			
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

		
	}
	
	private String getHttpConnection(String uri) throws ServletException, IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		int responseCode = conn.getResponseCode();
		System.out.println(responseCode);
		String line;
		StringBuffer buffer = new StringBuffer();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return buffer.toString();
	}
	private String getHttpConnection(String uri, String param) throws ServletException, IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		try (OutputStream stream = conn.getOutputStream()) {
			try (BufferedWriter wd = new BufferedWriter(new OutputStreamWriter(stream))) {
				wd.write(param);
			}
		}
		int responseCode = conn.getResponseCode();
		System.out.println(responseCode);
		String line;
		StringBuffer buffer = new StringBuffer();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}


}
