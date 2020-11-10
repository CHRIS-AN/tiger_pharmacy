<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
%>
<script>
	function chkLogout() {
			location.href = "../yeonji/logoutOk.jsp";
	}
</script>
<div class="wrapper">

<div class="main-header">


			<!-- Logo Header 로고가 있는 헤더-->
			<div class="logo-header" data-background-color="orange">

				<a href="<%=request.getContextPath()%>/layout/index.tp" class="logo"> <img
					src="<%=request.getContextPath()%>/layout/assets/img/tiger_par-logo-W.svg" alt="navbar brand"
					class="navbar-brand"> <!--해더 이미지를 svg로 해야 하지만 일단 png로 대체-->
				</a>
				<!-- ↓ 모바일때 표시되는 메뉴 왼쪽버튼(PC 버젼에서는 보이지 않는다.) -->
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
					</span>
				</button>
				<!-- ↓ 모바일때 표시되는 메뉴 오른쪽버튼(PC 버젼에서는 보이지 않는다.) -->
				<button class="topbar-toggler more">
					<i class="icon-options-vertical"></i>
				</button>
				<!-- ↓ PC 버젼일때 표시되는 햄버거메뉴 버튼 -->
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->


			<!-- Navbar Header -->
			<!--검색창있는 헤더-->
			<nav class="navbar navbar-header navbar-expand-lg"
				data-background-color="orange2">
				<div class="container-fluid">
					<!--꽉찬 너비의 내비게이션 바-->
					<!--검색창-->
					<div class="collapse" id="search-nav">
						<form class="navbar-left navbar-form nav-search mr-md-3">
							<div class="input-group">
								<input type="text" placeholder="Search .."
									class="form-control ml-2">
								<!--검색창 글쓰는 곳-->
								<div class="input-group-prepend">
									<!--검색창 돋보기-->
									<button type="submit" class="btn btn-search mr-1">
										<i class="fa fa-search search-icon"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<!--↓ 모바일때 표시되는 메뉴 오른쪽버튼 안에 들어가는 것들-->
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<!-- 검색 -->
						<li class="nav-item toggle-nav-search hidden-caret"><a
							class="nav-link" data-toggle="collapse" href="#search-nav"
							role="button" aria-expanded="false" aria-controls="search-nav">
								<i class="fa fa-search"></i>
						<c:choose>
							<c:when test="${not empty sessionScope.u_uid }">
								<!--로그아웃-->
								<li class="nav-item hidden-caret"><a class="nav-link "
									role="button" style="cursor:pointer;" onclick="chkLogout()" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-sign-in-alt"></i><span class="ml-1">로그아웃</span>
								</a></li>
								<!--마이페이지-->
								<li class="nav-item hidden-caret"><a class="nav-link "
									href="../yeonji/myPage.tp" role="button" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-user-plus"> </i> <span class="ml-1">마이페이지</span>
								</a></li>
								<!--그냥 빈칸. 왜 만들었냐면 눌리는 크기를 동일하게 하기 위해서 만듬-->
								<li class="nav-item hidden-caret"></li>
							</c:when>
							<c:otherwise>
								<!--로그인-->
								<li class="nav-item hidden-caret"><a class="nav-link "
									href="../yeonji/login.tp" role="button" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-sign-in-alt"></i> <span class="ml-1">로그인</span>
		
								</a></li>
								<!--회원가입-->
								<li class="nav-item hidden-caret"><a class="nav-link "
									href="../yeonji/joinSelect.tp" role="button" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-user-plus"> </i> <span class="ml-1">회원가입</span>
								</a></li>
								<!--그냥 빈칸. 왜 만들었냐면 눌리는 크기를 동일하게 하기 위해서 만듬-->
								<li class="nav-item hidden-caret"></li>
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>