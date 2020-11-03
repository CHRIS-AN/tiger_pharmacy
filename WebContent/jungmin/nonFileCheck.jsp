<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<% request.setCharacterEncoding("utf-8"); %>

<c:set var="original_s" value="${paramValues.origin }"/>
<c:set var="fileSystem_s" value="${paramValues.fileSystem }"/>
<c:set var="cnt" value="${fn:length(paramValues.origin) }"/>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 확인 & 다운로드 링크</title>
<style>
	form p{}
	form p:hover{}
</style>
</head>
<body>

</body>
</html>












