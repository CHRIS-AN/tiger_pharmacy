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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="CSS/pwModal.css" rel="stylesheet" type="text/css">
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

</head>
<body>
<h2>자유톡</h2>
<div class="date">
<h2>${list[0].b_nickname }</h2>
<br>
${list[0].b_regDate }<br>
</div>
조회수 : ${list[0].viewCnt }
<hr>
<div class="warn">
경고 문구
- 의료 관련 정보는 예민한 부분이라 법적 책임까지 갈 수 있음을 경고합니다.
</div>
<br>
<hr>
내용 : <br>
<div>
${list[0].content }
</div>
<hr>
<c:if test="${fn:length(fileList) > 0 }">
<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
	<ul>
		<c:forEach var="fileDto" items="${fileList }">
			<li><a href="nonDownload.tp?b_uid=${fileDto.b_uid }">${fileDto.file2_source }</a></li>
		</c:forEach>
	</ul>

	<%-- 이미지인 경우 보여주기 --%>
	<c:forEach var="fileDto" items="${fileList }">
		<c:if test="${fileDto.image == true }">
			<div style="width: 100px">
				<img style="width:100%; height: auto" src="../upload/${fileDto.file2 }"/>
			</div>
		</c:if>
	</c:forEach>
</div>
</c:if>
<br>
<br>
<br>
<br>
<br>
<hr>
<div>
작성자명: <input type="text" name="c_nickname" id="nickname"/>  비밀번호: <input type="password" name="c_pw" id="psw"/> 
<!---------- 이부분은 댓글 내용을 담는 곳!!!-------------->
<input type="text" name="reply" id="reply"/>

<input type="button" id="sendBtn" value="댓글등록"/>
<!-- 댓글내용이 들어 갈 곳이다. -->
<table id="JSON"></table>
</div>
<script>

$(document).ready(function(){
		getList();
});

$("#sendBtn").on("click", function(){
		getUpdateList();
				
});

function chk(c_uid) { // 여기서, 
	console.log(c_uid)
	
	$("span#num"+c_uid).addClass('hide');
	console.log("span#num"+c_uid)
	$("div#revise"+c_uid).removeClass('hide');
	$("span#reviseBtn"+c_uid).addClass('hide');
	$("div#chkOk"+c_uid).removeClass('hide');
	
}


function chkDelete(c_uid) {
	let url = "${pageContext.request.contextPath}/jungmin/nonDeleteOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="+ c_uid;
	$.ajax({
		url :  url,
		type : "GET",
		cache : false,
		success : function(data, status){
				parseJSON(data);
		}
	 });
}

function chkUpdate(c_uid) {
	let url = "${pageContext.request.contextPath}/jungmin/nonUpdateOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="+ c_uid;
	$.ajax({
		url :  url,
		type : "GET",
		data : {
			reply : $("input[name='reviseReply"+ c_uid +"']").val()
		},
		cache : false,
		success : function(data, status){
			if(data.status == "OK") 
				parseJSON(data);
		}
	 });
}

function getList(){
	let url = "${pageContext.request.contextPath}/jungmin/nonView.ajax?reqType=json&b_uid=${param.b_uid}";
	$.ajax({
		url :  url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(data.status == "OK") 
				parseJSON(data);
		}
	 });
	
};
function getUpdateList(){
	let url = "${pageContext.request.contextPath}/jungmin/nonWrite.ajax?reqType=json&b_uid=${param.b_uid}";
	$.ajax({
		url :  url,
		type : "GET",
		data : { 
			c_nickname : $("input[name='c_nickname']").val(),
			c_pw : $("input[name='c_pw']").val(),
			reply : $("input[name='reply']").val()
		},
		cache : false,
		success : function(data, status){
			if(data.status == "OK") 
				parseJSON(data);
		}
	 });
};

