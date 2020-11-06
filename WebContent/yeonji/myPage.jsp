<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int menu = 1; // menu parameter  가 없으면 1page 가 디폴트 동작
String menu_param = request.getParameter("menu");
if (menu_param != null) {
	menu = Integer.parseInt(menu_param);
}
// 1 <= menu <= 2
if (menu > 2)
	menu = 2;
if (menu < 1)
	menu = 1;
%>

<%@ include file="../layout/top.jsp"%>

<%@ include file="../layout/top1_2.jsp"%>
<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 
  <link rel="stylesheet" href="CSS/mypage.css">

<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<!-- 반응형 본문 시작 -->
<div class="content">
	
		<div class="container" style="margin-top: 70px">
			<div class="row">
			
				<!-- left 사이트 메뉴 시작 -->
				<jsp:include page="myPageLeft.jsp">
					<jsp:param value="<%=menu%>" name="menu" />
				</jsp:include>
				<!-- left 사이트 메뉴 끝 -->

				<%
					String Mypage = "myPage" + menu + ".jsp";
				%>

				<jsp:include page="<%=Mypage%>" />
			</div>
		</div>
	
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>