<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="yeonji.beans.JoinUserDAO"%>
<%@ page import="yeonji.beans.JoinUserDTO"%>		
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="CSS/mypage.css">

<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<%
	Integer u_uid = (Integer)session.getAttribute("u_uid");	
	JoinUserDAO dao =  JoinUserDAO.getInstance();
	JoinUserDTO dto = dao.getUserInfo(u_uid);
	String gender = dto.getGender();
	request.setAttribute("gender", gender);
%>
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
				<form id="contentForm"action="myPage3Ok.tp" method="post"  onsubmit="return chkInput()">
					<div id="myPage3">
						<h2>나의 정보 수정</h2>

						<table class="table table-responsive center table3">
							<tr>
								<td class="boldtext">이메일</td>
								<td><%=dto.getEmail() %></td>
							</tr>

							<tr>
								<td class="boldtext">비밀번호</td>
								<td><input class="formChk" type="password" name="pw" id="pw"
									placeholder="영문, 숫자 조합(4~12자 이내)" required></td>
							</tr>

							<tr class="boldtext">
								<td>비밀번호 확인</td>
								<td><input class="formChk" type="password" name="pwChk" id="pwChk"
									placeholder="비밀번호 확인" required>
								</td>
							</tr>
							<tr id ="hide">
								<td><div></div></td>
								<td><div class="text-danger" style="font-weight: bold " >비밀번호가 일치하지 않습니다.</div></td>
							</tr>

							<tr>
								<td class="boldtext">이름</td>
								<td><%=dto.getName() %></td>
							</tr>

							<tr>
								<td class="boldtext">닉네임</td>
								<td>
									<div class="row">
										<input class="formChk ml-3"onkeyup="cancelduplicationConfirm()"  id="nickname" type="text"
											name="nickname" placeholder="한글, 영문, 숫자만 사용(2~10자 이내)" value="<%=dto.getU_nickname() %>" required> <input
											id="nicknameChk" onclick="nnCheck()" class=" ml-1" type="button" value="중복확인">
									</div>
								</td>
							</tr>

							<tr>
								<td class="boldtext">생년월일</td>
								<td class="boldtext birthtext"><%=dto.getBirth() %></td>
							</tr>

							<tr>
								<td class="boldtext">성별</td>
								<td>
									<div class="custom-control custom-radio custom-control-inline">
                                          <input type="radio" class="custom-control-input" id="male"
                                              name="gender" value="male">
                                          <label class="custom-control-label" for="male">남성</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                          <input type="radio" class="custom-control-input" id="female"
                                              name="gender" value="female">
                                          <label class="custom-control-label" for="female">여성</label>
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="2" class="text-center"><br> <input
									id="cancleBtn" type="button" name="cancle" value="취소"
									onclick="location.href='myPage.jsp'"> <input
									id="confirmBnt" type="submit" name="confirm" value="확인">
								</td>
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
<script>
function genderChk(){
	var input = document.getElementsByName('gender');
	var gender= "${gender}";
	if(gender == "male"){
		input[0].checked=true;
	}else if(gender == "female"){
		input[1].checked=true;
	}
}

genderChk();

</script>
   <script src="Script/myPage3.js" type="text/javascript"></script>
<%@ include file="../layout/script_bottom.jsp"%>












