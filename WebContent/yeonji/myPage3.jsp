<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="col-sm-12">
				<form id="contentForm">
					<div id="myPage2">
						<h2>회원탈퇴 유의사항</h2>

						<table id="myPage2table" class="table">
							<tr>
								<td>
									<p class="ml-5">
										◈ 사용하고 계신 계정 abcd@aecd.com은 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>&nbsp;
										&nbsp; &nbsp;&nbsp;탈퇴한 아이디는 재사용 복구가 불가하오니 신중하게 선택하시기 바랍니다. <br>
										<br> ◈ 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다. <br>&nbsp;&nbsp;&nbsp;&nbsp;
										회원정보 및 게시글, 댓글 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>&nbsp;
										&nbsp;&nbsp;&nbsp; 필요한 데이터는 미리 백업을 해주세요.
									</p>
								</td>
							</tr>
							<tr>
								<td class="text-center"><input id="cancleBtn" type="button"
									name="cancle" value="취소"
									onclick="location.href='../layout/index.jsp'"> <input
									id="confirmBnt" type="button" name="confirmBnt" value="확인"></td>
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
<%@ include file="../layout/script_bottom.jsp"%>












