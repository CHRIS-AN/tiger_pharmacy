<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSTL 버젼으로 바뀌면, import 의 번잡합도,  Java 변수 선언도 사라진다! --%>

<c:choose>
	<c:when test="${empty list || fn.length == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다.");
			history.back(); // 정보가 없으면 이전 페이지로 돌아가기
		</script>
	</c:when>

	<c:otherwise>
		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${list[0].title }</title>
</head>

<style>
.hide {
	display: none;
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function chkDelete(b_uid){
	// 삭제 여부, 다시 확인하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'Jin_b_deleteOk.tp?catagory=${pram.catagory}&u_uid=${param.u_uid }&b_uid=' + b_uid;
	}
}
</script>
<body>
	<h2>읽기 ${list[0].title }</h2>
	<br> UID : ${list[0].b_uid }
	<br> 작성자 : ${list[0].u_nickname }
	<br> 제목: ${list[0].title }
	<br> 등록일: ${list[0].b_regdate }
	<br> 조회수: ${list[0].viewcnt }
	<br> 내용:
	<br>
	<hr>
	<div>${list[0].content }</div>
	<hr>
	<br>
	<button onclick="location.href='Jin_b_update.tp?catagory=${pram.catagory}&u_uid=${param.u_uid }&
	b_uid=${list[0].b_uid }'">수정하기</button>
	<button onclick="location.href='Jin_b_list.tp?catagory=${pram.catagory}&u_uid=${param.u_uid }'">목록보기</button>
	<button onclick="chkDelete(${list[0].b_uid })">삭제하기</button>
	<button onclick="location.href='Jin_b_write.tp?catagory=${pram.catagory}&u_uid=${param.u_uid }'">신규등록</button>

	<hr>

	<div id="com_W">
		<form name="frm">
			<textarea id="textBox" name="reply"></textarea>
			<br>
			<div class="left">
				<button type="button" id="btn_comment">등록</button>
			</div>
			<!-- end reply -->
		</form>
	</div>
	<!-- end com_W -->
	<div class="com_con"></div>
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
	
	var reply = $('#textBox').val().trim();
	var replyL = reply.length;
	
	if(replyL > 0){
		url = "comList_Insert.ajax?reqType=json&b_uid=${param.b_uid}"
		insertComList(url, reply);
	} else {
		alert('작성자 이름과 내용을 입력해주세요.');
	}
});
	
function insertComList(url, reply){
	$.ajax({
		url : url,
		data:{
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
} // end getComList()


// 수정버튼 클릭시
function comChange(c_uid) {
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	var btnSet2 = "#btnSet2_" + c_uid;
	
	$(comCon).addClass("hide");
	$(btnSet1).addClass("hide");
	$(comTxt).removeClass("hide");
	$(btnSet2).removeClass("hide");
}


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
}


// 수정 - 확인 버튼 클릭시
function comUpdate(c_uid){
	
	var updateOk = confirm("댓글을 수정하시겠습니까?")
	
	var comTxt = "#comTxt" + c_uid
	var replyUp = $(comTxt).val().trim();
	var replyUpL = replyUp.length;
	
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	var btnSet2 = "#btnSet2_" + c_uid;
	
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
							$(btnSet2).addClass("hide");
							$(comCon).removeClass("hide");
							$(btnSet1).removeClass("hide");
						}
					}
				});
		} else {
			alert('작성자 이름과 내용을 입력해주세요.');
		}
	}else{}
}


// 수정-취소버튼 클릭시
function comCancle(c_uid){
	var comCon = "#comCon" + c_uid;
	var comTxt = "#comTxt" + c_uid;
	var btnSet1 = "#btnSet1_" + c_uid;
	var btnSet2 = "#btnSet2_" + c_uid;
	
	var cancleOk = confirm("댓글 수정 취소하시겠습니까?")
	
	if(cancleOk){
		$(comTxt).addClass("hide");
		$(btnSet2).addClass("hide");
		$(comCon).removeClass("hide");
		$(btnSet1).removeClass("hide");
	}else{}
}

// ajax 데이터 추가
function parseJSON(jsonObj){
	var data = jsonObj.data;
	var com_W="";
	
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

		com_W += "<div>" // 수정 textarea div
		com_W += "<div><textarea class='hide' id='comTxt" + data[i].c_uid + "'>" + data[i].reply + "</textarea></div>";
		com_W += "<div id='btnSet2_" + data[i].c_uid + "' class='left hide'>" // 후에 본인이 쓴글인지 확인 후 본인 글일경우에만 보여주기
		com_W += "<button type='button' onclick='comUpdate(" + data[i].c_uid + ")'>확인</button>"
		com_W += "<button type='button' onclick='comCancle(" + data[i].c_uid + ")'>취소</button>"
		com_W += "</div>" // div.left
		com_W += "</div>" // end 수정 textarea div
		com_W += "</div>" // 댓글 전체 div
	} // end for
	$(".com_con").html(com_W);
	
	var clean = "";
	$('#writer').val(clean);
	$('#textBox').val(clean);

} // end parseJSON()
</script>

</body>
		</html>
	</c:otherwise>
</c:choose>