function parseJSON(jsonObj) {
	var data = jsonObj.data;
	var i;
	var table="<tr><th>댓글번호</th><th>닉네임</th><th>댓글내용</th><th>작성일</th><th>상세정보</th></tr>";

	for (i = 0; i < jsonObj.count; i++) {
		table += "<tr>";
		table += "<td>" + data[i].c_uid + "</td>";	
		if(data[i].u_nickname == null || data[i].nickname == "") {
			table += "<td>" + data[i].c_nickname + "</td>";			
		}else {
			table += "<td>" + data[i].u_nickname + "</td>";
		}
		table += "<td><span id='num"+ data[i].c_uid +"'>" + data[i].reply + "</span></td>";
		table += "<td><div id='revise"+ data[i].c_uid +"' class='hide'><input type='text' name='reviseReply"+ data[i].c_uid +"'></div><div>";
		table += data[i].c_regdate + "</div></td>";
		if(data[i].u_nickname == null || data[i].u_nickname == "") {
			
			table += "<td><span id='reviseBtn"+ data[i].c_uid +"'><button onclick='chk("+ data[i].c_uid +")'>수정</button>";
			table += "<button onclick='chkDelete("+ data[i].c_uid +")'>삭제</button></span></td>";
			table += "<td><div class='hide' id='chkOk"+ data[i].c_uid +"'><button id='btnNum"+ data[i].c_uid +"' onclick='chkUpdate("+ data[i].c_uid +");'>확인</button>";
			table += "<button onclick='chkDelete("+ data[i].c_uid +")'>취소</button></div></td>";
		}else{
			table += "<td>"+ "" + "</td>";
		}
		table += "</tr>";
		//---------------
	} // end for

	$("#JSON").html(table);
	
	$('#nickname').val('');
	$('#psw').val('');
	$('#reply').val('');
} // end parseJSON()


</script>
 

<!-- ---------------------------------------------->
<div class="boardBtn">
<hr>
<button id="btn_Update" style="width: auto" onclick="">수정하기</button>
<button onclick="location.href='nonList.tp'">목록보기</button>
<button id="btn_Delete" style="width: auto" onclick="">삭제하기</button>
</div>


<!-- ------------------------------수정 수정 수정 수정 수정 수정 수정 수정-------------------------------- -->


<div id="modal_box" class="modal">

	<form class="modal-content animate" 
		action="pwChkU.tp?b_uid=${list[0].b_uid }" method="post">
	  <div class="imgcontainer">
  		<!-- 닫기버튼  -->
  		<span class="close" title="Close Modal">&times;</span>
	  </div>
	
	  <div class="container">
		<label for="psw"><b>Password</b></label>
		<input type="password" placeholder="Enter Password"
			name="password"  required>

		<button type="submit">수정</button>
	  </div>
	
	  <div class="container" style="background-color:#f1f1f1">
	    <!-- 취소 버튼 -->
	    <button type="button" class="cancelbtn">Cancel</button>
	    <!-- 비밀번호 잊으셨나요? -->
	    <span class="psw">Forgot <a href="#">password?</a></span>
	  </div>
	</form>
</div>


<script>
var modal_box = document.getElementById('modal_box');
var btn_Update = document.getElementById('btn_Update');
var btn_close = document.getElementsByClassName('close')[0];
var btn_cancel = document.getElementsByClassName('cancelbtn')[0];

btn_Update.onclick = function(){modal_box.style.display = "block"}
btn_close.onclick = function(){modal_box.style.display = "none"}
btn_cancel.onclick = function(){modal_box.style.display = "none"}


window.onclick = function(event){
	if(event.target == modal_box){
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
		<label for="psw"><b>Password</b></label>
		<input type="password" placeholder="Enter Password"
			name="password" required>

		<button type="submit">삭제</button>
	  </div>
	
	  <div class="container1" style="background-color:#f1f1f1">
	    <!-- 취소 버튼 -->
	    <button type="button" class="cancelbtn1">Cancel</button>
	    <!-- 비밀번호 잊으셨나요? -->
	    <span class="psw1">Forgot <a href="#">password?</a></span>
	  </div>
	</form>
</div>
<script type="text/javascript">
</script>


<script>
var modal_box1 = document.getElementById('modal_box1');
var btn_Delete1 = document.getElementById('btn_Delete');
var btn_close1 = document.getElementsByClassName('close1')[0];
var btn_cancel1 = document.getElementsByClassName('cancelbtn1')[0];

btn_Delete1.onclick = function(){modal_box1.style.display = "block"}
btn_close1.onclick = function(){modal_box1.style.display = "none"}
btn_cancel1.onclick = function(){modal_box1.style.display = "none"}


window.onclick = function(event){
	if(event.target == modal_box){
		modal_box.style.display = "none";
	}
}
</script>


<!-- --------------------------------------------------------------------------------- -->
</body>
</html>

	</c:otherwise>
</c:choose>



