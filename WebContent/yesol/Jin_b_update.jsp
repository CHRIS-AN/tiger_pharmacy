<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<!--css js 넣기 -->

<c:choose>
	<c:when test="${empty list || fm.length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다.");
			history.back();
		</script>
	</c:when>

	<c:otherwise>

		<script>
function chkSubmit(){
	
	frm = document.forms['frm'];
	var title = frm['title'].value.trim();
	var content = frm['content'].value.trim();
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	if (content == "") {
		alert("내용은 반드시 작성해야 합니다");
		frm["content"].focus();
		return false;
	}
	
	return true;
}
</script>

		<%@ include file="../layout/top2.jsp"%>
		<jsp:include page="../layout/header.jsp" />
		<jsp:include page="../layout/sidebar.jsp" />

		<div class="content">
			<div id="content-box">

				<h2>수정</h2>
				<form name="frm" action="Jin_b_updateOk.tp?catagory=${param.catagory}&u_uid=${param.u_uid }&b_uid=${param.b_uid }" method="post"
					onsubmit="return chkSubmit()">
					<input type="hidden" name="b_uid" value="${list[0].b_uid }">
					작성자: ${list[0].u_nickname }<br>
					제목: <input type="text" name="title" value="${list[0].title }"><br>
					내용:<br>
					<textarea name="content">${list[0].content }</textarea>
					<br> <br> <input type="submit" value="수정" />
				</form>

				<button onclick="history.back()">이전으로</button>
				<button onclick="location.href='Jin_b_list.tp?catagory=${param.catagory}&u_uid=${param.u_uid }">목록보기</button>
				<br>
		</div>
		</div>
	</c:otherwise>
</c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />