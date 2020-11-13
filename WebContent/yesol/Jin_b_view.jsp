<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<%
	int u_uid = (Integer)session.getAttribute("u_uid");
	pageContext.setAttribute("u_uid", u_uid);
%>

<!-- 게시글 내용 분리  -->
<c:set var="contents" value="${list[0].content}" />
<c:set var="ho_start" value='${fn:indexOf(contents,"방문병원: ") }' />
<c:set var="vi_start" value='${fn:indexOf(contents,", 방문일자: ") }' />
<c:set var="sy_start" value='${fn:indexOf(contents,", 증상: ") }' />
<c:set var="con_start" value='${fn:indexOf(contents,", 내용: ") }' />

<c:set var='hospital'
	value='${fn:substring(contents, ho_start + 6, vi_start ) }' />
<c:set var='visit'
	value='${fn:substring(contents, vi_start + 8, sy_start ) }' />
<c:set var='symptom'
	value='${fn:substring(contents, sy_start + 6 ,con_start ) }' />
<c:set var='content' value='${fn:substringAfter(contents, ", 내용: ") }' />
<!-- 게시글 내용 분리  -->

<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="CSS/common.css">
<link rel="stylesheet" href="CSS/Jin_b_view.css">

<c:choose>
	<c:when test="${empty list || fn.length == 0 }">
		<script>
		alert("존재하지 않는 게시글입니다.");
			history.back(); // 정보가 없으면 이전 페이지로 돌아가기
		</script>
	</c:when>

	<c:otherwise>

<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<script>
function chkDelete(b_uid){
	// 삭제 여부, 다시 확인하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'Jin_b_deleteOk.tp?catagory=${param.catagory}&u_uid=${param.u_uid }&b_uid=' + b_uid;
	}
}
</script>

