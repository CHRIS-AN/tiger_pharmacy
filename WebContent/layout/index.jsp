<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "top.jsp"%>

<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->

<%@ include file = "top2.jsp"%>
<%@ include file = "header.jsp"%>
<%@ include file = "sidebar.jsp"%>


<!-- content.jsp부분을 바꾸세요!! -->
<!-- 꼭!! <div class="content"> 'here' </div> 를만들고 'here'에 내용을 넣으시오! 그래야 푸터가 하단에 고정됨 -->
<jsp:include page="content.jsp"/>


<%@ include file = "footer.jsp"%>
<%@ include file = "script_bottom.jsp"%>