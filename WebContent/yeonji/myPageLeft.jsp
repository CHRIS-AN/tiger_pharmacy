<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int menu = 1;  // menu parameter  가 없으면 1page 가 디폴트 동작
	String menu_param = request.getParameter("menu");
	if(menu_param != null){
		menu = Integer.parseInt(menu_param);
	}
	// 1 <= menu <= 2
	if(menu > 2) menu =2;
	if(menu < 1) menu = 1;
%>    
  	<!-- left 사이트 메뉴 시작 -->
    <div class="col-sm-3">
      <h3>마이페이지</h3>
      
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link <%= (menu == 1)?"active":"" %>" href="<%= (menu == 1)?"#":"myPage.jsp?menu=1"%>">나의 정보 수정</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link <%= (menu == 2)?"active":"" %>" href="<%= (menu == 2)?"#":"myPage.jsp?menu=2"%>">회원탈퇴</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <!-- left 사이트 메뉴 끝 -->