<div id="content-box">
	<div id="background-img"></div>
	<div class="content-top-box">
	
		<div class="content-wrtie-top">
			<h1><i class="fas fa-plus-square"></i>진료톡 -
			<c:choose>
				<c:when test="${param.catagory == 'jin_bi'}">
					비뇨기과			
				</c:when>
				<c:when test="${param.catagory == 'jin_jung'}">
					정신과
				</c:when>
			</c:choose>
			</h1>
			
			<h2 style="text-align: right;" class="text-right">${list[0].u_nickname}님</h2>
			
			<div class="content-title">
				<h4> ${list[0].title }</h4>
				<div>
					나이 만 ${user.age } 세<!-- 여기 체크 -->
					${user.gender }
				</div>
				<span>${list[0].b_regdate }</span>
			</div>
		</div>
		<!-- END .content-wrtie-top -->
		
		<div class="content-write-main">
				
			<div class="warinng-box"
				style="background:none; text-align: center; color: red;">
				<h3 style="font-weight:bold"><i class="fas fa-dragon"></i> 호랭이 약방 경고 <i class="fas fa-dragon"></i><br><br>
					우리 몸의 상태와 우리가 모르는 병에 대해서 제대로 알아가고자 만든 커뮤니티 사이트입니다.<br>
					우리 몸의 상태와 직결되는 의료관련 게시글을 올리는 커뮤니티 사이트 입니다.<br>
					의료관련하여 전문적인 사이트가 될 수 있게 허위 정보가 포함되는 게시글은 삼가해주시길 바랍니다.<br><br>
					허위사실을 유포할 경우 형법이나 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 명예훼손죄나 형법 업무방해죄, 공직선거법 제250조, 전기통신기본법 제47조 1항'에 의거하여 처벌을 받습니다.
				</h3>
			</div>
			<!-- END .warinng-box -->
				
			<div class="freeView-btn-box" style="padding-bottom:20px;">
				<div>
					<!-- 증빙자료 + 병원정보 content -->
					<div style="width: 300px">
						<!-- 증빙자료 -->
						<img style="width: 100%; height: auto"
							src="../upload/${list[0].file1 }" />
					</div>
					<!-- end 증빙자료 -->
					<div>
						<!-- 병원정보 -->
						방문병원 :
						<c:out value='${hospital }' />
						<br> 방문일자 :
						<c:out value='${visit }' />
						<br> 증상 :
						<c:out value='${symptom }' />
						<br>
						<br>
					</div>
					<!-- end 병원정보 -->
				</div>
				<c:out value='${content }' />
				
				<div class="content-image">
				<c:if test="${list[0].file2 != null }">
					<div style="width: 300px">
						<img style="width: 100%; height: auto;"
							src="../upload/${list[0].file2 }" />
					</div>
			
					<div>
						<h4 style="display:inline-block; padding:20px 0">첨부파일 </h4><a href="download.tp?b_uid=${list[0].b_uid }">${list[0].file2 }</a>
					</div>
				</c:if>
				</div>
				
					<div style="flost:left; display:inline-block">
						<button class="btn btn-warning"
						onclick="location.href = 'Jin_b_list.tp?catagory=${param.catagory}&page=${param.page}'">목록</button>
					</div>
					<div style="float:right; display:inline-block">
						<c:if test="${u_uid == list[0].u_uid }">
							<button class="btn btn-warning"
								onclick="chkDelete(${list[0].b_uid })">삭제</button>
							<button class="btn btn-warning" onclick="location.href=
							'Jin_b_update.tp?catagory=${param.catagory}&b_uid=${list[0].b_uid }'">수정</button>
						</c:if>
						<!-- 회원글인지 여부 확인 -->
					</div>
				</div>
				<!-- .freeView-btn-box -->
				
				<div class="comment-write-box">

					<div class="comment-write-top"></div>

					<div class="comment-write-form">
						<h3>
							댓글 총 <span id='comTotal'>0</span>개
						</h3>
						<input type="hidden" name="b_uid" value="${param.b_uid}">
						<input type="hidden" name="u_uid" value="<%=u_uid%>">

						<textarea id="textBox" name="reply" class="comment_content" onkeyup="adjustHeight();"></textarea>

						<div class="text-right cs-btn-box">
							<input type="button" id="btn_comment"
								class="btn btn-warning" value="등록">
						</div>
					</div>

					<div id="comments-box"></div>
					
				</div>
				<!--END .comment-write-box -->
			</div>
			<!-- END .content-write-main -->
	</div>
	<!-- END .content-top-box -->
</div>
<!-- END .content-box -->

<script>

var url = "commentList.ajax?reqType=json&b_uid=${param.b_uid}"

function getComList(url){
	$.ajax({
		url : url,
		type : "post",
		cache : false,
		success : function(data,status){
			if(data.status == "OK"){
				parseJSON(data);
			}
		}
	});
} // end getComList()

	getComList(url); // 시작하자마자 가동되게
	

// 댓글 등록버튼 클릭시
$("#btn_comment").click(function(){
	
	var u_uid = "${param.u_uid}"
	var reply = $('#textBox').val().trim();
	var replyL = reply.length;
	
	if(replyL > 0){
		url = "comList_Insert.ajax?reqType=json&b_uid=${param.b_uid}"
		insertComList(url,u_uid, reply);
	} else {
		alert('작성자 이름과 내용을 입력해주세요.');
	}
});
	
function insertComList(url, u_uid, reply){
	$.ajax({
		url : url,
		data:{
			u_uid : u_uid,
			reply : reply
        },
		type : "post",
		cache : false,
		success : function(data,status){
			if(data.status == "OK"){
				parseJSON(data);
			}
		}
	});
}; // end getComList()


// 삭제버튼 클릭시
function comDelete(c_uid){
	
	var uidClass = "#com_" + c_uid;
	var deleteOk = confirm("댓글을 삭제하시겠습니까?")
	
	if(deleteOk){
		
		url = "comList_Delete.ajax?reqType=json&b_uid=${param.b_uid}"
		
		$.ajax({
			url : url,
			data:{
				c_uid : c_uid
		       },
			type : "post",
			cache : false,
			success : function(data,status){
				if(status == "success"){
					$(uidClass).remove();
				}
			}
		});
	} else{}
};


