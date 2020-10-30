<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8;">
<title>자유톡 - 자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../assets/js/core/jquery.3.2.1.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>
<script src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
</head>
<script>

</script>
<body>
	<!-- 헤더 -->
	<div></div>
	
	<!-- nav -->
	<div></div>
	
	
	<!-- content -->
	<div id="content-top-box" class="container">
		<div id="freeTalk-box">
			<span class="icon-board"><i>😍</i></span>
			<h2>자유톡</h2>
			<div id="board-list-box">
			<!-- id 비회원 회원 구분하여 리스트 출력 -->
			<!-- 스타일 잡기 위한 예시용 리스트 -->
				<div class="table table-striped table-bordered table-hover">
					<table>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<tr>
							<td>100</td>
							<td>자유톡</td>
							<td>처음뵙겠습니다..</td>
							<td>세현맘</td>
							<td>2020-10-10</td>
							<td>52</td>
						</tr>
					</table>
				</div>
				<div class="page-btn">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
					</ul>
					<button>글쓰기</button>
				</div>
			</div>
			<div id="search-box">
			
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div></div>
</body>
</html>

