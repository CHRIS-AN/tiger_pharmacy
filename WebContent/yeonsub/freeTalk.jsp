<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<%@ include file = "../layout/top.jsp"%>
<div class="wrapper">
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>
<!--컨텐츠가 들어가는 메인화면-->
<div class="main-panel">

<div id="content-box" class="container">
	<div id="free-borad-box">
		<table>
			
		</table>
	</div>
</div>



<jsp:include page="../layout/footer.jsp"/>
</div>
</div>
<jsp:include page="../layout/script_bottom.jsp"/>