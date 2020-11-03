<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="yeonsup.beans.*"%>
<%
	int u_uid = (Integer)session.getAttribute("u_uid");
	// request에 담겨져 오는 것 회원 정보 dto
%>
<!-- 로그인 확인 -->

</script>
<jsp:include page="../layout/top.jsp"/>
<div class="wrapper">
	<jsp:include page="../layout/header.jsp"/>
	<jsp:include page="../layout/sidebar.jsp"/>
	
	<!--컨텐츠가 들어가는 메인화면-->
	<div class="main-panel">
		<div class="content-top-box container" style="background-image: src('../layout/assets/img/') ;margin: 0 auto; padding:150px 100px; box-shadow:0px 0px 5px #ccc; width:1000px; background:white;">
			<div class="cotent-wrtie-top">
				<span><!-- 아이콘 --></span>
				<h1>자유톡</h1>
				<img alt="" src=""/>
				<h1 style="text-align:right;">${user.u_nickName } 님</h1>
				<div class="content-title">
					<h4>${board.title }</h4>
					<div>
					나이 
					${user.gender }
					</div>
					<div>
					${board.b_regDate }
					</div>
				</div>
			</div>
			<div class="content-wrtie-main">
				<div class="warinng-box" style="background:red; text-align:center; color:white;">
					<h1>경고 문구</h1>
				</div>
				<div class="content-main">
					${board.content }
				</div>
				<div class="content-image">
					<img alt="file1" src="upload/${board.file1 }">
				</div>
			</div>
			<div class="comment-write-box">
				<div class="comment-write-top">
					<h4>댓글 <span>${fn:length(comments) }</span> 개</h4>
				</div>
				<div class="comment-write-form">
					<form name="comment" action="comment.ajax" method="post" onsubmit="return chkComment()">
						<input type="hidden" name="u_uid" value="user.u_uid">
						<input type="hidden" name="b_uid" value="board.b_uid">
						<textarea name="comment_content" style="width:100%; height:50px;"></textarea>
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="등록">
						</div>
					</form>
				</div>
				<div class="comments-box">
					<c:if test="${fn:length(comments) > 0 || not empty comments}">
						<c:forEach var="comment" items="${comments }">
							<div class="com-box">
								<div>
									<h4>${comments.u_nickName } <span>${comments.c_regdate }</span></h4>
									<p>${comments.reply }</p>
								</div>
								<div>
								<!-- 버튼 -->
								<a onclick="updateComment(${comment.c_uid})"><i>수정</i></a>
								<a onclick="deleteComment(${comment.c_uid})"><i>삭제</i></a>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			
		</div><!-- end content-top-box -->
			
		
		<jsp:include page="../layout/footer.jsp"/>
	</div>
</div>
<script>
function chkComment(){
	
}
</script>
<jsp:include page="../layout/script_bottom.jsp"/>