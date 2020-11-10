<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나, 없습니다. 다시 시도해주세요.");
			history.back();
		</script>
	</c:when>
		
<c:otherwise>


<link href="../yeonsub/css/common.css" rel="stylesheet" type="text/css">
<link href="../yeonsub/css/freeView.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="CSS/pwModal.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<title>게시글 ${list[0].title }</title>

<style>
.hide {
	display: none;
}
</style>

		<%@ include file="../layout/top2.jsp"%>
		<jsp:include page="../layout/header.jsp" />
		<jsp:include page="../layout/sidebar.jsp" />
		<div id="content-box">
			<div class="content-top-box">
				<div class="content-wrtie-top">
					<h1><i class="fas fa-book-medical"></i> 자유 톡</h1>
					<div class="date">
						<c:choose>
							<c:when test="${not empty user.u_nickName }">
								<h2 style="text-align: right;">${user.u_nickName } 님</h2>
							</c:when>
							<c:otherwise>
								<h2 style="text-align: right;">${list[0].b_nickname } 님</h2>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="content-title">
						<h4>${list[0].title }</h4>
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
						<span>${list[0].b_regDate }</span>
					</div>
				</div>
				<div class="content-write-main">
					<div class="warinng-box">경고 문구 - 의료 관련 정보는 예민한 부분이라 법적 책임까지 갈 수 있음을
						경고합니다.</div>
					<div class="freeView-btn-box" style="padding-bottom:20px;">
						<div class="content-main">${list[0].content }</div>
						<%-- 이미지인 경우 보여주기 --%>
						<c:if test="${fn:length(fileList) > 0 }">
							<c:forEach var="fileDto" items="${fileList }">
								<c:if test="${fileDto.image == true }">
									<div style="width: 100px">
										<img style="width: 100%; height: auto"
											src="../upload/${fileDto.file2 }" />
									</div>
								</c:if>
							</c:forEach>
						</c:if>
						<div style="flost:left; display:inline-block">
							<button class="btn btn-warning" onclick="location.href='../yeonsub/freeTalk.tp'">목록으로</button>
						</div>
						<div style="float:right; display:inline-block">
							<c:if test="${empty list[0].u_uid }">
								<button class="btn btn-warning"	 id="btn_Delete" style="width: auto" onclick="">삭제하기</button>
								<button class="btn btn-warning" id="btn_Update" style="width: auto" onclick="">수정하기</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="download-box">
					<c:if test="${fn:length(fileList) > 0 }">
						<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
							<ul>
								<c:forEach var="fileDto" items="${fileList }">
									<li><a href="nonDownload.tp?b_uid=${fileDto.b_uid }">${fileDto.file2_source }</a></li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
				</div>
				<div class="comment-write-box">
					<div class="comment-write-top"></div>
					<div class="comment-write-form">
						작성자명: <input type="text" name="c_nickname" id="nickname" /> 비밀번호:
						<input type="password" name="c_pw" id="psw" />
						<!---------- 이부분은 댓글 내용을 담는 곳!!!-------------->
						<input type="text" name="reply" id="reply" />
						<div class="text-right cs-btn-box">
							<input type="button" id="sendBtn" class="btn btn-warning" value="등록" />
						</div>
					</div>
					
					<!-- 댓글내용이 들어 갈 곳이다. -->
					<table id="JSON"></table>
				</div>
				

				<script>
					$(document).ready(function() {
						getList();
					});

					$("#sendBtn").on("click", function() {
						getUpdateList();

					});

					function chk(c_uid) { // 여기서, 
						console.log(c_uid)

						$("span#num" + c_uid).addClass('hide');
						console.log("span#num" + c_uid)
						$("div#revise" + c_uid).removeClass('hide');
						$("span#reviseBtn" + c_uid).addClass('hide');
						$("div#chkOk" + c_uid).removeClass('hide');

					}

					function chkDelete(c_uid) {
						let url = "${pageContext.request.contextPath}/jungmin/nonDeleteOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="
								+ c_uid;
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							success : function(data, status) {
								parseJSON(data);
							}
						});
					}

					function chkUpdate(c_uid) {
						let url = "${pageContext.request.contextPath}/jungmin/nonUpdateOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="
								+ c_uid;
						$.ajax({
							url : url,
							type : "GET",
							data : {
								reply : $(
										"input[name='reviseReply" + c_uid
												+ "']").val()
							},
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});
					}

					function getList() {
						let url = "${pageContext.request.contextPath}/jungmin/nonView.ajax?reqType=json&b_uid=${param.b_uid}";
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});

					};
					function getUpdateList() {
						let url = "${pageContext.request.contextPath}/jungmin/nonWrite.ajax?reqType=json&b_uid=${param.b_uid}";
						$.ajax({
							url : url,
							type : "GET",
							data : {
								c_nickname : $("input[name='c_nickname']")
										.val(),
								c_pw : $("input[name='c_pw']").val(),
								reply : $("input[name='reply']").val()
							},
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});
					};

					function parseJSON(jsonObj) {
						var data = jsonObj.data;
						let t_html = "";
						let html = "";
						var i;

						for (i = 0; i < jsonObj.count; i++) {
							
							t_html = "<h4>댓글 <span>" + data.count + "</span> 개</h4>";
							
							html += "<div id='com-inner-box' style='width:100%;'>";
							html += "<div class='com-btn-box' style='float:right'>";
							if (data[i].u_nickname == null
									|| data[i].u_nickname == "") {

								html += "<span id='reviseBtn"+ data[i].c_uid +"'><a onclick='chk("
										+ data[i].c_uid + ")'><i class='fas fa-pen reply-btn'></i></a>&nbsp;&nbsp;";
								html += "<a onclick='chkDelete("
										+ data[i].c_uid
										+ ")'><i class='fas fa-trash reply-btn'></i></a></span>";
								html += "<div class='hide' id='chkOk"+ data[i].c_uid +"'><button id='btnNum"
										+ data[i].c_uid
										+ "' onclick='chkUpdate("
										+ data[i].c_uid + ");'>확인</button>";
								html += "<button onclick='chkDelete("
										+ data[i].c_uid
										+ ")'>취소</button></div>";
							}
							html += "</div>";
							
							if (data[i].u_nickname == null
									|| data[i].c_nickname == "") {
								html += "<h3>" + data[i].c_nickname
								+ " <span style='font-size:15px; padding:0 20px'>" + data[i].c_regdate + "</span></h3>";
							} else {
								html +=  "<h3>" + data[i].u_nickname 
								+ " <span style='font-size:15px; padding:0 20px'>" + data[i].c_regdate + "</span></h3>";
							}
							html += "<div class='comment-write-form'>";
							html += "<span id='num"+ data[i].c_uid +"' class='comment' style='width:100%'>"
									+ data[i].reply + "</span>";
							html += "<div id='revise"+ data[i].c_uid +"' class='hide'><input type='text' name='reviseReply"+ data[i].c_uid +"'></div>";
							html += "</div>";
							html += "</div>"
							//---------------
						} // end for

						$("#JSON").html(html);

						$('#nickname').val('');
						$('#psw').val('');
						$('#reply').val('');
					} // end parseJSON()
				</script>




				<!-- ------------------------------수정 수정 수정 수정 수정 수정 수정 수정-------------------------------- -->


				<div id="modal_box" class="modal">

					<form class="modal-content animate"
						action="pwChkU.tp?b_uid=${list[0].b_uid }" method="post">
						<div class="imgcontainer">
							<!-- 닫기버튼  -->
							<span class="close" title="Close Modal">&times;</span>
						</div>

						<div class="container">
							<label for="psw"><b>Password</b></label> <input type="password"
								placeholder="Enter Password" name="password" required>

							<button type="submit">수정</button>
						</div>

						<div class="container" style="background-color: #f1f1f1">
							<!-- 취소 버튼 -->
							<button type="button" class="cancelbtn">Cancel</button>
						</div>
					</form>
				</div>


				<script>
					var modal_box = document.getElementById('modal_box');
					var btn_Update = document.getElementById('btn_Update');
					var btn_close = document.getElementsByClassName('close')[0];
					var btn_cancel = document
							.getElementsByClassName('cancelbtn')[0];

					btn_Update.onclick = function() {
						modal_box.style.display = "block"
					}
					btn_close.onclick = function() {
						modal_box.style.display = "none"
					}
					btn_cancel.onclick = function() {
						modal_box.style.display = "none"
					}

					window.onclick = function(event) {
						if (event.target == modal_box) {
							modal_box.style.display = "none";
						}
					}
				</script>

				<!-----------------------삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 -----------------------  -->


				<div id="modal_box1" class="modal1">

					<!-- Form : 이 위치에 form 을 넣습니다 -->
					<form class="modal-content animate1"
						action="pwChkD.tp?b_uid=${list[0].b_uid }" method="post">
						<div class="imgcontainer1">
							<!-- 닫기버튼  -->
							<span class="close1" title="Close Modal">&times;</span>
						</div>

						<div class="container1">
							<label for="psw"><b>Password</b></label> <input type="password"
								placeholder="Enter Password" name="password" required>

							<button type="submit">삭제</button>
						</div>

						<div class="container1" style="background-color: #f1f1f1">
							<!-- 취소 버튼 -->
							<button type="button" class="cancelbtn1">Cancel</button>
						</div>
					</form>
				</div>
				<script type="text/javascript">
					
				</script>


				<script>
					var modal_box1 = document.getElementById('modal_box1');
					var btn_Delete1 = document.getElementById('btn_Delete');
					var btn_close1 = document.getElementsByClassName('close1')[0];
					var btn_cancel1 = document
							.getElementsByClassName('cancelbtn1')[0];

					btn_Delete1.onclick = function() {
						modal_box1.style.display = "block"
					}
					btn_close1.onclick = function() {
						modal_box1.style.display = "none"
					}
					btn_cancel1.onclick = function() {
						modal_box1.style.display = "none"
					}

					window.onclick = function(event) {
						if (event.target == modal_box) {
							modal_box.style.display = "none";
						}
					}
				</script>
			</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>



