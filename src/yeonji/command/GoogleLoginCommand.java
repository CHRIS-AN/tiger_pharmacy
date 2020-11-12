package yeonji.command;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import common.Command;
import yeonji.beans.GoogleDTO;
import yeonji.beans.Token;
import yeonsup.beans.UserDAO;
import yeonsup.beans.UserDTO;

public class GoogleLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDAO dao = new UserDAO();
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com + "\n");
		
		String code = request.getParameter("code");
		UserDTO dto = null;
		GoogleDTO gdto = null;
		
		//로그인 여부
		if(com.equals("/googleLogin.tp")) {
			
			gdto = getGoogleDTO(code, "http://localhost:8888/tiger_pharmacy" + com);
			
			System.out.println(gdto.toString());
			dto = dao.selectByEmail(gdto.getEmail());
			
			if(dto != null) {
				session.setAttribute("u_uid", dto.getU_uid());
				session.setAttribute("email", dto.getEmail());
			} else {
				request.setAttribute("result", 0);
			}
			
		} else if (com.equals("/redirect.tp")) {
			// 회원가입 여부
			gdto = getGoogleDTO(code, "http://localhost:8888/tiger_pharmacy" + com);
			dto = dao.selectByEmail(gdto.getEmail());
			
			if(dto == null) {
				request.setAttribute("gInfo", gdto);
				request.setAttribute("result", 1); // 해당 회원이 없는 것 --> 회원가입 페이지로 이동
			} else {
				System.out.println("이미 가입된 회원 --> 로그인 페이지 이동");
				request.setAttribute("user", dto);
				request.setAttribute("result", 0); // 해당 회원이 있는 것 --> 로그인 페이지로 이동
			}
			
		}
	}
	
	private GoogleDTO getGoogleDTO(String code, String redirect_uri) {
		GoogleDTO gdto = null;
		StringBuffer query = new StringBuffer("code=" + code);
		String tokenJson = "";
		UserDTO dto = null;
		
		query.append("&client_id=" + "1009736396986-j8pui1ntu7sbsfhkkk23fcrhldkd3a7r.apps.googleusercontent.com");
		query.append("&client_secret=" + "IinwlmqW27kMVwXC4gF7ShTP");
		query.append("&redirect_uri=" + redirect_uri);
		query.append("&grant_type=authorization_code");
		
		try {
			
			tokenJson = getHttpConnection("https://accounts.google.com/o/oauth2/token", query.toString());
			System.out.println(tokenJson.toString());
			Gson gson = new Gson();
			Token token = gson.fromJson(tokenJson, Token.class);
			
			String ret = getHttpConnection("https://www.googleapis.com/userinfo/v2/me?access_token=" + token.getAccess_token());
			gdto = gson.fromJson(ret, GoogleDTO.class);
			
			System.out.println(ret);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		return gdto;
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
