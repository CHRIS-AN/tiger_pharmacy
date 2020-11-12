var regName = /^[가-힣A-Za-z]$/;
var regNick = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,10}$/;
var regPsw = /^[A-Za-z0-9]{4,12}$/;

function chkInput() {
	if ($("#pw").val().trim().length == 0) {
		$("#pw").focus();
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(!regPsw.test($("#pw").val().trim())){
		$("#pw").focus();
		alert("유효한 비밀번호를 입력하세요.(4~12자 이내)");
		return false;
	}
	if (!nickNameChk) {
		$("#nickname").focus();
		alert("닉네임 중복확인을 하세요.");
		return false;
	}
	if (!regNick.test($("#nickname").val().trim())) {
		//"2~10자의 한글, 영문, 숫자만 사용할 수 있습니다."
		$("#nickname").focus();
		alert("유효한 닉네임 중복확인을 하세요.(2~10자 이내)");
		return false;
	}
}

function nnCheck(){
	let nickValue = $("#nickname").val();
	
	if(!nickValue) {
		$("#nickname").focus();
		alert("닉네임을 입력하세요.")
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

