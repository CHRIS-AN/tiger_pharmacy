function chkInput() {
	if ($("#pw").val().trim().length == 0) {
		$("#pw").focus();
		alert("비밀번호를 입력해주세요.")
		return false;
	}

	if (!nickNameChk) {
		$("#nickname").focus();
		alert("닉네임 중복확인 해주세요.")
		return false;
	}

	return true;
}

function nnCheck(){
	let nickValue = $("#nickname").val();
	
	if(!nickValue) {
		$("#nickname").focus();
		alert("닉네임을 입력해주세요.")
		return;
	}
	$.ajax({
		url : "usernickcheck.tp",
		data : {
			nickname : nickValue
		},
		beforeSend : function() {
			console.log("읽어오기 시작 전...");
		},
		complete : function() {
			console.log("읽어오기 완료 후...");
		},
		success : function(data) {
			console.log(data);
			if(data.result == 0){
				let chk = confirm("사용가능한 닉네임입니다.\n사용하시겠습니까?")
				if(chk)
					nickNameChk = true;
			} else {
				alert("중복된 닉네임입니다.")
			}
		}
	})
	
}
function cancelduplicationConfirm(){
	nickNameChk = false;
}


$(function passwordChk() {
	$("#hide").hide();
	
	$("input").keyup(function() {
		var pw = $("#pw").val();
		var pwChk = $("#pwChk").val();
		
		
			if (pw !== pwChk)  {
				$("#pwChk").css('margin-bottom','5px');
				$("#alert-danger").css('margin-bottom','0px');
				$("#hide").show();
				
				return false;
			}else if (pw == pwChk){
				$("#hide").hide();
			}
		
		
	});
});

