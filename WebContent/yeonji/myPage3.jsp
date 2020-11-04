
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
<script src="Script/myPage3.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

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

			<!-- 본문 시작 -->
			<div class="col-sm-9">
				<form id="contentForm">
					<div id="myPage3">
						<h2>나의 정보 수정</h2>

						<table class="table table-responsive center table3">
							<tr>
								<td class="boldtext">이메일</td>
								<td>aaa@example.com</td>
							</tr>

							<tr>
								<td class="boldtext">비밀번호</td>
								<td><input class="formChk" type="password" name="pw"
									placeholder="비밀번호" required></td>
							</tr>

							<tr class="boldtext">
								<td>비밀번호 확인</td>
								<td><input class="formChk" type="password" name="pwChk"
									placeholder="비밀번호 확인" required></td>
							</tr>

							<tr>
								<td class="boldtext">이름</td>
								<td>아무게</td>
							</tr>

							<tr>
								<td class="boldtext">닉네임</td>
								<td>
									<div class="row">
										<input class="formChk ml-3" id="nicknameBox" type="text"
											name="nickname" placeholder="닉네임" required> <input
											id="nicknameChk" class=" ml-1" type="button" value="중복확인">
									</div>
								</td>
							</tr>

							<tr>
								<td class="boldtext">생년월일</td>
								<td class="boldtext birthtext">
								<select class="formChk birthChk" id="birthY"
									name="birthY">
										<option value="none" selected>선택</option>
								</select> 년&nbsp;&nbsp; <select class="formChk birthChk" id="birthM" name="birthM">
										<option value="none" selected>선택</option>
								</select> 월&nbsp;&nbsp; <select class="formChk" id="birthD" name="birthD">
										<option value="none" selected>선택</option>
								</select> 일&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td class="boldtext">성별</td>
								<td>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input"
											id="customRadio" name="example" value="customEx"> <label
											class="custom-control-label" for="customRadio">남성</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input"
											id="customRadio2" name="example" value="customEx"> <label
											class="custom-control-label" for="customRadio2">여성</label>
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="2" class="text-center"><br> <input
									id="cancleBtn" type="button" name="cancle" value="취소"
									onclick="location.href='myPage.jsp'"> <input
									id="confirmBnt" type="button" name="confirm" value="확인"
									onclick=""></td>
							</tr>

						</table>
					</div>
				</form>
			</div>
			<!-- 본문 끝 -->

		</div>
	</div>

</div>

<%@ include file="../layout/footer.jsp"%>
<script src="Script/myPage3.js" type="text/javascript"></script>
<%@ include file="../layout/script_bottom.jsp"%>












