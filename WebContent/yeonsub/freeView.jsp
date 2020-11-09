<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="yeonsup.beans.*"%>
<!-- 로그인 확인 -->
<%
	int u_uid = 0;
	if(session.getAttribute("u_uid") != null)
		u_uid = (Integer)session.getAttribute("u_uid");
	
	pageContext.setAttribute("u_uid", u_uid);
%>

<c:if test="${empty board }">
	<script>
		alert("존재하지 않는 게시글입니다.");
		location.href = "freeTalk.tp";
	</script>
</c:if>

<%@ include file="../layout/top.jsp" %>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/freeView.css">
<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

	<!--컨텐츠가 들어가는 메인화면-->
	<div id="content-box">
		<div class="content-top-box">
			<div class="content-wrtie-top">
				<h1><i class="fas fa-book-medical"></i> 자유 톡</h1>
				<img alt="" src="" />
				<c:choose>
					<c:when test="${not empty user.u_nickName }">
						<h2 style="text-align: right;">${user.u_nickName } 님</h2>
					</c:when>
					<c:otherwise>
						<h2 style="text-align: right;">${board.b_nickName } 님</h2>
					</c:otherwise>
				</c:choose>
				<div class="content-title">
					<h4>${board.title }</h4>
					<c:choose>
						<c:when test="${not empty user }">
							<div>
								나이 만 ${user.age } 세
								${user.gender }
							</div>
						</c:when>
						<c:otherwise>							
							<div>
								(비회원)
							</div>
						</c:otherwise>
					</c:choose>
					
					<span>${board.b_regDate }</span>
				</div>
			</div>	
			<div class="content-write-main">
				
				<div class="warinng-box"
					style="background:none; text-align: center; color: red;">
					<h3><i class="fas fa-dragon"></i> 호랑이 약방 경고 <i class="fas fa-dragon"></i><br><br>
						우리 몸의 상태와 우리가 모르는 병에 대해서 제대로 알아가고자 만든 커뮤니티 사이트입니다.<br>
						우리 몸의 상태와 직결되는 의료관련 게시글을 올리는 커뮤니티 사이트 입니다.<br>
						의료관련하여 전문적인 사이트가 될 수 있게 허위 정보가 포함되는 게시글은 삼가해주시길 바랍니다.<br><br>
						허위사실을 유포할 경우 형법이나 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 명예훼손죄나 형법 업무방해죄, 공직선거법 제250조, 전기통신기본법 제47조 1항'에 의거하여 처벌을 받습니다.
					</h3>
				</div>
				<div class="freeView-btn-box" style="padding-bottom:20px;">
					<div class="content-main">${board.content }</div>
					<div class="content-image">
						<c:if test="${board.image == true }">
							<div style="width: 300px">
								<img style="width: 100%; height: auto;"
									src="../upload/${board.file }" />
							</div>
						</c:if>
					</div>
					<c:if test="${not empty board.file }">
						<ul>
							<li><a href="download.tp?b_uid=${board.b_uid }">${board.file }</a></li>
						</ul>
					</c:if>
					<br>
					<div style="flost:left; display:inline-block">
						<button class="btn btn-warning" onclick="location.href = 'freeTalk.tp?page=${param.page}'">목록</button>
					</div>
					<div style="float:right; display:inline-block">
						<c:if test="${u_uid == board.u_uid }">
							<button class="btn btn-warning"
								onclick="deleteBoard(${board.b_uid})">삭제</button>
							<button class="btn btn-warning"
								onclick="updateBoard(${board.b_uid})">수정</button>
						</c:if>
					</div>
				</div>
				<!-- 회원글인지 여부 확인 -->
				<div class="comment-write-box">

					<div class="comment-write-top"></div>

					<div class="comment-write-form">
						<input type="hidden" name="b_uid" value="${param.b_uid}">
						<input type="hidden" name="u_uid" value="<%=u_uid%>">

						<textarea name="comment_content" class="comment_content" onkeyup="adjustHeight();"></textarea>

						<div class="text-right cs-btn-box">
							<input type="button" onclick="inesrtComment()"
								class="btn btn-warning" value="댓글등록">
						</div>
					</div>

					<div id="comments-box"></div>

				</div>
				<!-- end comment-write-box -->
				
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
					url : "${pageContext.request.contextPath}/yeonsub/insert.ajax?regType=json",
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

		$.ajax({
				url : "${pageContext.request.contextPath}/yeonsub/list.ajax?regType=json&b_uid=${param.b_uid}",
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

			t_html = "<h4>전체 댓글 <span>0</span> 개</h4>";

			// 댓글 생성 for문  b_uid, c_uid, u_nickname, c_regdate, u_uid, reply
			for (let i = 0; i < data.count; i++) {
				let reply = row[i].reply;
				
				t_html = "<h4>댓글 <span>" + data.count + "</span> 개</h4>";
				html += "<input type='hidden' name='reply_uid' value='" + row[i].c_uid + "'/>";
				html += "<input type='hidden' name='reply_input" + row[i].c_uid + "' value='" + row[i].reply + "'/>";
				html += "<div id='com-inner-box' style='width:100%;'>";
				
				html += "<div class='com-btn-box' style='float:right'>";
				if(<%=u_uid %> == row[i].u_uid){
					html += "<a onclick='updateComment(" + row[i].c_uid + ")'><i class='fas fa-pen reply-btn'></i></a> &nbsp;&nbsp;";
					html += "<a onclick='deleteComment(" + row[i].c_uid + ")'><i class='fas fa-trash reply-btn'></i></a>";
				}
				html += "</div>";
				
				if (row[i].c_nickName != null) {
					html += "<h3>" + row[i].c_nickname
							+ " <span style='font-size:15px; padding:0 20px'>" + row[i].c_regdate + "</span></h3>";
				} else {
					html += "<h3>" + row[i].u_nickname 
							+ " <span style='font-size:15px; padding:0 20px'>" + row[i].c_regdate + "</span></h3>";
				}
				html += "<div class='com_content'>";
				html += "<div class='comment txt" + row[i].c_uid + "' style='width:100%;'>"
					  + convertbr(row[i].reply) +"</div>";
			  	html += "<textarea onkeyup='adjustHeight_b(" + row[i].c_uid + ")' class='txtarea" + row[i].c_uid + " reply' style='width:100%; height:300px; display:none; resize:none; overflow:hidden;'>"
			  	html += row[i].reply + "</textarea>"
				html += "</div>";
				html += "<div style='display:none;'  class='update-btn-box text-right upBtn" + row[i].c_uid + "' style='float:right'>";
				html += "<button class='btn btn-warning' onclick='submitUpdateCom(" + row[i].c_uid+ ", "+ row[i].u_uid + ")'><i>확인</i></button>";
				html += "<button class='btn btn-warning' onclick='cancelComment(" + row[i].c_uid + ")'><i>취소</i></button>";
				html += "</div>";
				html += "</div>";
				
				adjustHeight();
			}
			
			
			html += "</tbody></table>";
			$("textarea[name='comment_content']").val("");
			$(".comment-write-top").html(t_html);
			$("#comments-box").html(html);
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
			
			let chk = confirm("정말 삭제하시겠습니까?");
			if(chk){
				$.ajax({
					url : "${pageContext.request.contextPath}/yeonsub/del.ajax?regType=json",
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
		}
		function updateComment(reply_uid) {
			let text = $(".txt" + reply_uid);
			let replyValue = $("input[name=reply_input" + reply_uid + "]").val();
			let btn_box = $(".com-btn-box"); // 수정 삭제 버튼
			let up_btn = $(".upBtn" + reply_uid); // 수정 클릭시 나오는 확인 취소 버튼
			let textarea = $(".txtarea" + reply_uid);
			
			up_btn.css("display", "");
			textarea.css("display", "");
			text.css("display", "none")			
			textarea.html(replyValue);
			textarea.focus();
		}
		function submitUpdateCom(reply_uid, u_uid) {
			let chk = confirm("수정하시겠습니까?");
			if(chk){
				$.ajax({
					url : "${pageContext.request.contextPath}/yeonsub/update.ajax?regType=json",
					data : {
						c_uid : reply_uid,
						u_uid : u_uid,
						b_uid : $("input[name='b_uid']").val(),
						reply : $(".txtarea" + reply_uid).val()
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
		}
		
		function cancelComment(reply_uid) { // 취소 버튼 클릭시

			let text = $(".txt" + reply_uid);
			let btn_box = $(".com-btn-box"); // 수정 삭제 버튼
			let up_btn = $(".update-btn-box"); // 수적 클릭시 나오는 확인 취소 버튼
			let replyValue = $("input[name=reply_input" + reply_uid + "]").val();
			let textarea = $(".txtarea" + reply_uid);
		
			textarea.css("display", "none");
			up_btn.css("display", "none");
			text.css("display","");

		}
		function adjustHeight() {
			  var textEle = $('textarea');
			  textEle[0].style.height = 'auto';
			  var textEleHeight = textEle.prop('scrollHeight');
			  textEle.css('height', textEleHeight+10);
		};
		function adjustHeight_b(c_uid) {
			  var textEle = $('.txtarea' + c_uid);
			  textEle[0].style.height = 'auto';
			  var textEleHeight = textEle.prop('scrollHeight');
			  textEle.css('height', textEleHeight+10);
		};
		function convertbr(reply){
			  var str = reply.replace(/\r\n|\n/g,'<br>');
			  return str
		};
		function deleteBoard(b_uid){
			let chk = confirm("정말 삭제 하시겠습니까?")
			if(chk){
				location.href= "freeDeleteOk.tp?b_uid=" + b_uid;
			}
		}
		function updateBoard(b_uid){
			let chk = confirm("수정 하시겠습니까?")
			if(chk){
				location.href= "freeUpdate.tp?b_uid=" + b_uid;
			}
		}
	</script>
<jsp:include page="../layout/script_bottom.jsp" />