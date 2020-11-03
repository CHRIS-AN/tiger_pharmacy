<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="yeonsup.beans.*"%>
<%
	//int u_uid = (Integer)session.getAttribute("u_uid");
int u_uid = 1;
// request에 담겨져 오는 것 회원 정보 dto
%>

<!-- 로그인 확인 -->


<jsp:include page="../layout/top.jsp" />
<link rel="stylesheet" href="css/common.css">
<%@ include file="../layout/top2.jsp"%>


	<jsp:include page="../layout/header.jsp" />
	<jsp:include page="../layout/sidebar.jsp" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!--컨텐츠가 들어가는 메인화면-->
	<div id="content-box">
		<div class="content-top-box">
			<div class="cotent-wrtie-top">
				<span>
					<!-- 아이콘 -->
				</span>
				<h1>자유톡</h1>
				<img alt="" src="" />
				<h1 style="text-align: right;">${user.u_nickName }님</h1>
				<div class="content-title">
					<h4>${board.title }</h4>
					<div>나이 ${user.gender }</div>
					<div>${board.b_regDate }</div>
				</div>
			</div>
			<div class="content-wrtie-main">
				<c:if test="${not empty board.file }">
					<ul>
						<li><a href="download.tp?b_uid=${board.b_uid }">${board.file }</a></li>
					</ul>
				</c:if>
				<div class="warinng-box"
					style="background: red; text-align: center; color: white;">
					<h1>경고 문구</h1>
				</div>
				<div class="content-main">${board.content }</div>
				<div class="content-image">

					<c:if test="${board.image == true }">
						<div style="width: 300px">
							<img style="width: 100%; height: auto;"
								src="../upload/${board.file }" />
						</div>
					</c:if>

				</div>
				<div class="comment-write-box">

					<div class="comment-write-top"></div>

					<div class="comment-write-form">
						<input type="hidden" name="b_uid" value="${param.b_uid}">
						<input type="hidden" name="u_uid" value="<%=u_uid%>">

						<textarea name="comment_content"
							style="width: 100%; height: 50px;"></textarea>

						<div class="text-right">
							<input type="button" onclick="inesrtComment()"
								class="btn btn-warning" value="등록">
						</div>
					</div>

					<div id="comments-box"></div>

				</div>
				<!-- end comment-write-box -->
				<div class="freeView-btn-box text-center">
					<button class="btn btn-warning"
						onclick="location.href = 'freeDeleteOk.tp?b_uid=${board.b_uid}'">삭제</button>
					<button class="btn btn-warning"
						onclick="location.href = 'freeUpdate.tp?b_uid=${board.b_uid}'">수정</button>
				</div>
				<!--<c:if test="${u_uid == user.u_uid }">-->
				<!--</c:if>-->
				<button class="btn btn-warning"
					onclick="location.href = 'freeTalk.tp'">목록</button>
				<!-- 회원글인지 여부 확인 -->
			</div>
			<!-- end content-top-box -->

		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />

	<script>
		// 댓글 불러오기
		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				console.log("error html = " + xhr.statusText);
			}
		});

		function inesrtComment() {
			if (chkComment()) {
				$.ajax({
					url : "/tiger_pharmacy/yeonsub/insert.ajax?regType=json",
					// data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
					data : {
						reply : $("textarea[name='comment_content']").val(),
						u_uid : $("input[name='u_uid']").val(),
						b_uid : $("input[name='b_uid']").val()
					},
					beforeSend : function() {
						console.log("시작 전...");
					},
					complete : function() {
						console.log("완료 후...");
					},
					success : function(data) { // 서버에 대한 정상응답이 오면 실행, callback
						console.log(data.status)
						if (data.status == "OK") { // 쿼리 정상 완료, executeUpdate 결과
							console.log("댓글 작성 완료");
							showHtml(data);
						}
					}
				})
			}
		};

		$
				.ajax({
					url : "/tiger_pharmacy/yeonsub/list.ajax?regType=json&b_uid=${param.b_uid}",
					beforeSend : function() {
						console.log("읽어오기 시작 전...");
					},
					complete : function() {
						console.log("읽어오기 완료 후...");
					},
					success : function(data) {
						console.log(data.status);

						showHtml(data);

					}
				})
		function showHtml(data) {
			var row = data.data;
			let t_html = "";
			let html = "";

			t_html = "<h4>댓글 <span>0</span> 개</h4>";

			//let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'>"; // 댓글 갯수 
			// 댓글 생성 for문  b_uid, c_uid, u_nickname, c_regdate, u_uid, reply
			for (let i = 0; i < data.count; i++) {

				t_html = "<h4>댓글 <span>" + data.count + "</span> 개</h4>";
				html += "<input type='hidden' name='reply_uid' value='" + row[i].c_uid + "'/>";
				html += "<input type='hidden' name='reply_input" + row[i].c_uid + "' value='" + row[i].reply + "'/>";
				html += "<div id='com-inner-box' style='width:100%; padding:30px 0px'>";
				html += "<div class='com-btn-box' style='float:right'>";
				html += "<a onclick='updateComment(" + row[i].c_uid
						+ ")'><i>수정</i></a>";
				html += "<a onclick='deleteComment(" + row[i].c_uid
						+ ")'><i>삭제</i></a>";
				html += "</div>";
				if (row[i].b_nickName != null) {
					html += "<h3>" + row[i].b_nickname
							+ " <span style='font-size:15px; padding:0 20px'>"
							+ row[i].c_regdate + "</span></h3>";
				} else {
					html += "<h3>" + row[i].u_nickname
							+ " <span style='font-size:15px; padding:0 20px'>"
							+ row[i].c_regdate + "</span></h3>";
				}
				html += "<div class='com_content'>";
				html += "<textarea value='" + row[i].reply
						+ "' class='txtarea-comment txt" + row[i].c_uid
						+ "' style='width:100%' readonly disabled>"
						+ row[i].reply + "</textarea>";
				html += "</div>";
				html += "<div style='display:none; float:right;'  class='update-btn-box upBtn" + row[i].c_uid + "' style='float:right'>";
				html += "<button class='btn btn-warning' onclick='submitUpdateCom("
						+ row[i].c_uid
						+ ", "
						+ row[i].u_uid
						+ ")'><i>확인</i></button>";
				html += "<button class='btn btn-warning' onclick='cancelComment("
						+ row[i].c_uid + ")'><i>취소</i></button>";
				html += "</div>";
				html += "</div>"

			}
			;
			// 댓글 필요한 것 
			// 1. 회원 아이디
			// 2. 게시판 아이디
			// 3. 한 게시판에 댓글이 여러개 달려있을 경우?
			// 4. 그 게시글에 대한 고유 번호?
			// 아니면 댓글 고유 번호?
			html += "</tbody></table>";

			$(".comment-write-top").html(t_html);
			$("#comments-box").html(html);
			$("textarea[name='comment_content']").val("");
			$("textarea[name='comment_content']").focus();
		}
		// 댓글 유효성 비었을때
		function chkComment() {

			var content = $.trim($("textarea[name='comment_content']").val());
			console.log($("textarea[name='comment_content']"));

			if (content == "") {
				alert("내용을 작성해주세요");
				$("textarea[name='comment_content']").focus();
				return false;
			}

			return true;
		}
		function deleteComment(reply_uid) {

			$.ajax({
				url : "/tiger_pharmacy/yeonsub/del.ajax?regType=json",
				data : {
					c_uid : reply_uid,
					u_uid : $("input[name='u_uid']").val(),
					b_uid : $("input[name='b_uid']").val()
				},
				beforeSend : function() {
					console.log("읽어오기 시작 전...");
				},
				complete : function() {
					console.log("읽어오기 완료 후...");
				},
				success : function(data) {

					console.log("comment를 정상적으로 삭제하였습니다.");
					showHtml(data);

				}
			})
		}
		function updateComment(reply_uid) {
			let textarea = $(".txt" + reply_uid);
			let replyValue = textarea.val();
			let btn_box = $(".com-btn-box"); // 수정 삭제 버튼
			let up_btn = $(".upBtn" + reply_uid); // 수적 클릭시 나오는 확인 취소 버튼

			up_btn.css("display", "");

			textarea.html(replyValue);
			textarea.attr("readonly", false);
			textarea.attr("disabled", false);
			textarea.focus();
		}
		function submitUpdateCom(reply_uid, u_uid) {

			$.ajax({
				url : "/tiger_pharmacy/yeonsub/update.ajax?regType=json",
				data : {
					c_uid : reply_uid,
					u_uid : u_uid,
					b_uid : $("input[name='b_uid']").val(),
					reply : $(".txt" + reply_uid).val()
				},
				beforeSend : function() {
					console.log("읽어오기 시작 전...");
				},
				complete : function() {
					console.log("읽어오기 완료 후...");
				},
				success : function(data) {

					console.log("comment를 정상적으로 수정하였습니다.");
					showHtml(data);

				}
			})
		}
		
		function cancelComment(reply_uid) { // 취소 버튼 클릭시

			let textarea = $(".txt" + reply_uid);
			let btn_box = $(".com-btn-box"); // 수정 삭제 버튼
			let up_btn = $(".update-btn-box"); // 수적 클릭시 나오는 확인 취소 버튼
			let replyValue = $("input[name=reply_input" + reply_uid + "]").val();

			textarea.val(replyValue);
			up_btn.css("display", "none");
			textarea.attr("readonly", true);
			textarea.attr("disabled", true);

		}
	</script>
	<jsp:include page="../layout/script_bottom.jsp" />