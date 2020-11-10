<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="../yeonsub/css/common.css">
<link rel="stylesheet" href="../yeonsub/css/freeWrite.css">


<!--css js 넣기 -->

<script>
function chkSubmit(){
	///////////////////////////////////////////////////////
	frm = document.forms["frm"];
	var b_nickname = frm["b_nickname"].value.trim();
	var title = frm["title"].value.trim();
	var b_pw = frm["b_pw"].value.trim();
	var content = frm["content"].value.trim();
	
	
	if(b_pw == "") {
		alert("비밀번호를 작성해야합니다.");
		frm["b_pw"].focus();
		return false;
	}

	if(b_nickname == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["nickname"].focus();
		return false;
	}
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	if(content == "") {
		alert("내용을 반드시 입력해주세요.");
		frm["content"].focus();
		return false;
	}
	/////////////////////////////////////////////////////////////
	return true;	
} // end chkSubmit()
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%@ include file="../layout/top2.jsp" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<div class="content">
	<div id="content-box">

		<div id="write-top-box">
			<h1><i class="fas fa-book-medical"></i>	글쓰기</h1>
			<img src="../layout/	assets/img/tiger_par-logo-B.svg" alt="navbar brand"
				class="navbar-brand write-logo">
			<h1 class="text-right">비회원</h1>
		</div>
		<form name="frm" action="nonWriteOk.tp" method="post"
			onsubmit="return chkSubmit()" enctype="Multipart/form-data">
			
			<div id="write-inner-box">
				<h4 style="display:inline-block">제목</h4>
				<input type="text" name="title" class="title-input"/>
				<hr>
				<h4 style="display:inline-block">작성자</h4>
				<input type="text" name="b_nickname" class="title-write" />
				<h4 style="display:inline-block">비밀번호</h4> <input type="password" name="b_pw" class="title-write" /><br>
			</div>
			
			
			<div id="write-content-box">
				<textarea onkeyup="adjustHeight()" name="content" class="wr-content"></textarea>
				<%-- 첨부파일 --%>
				<h4 style="display:inline-block; padding:20px 0">첨부파일</h4>
				<input type="file" name="file2">
			</div>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();" class="btn btn-warning" style="margin:20px 0;"/>
				<input type="submit" class="btn btn-warning" value="등록" />
			</div>
		</form>
		<br>


	</div>
</div>
<script>
function adjustHeight() {
	  var textEle = $('textarea');
	  var textEleHeight = textEle.prop('scrollHeight');
	  if(textEleHeight >= 400){
	  	textEle.css('height', textEleHeight+10);
	  }
};	
</script>
<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />
