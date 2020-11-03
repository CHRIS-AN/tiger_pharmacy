<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="java.util.Enumeration" %> <%-- parametor 값들, file name 값들 추출 --%>
<%@ page import="java.io.File" %> <%--file 객체 추출 --%>

<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 .</title>
</head>
<body>

<form action="nonFileCheck.jsp" method="post" name="fileCheck">
<%

	String saveDirectory = "C:\\tiger_pharmacy\\upload";
	//String saveDirectory = getServletContext().getRealPath("upload");
	System.out.print("업로드 경로 파악 : " + saveDirectory);
	int maxPostSize = 5 * 1024 * 1024; // post 파일 업로드 최대 5m!!!!
	String encoding = "utf-8";
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest multi = null;
	
	// 객체 생성 
	multi = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,
				policy
			);
	
	Enumeration names = null;
	names = multi.getParameterNames();
	
	
	while(names.hasMoreElements()) {
		String name =(String)names.nextElement(); // name값
	}
	out.println("<hr>");
	
	names = multi.getFileNames();
	while(names.hasMoreElements()){
		String name = (String)names.nextElement(); // 원본파일이름
		String origin = multi.getOriginalFileName(name); //  name의 원래 파일 이름을 가져오낟.
		out.println("<input type='hidden' value='" + origin + "' name='origin'/>"); // check.jsp에 값을 넘겨주는 것이다.
		String fileSystem = multi.getFilesystemName(name); // 시스템에 실제 업로딩된 파일 이름
		out.println("<input type='hidden' value='" + fileSystem + "' name='fileSystem'/>"); // check.jsp에 값을 넘겨주는 것이다.
		String fileType = multi.getContentType(name); // 업로딩된파일의 타입!!
		
		File file = multi.getFile(name);
		if(file != null) {
			long fileSize = file.length(); //파일의 크기를 chk
		
			// 파일 이미지 다루기
			BufferedImage bi = ImageIO.read(file); 
			if(bi != null) {
				int width = bi.getWidth();
				int height = bi.getHeight();
				
			}else {
				System.out.println("이미지 파일이 아닙니다..");
			}
	}
		out.println("<hr>");
}
		
	
%>
<input type="submit" value="업로드 파일 확인"/><br>
</form>


</body>
</html>