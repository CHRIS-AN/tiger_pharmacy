<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 본문 시작 -->
<div class="col-sm-9">
	<form id="contentForm">
		<div id="myPage1">
			<h2>계정확인</h2>
				<div>
					<div class="big-area" >
						<p class=" font-weight-bold text-right small-unit">Email</p>
						<p class=" font-weight-bold text-left text-secondary small-unit">aaa@example.com</p>
					</div>
					<div class="big-area">
						<p class=" font-weight-bold text-right small-unit">Password</p>

						<input class="formChk small-unit" type="password" name="pw"
							placeholder="비밀번호" required>
						</p>
					</div>
				</div>
			<div class="table-responsive center">
				<table id="myPage1table" class="table">
					<tr>
						<td><br>
							<p class="ml-5">
								개인정보를 안전하게 보호하기 위해 회원님의 비밀번호를 다시 한번 확인합니다.<br> 회원님의 계정은 외부에
								노출되지 않도록 주의해주세요.<br> 회원님의 개인정보를 위해 비밀번호는 주기적으로 변경해 주시길 권장해
								드립니다.
							</p></td>
					</tr>
				</table>
			</div>
			<div class="text-center mt-4">
				<input id="confirmBnt" type="button" name="confirmBnt" value="확인"
					onclick="location.href='myPage3.jsp'">
			</div>
		</div>
	</form>
</div>
<!-- 본문 끝 -->