// 수정버튼 클릭시
function comChange(c_uid) {
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	
	$(comCon).addClass("hide");
	$(btnSet1).addClass("hide");
	$(comTxt).removeClass("hide");
};


// 수정 - 확인 버튼 클릭시
function comUpdate(c_uid){
	
	var updateOk = confirm("댓글을 수정하시겠습니까?")
	
	var comTxt = "#comTxt" + c_uid
	var comUp = "#comUp" + c_uid
	var replyUp = $(comUp).val().trim();
	var replyUpL = replyUp.length;
	
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	
	if(updateOk){
		if(replyUpL > 0){
			url = "comList_Update.ajax?reqType=json&b_uid=${param.b_uid}"
				
				$.ajax({
					url : url,
					data:{
						c_uid : c_uid,
						reply : replyUp
				       },
					type : "post",
					cache : false,
					success : function(data,status){
						console.log("data : " + data + ", status : " + status)
						if(status == "success"){
							$(comCon).html(replyUp);
							$(comTxt).addClass("hide");
							$(comCon).removeClass("hide");
							$(btnSet1).removeClass("hide");
						}
					}
				});
		} else {
			alert('댓글 내용을 입력해주세요.');
		}
	}else{}
};


// 수정-취소버튼 클릭시
function comCancle(c_uid){
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	
	var cancleOk = confirm("댓글 수정 취소하시겠습니까?")
	
	var goBack = $(comCon).text().trim();
	
	if(cancleOk){
		$(comTxt).addClass("hide");
		$(comTxt).val(goBack);
		$(comCon).removeClass("hide");
		$(btnSet1).removeClass("hide");
	}else{}
};

// ajax 데이터 추가
function parseJSON(jsonObj){
	var data = jsonObj.data;
	var com_W = "";
		
	$('#comTotal').html(data.length);

	for (var i = 0; i < data.length; i++) {
		com_W += "<div id='com_" + data[i].c_uid + "'>"
		com_W += "<br><div>" // div 윗줄
		com_W += "<h3 id='comName" + data[i].c_uid + "'>" + data[i].u_nickname + "</h3>";
		com_W += "<span>" + data[i].c_regdate + "</span>";
		com_W += "<div id='btnSet1_" + data[i].c_uid + "' class='left'>" // 후에 본인이 쓴글인지 확인 후 본인 글일경우에만 보여주기
		com_W += "<button type='button' onclick='comChange(" + data[i].c_uid + ")'>수정</button>"
		com_W += "<button type='button' onclick='comDelete(" + data[i].c_uid + ")'>삭제</button>"
		com_W += "</div>" // div .left
		com_W += "</div><br>" // div 윗줄
		
		com_W += "<div><span id='comCon" + data[i].c_uid + "'>" + data[i].reply + "</span></div><br>";

		com_W += "<div id='comTxt" + data[i].c_uid + "'>" // 수정 textarea div
		com_W += "<div><textarea class='hide' id='comUp" + data[i].c_uid + "'>" + data[i].reply + "</textarea></div>";
		com_W += "<div class='left'>" // 후에 본인이 쓴글인지 확인 후 본인 글일경우에만 보여주기
		com_W += "<button type='button' onclick='comUpdate(" + data[i].c_uid + ")'>확인</button>"
		com_W += "<button type='button' onclick='comCancle(" + data[i].c_uid + ")'>취소</button>"
		com_W += "</div>" // div.left
		com_W += "</div>" // end 수정 textarea div
		com_W += "</div>" // 댓글 전체 div
	} // end for
	$(".comments-box").html(com_W);
	
	var clean = "";
	$('#writer').val(clean);
	$('#textBox').val(clean);

}; // end parseJSON()

function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight+10);
}; // end adjustHeight()

</script>
	</c:otherwise>
</c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />