<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--각 버전 중 가장 최신 표준 모드를 선택하는 문서모드-->
<title>TIGER PHARMACY</title>
<meta name='viewport'
	content='width=device-width, initial-scale=1.0, shrink-to-fit=no' />
<link rel="icon" href="../layout/assets/img/tiger_par-tiger_img-B.png"
	type="image/x-icon" />
<!--탭 아이콘-->

<!-- Fonts and icons -->
<script src="../layout/assets/js/plugin/webfont/webfont.min.js"></script>
<%@ include file="../layout/top1_2.jsp"%>

<!-- CSS Files -->
<link rel="stylesheet" href="../layout/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/emailChk.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="wrapper">
		<div class="main-header container-fluid">
			<div class="row">
				<a href="../layout/index.jsp"> <img
					src="Img/tiger_par-logo-B.svg" alt="top brand" class="col">
				</a>
			</div>
		</div>

		<!--컨텐츠가 들어가는 메인화면-->
		<div class="main-panel">

			<div id="content">
				<div id="joinBrowcontainer">

					<!-- Join Form -->
					<div id="formCon">
						<form id="emailChkForm">
							<h1>이메일 인증</h1>

							<table>
								<colgroup>
									<col width="80%" />
									<col width="20%" />
								</colgroup>
								<tr>
									<td>
									<label>이메일</label>
									<input type="text"
										placeholder="실제 사용중인 이메일주소만 기입 가능(이메일 발송됨)" 
										id="userEmail" name="userEmail" data-toggle="tooltip" title="이메일을 입력해주세요."
										required></td>
									<td><input id="NumInputBtn" type="button"
										name="NumInputBtn" value="인증번호 받기"></td>
								</tr>

								<tr id="numTr" style="display: none;">
									<td colspan="2"><input type="password"
										placeholder="인증번호 입력하세요" id="numInput" name="numInput" required>
									 <div class="alert alert-info" id="alert-info">메일로 보내드린 인증번호 6자리를 입력해주세요.</div>
									 </td>
								</tr>

								<tr>
									<td colspan="2" class="text-center"><input id="cancleBtn"
										type="button" name="cancle" value="취소"
										onclick="location.href='../layout/index.jsp'"> <input
										id="emailNumConfirm" type="button" name="emailNumConfirm"
										value="확인" ></td>
								</tr>
							</table>

						</form>
					</div>

				</div>
			</div>
			<footer class="footer container-fluid">
				<div class="row">
					<div class="col">
						2020, made with <i class="fa fa-heart heart text-danger"></i> by
						JungminYesolYeonsubYeonji
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="Script/emailChk.js" type="text/javascript"></script>
</body>
</html>
