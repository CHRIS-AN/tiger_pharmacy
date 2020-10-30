<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "top.jsp"%>
<div class="wrapper">
<%@ include file = "header.jsp"%>
<%@ include file = "sidebar.jsp"%>
<!--컨텐츠가 들어가는 메인화면-->
<div class="main-panel">

<!-- content.jsp부분을 바꾸세요!! -->
<jsp:include page="content.jsp"/>


<%@ include file = "footer.jsp"%>
</div>
</div>
<%@ include file = "script_bottom.jsp"%>