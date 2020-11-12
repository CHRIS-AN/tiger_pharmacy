// Birth Select Option Add =======
var nickNameChk = false;
var birthChk = $(".birthChk"); 
var birthY = $("#birthY");
var birthM = $("#birthM"); 
var birthD = $("#birthD");
var day = [31,28,31,30,31,30,31,31,30,31,30,31,29];
var regName = /^[가-힣A-Za-z]$/;
var regNick = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
var regPsw = /^[A-Za-z0-9]{6,12}$/;

function appendYearMonth(){
    var date = new Date();
    var year = date.getFullYear();
    var yearLen = year-120;
    
    for(i = year; i >= yearLen; i--){
        var addOption = $("<option>" + i + "</option>");
		birthY.append(addOption);                       
	}
    
    for(i = 1; i <= 12; i++){
        var addOption = $("<option>" + i + "</option>");
        birthM.append(addOption);
    }
}
appendYearMonth();

birthChk.on("change", function(){
    var year = $("#birthY option:selected").val();
    var yearIndex = $("#birthY option").index($("#birthY option:selected"));
    var mothIndex = $("#birthM option").index($("#birthM option:selected"));
    var dayLen = 0;

    if(yearIndex != 0 && mothIndex != 0){
    	birthD.html("<option value='none' selected>일</option>")
        if(mothIndex == 2 && year%4 == 0){
            dayLen = day[12];
        } else {
            dayLen = day[mothIndex-1];
        }
        
        for( i = 1; i <= dayLen; i++){
            var addOption = $("<option>" + i + "</option>");
            birthD.append(addOption);
        }
    }    
});
// Birth Select Option Add 끝 =======

var joinInputAll = [ "pw", "pwChk", "name", "nickname" ];
var joinInputAllL = joinInputAll.length;


function chkInput() {
	if ($("#pw").val().trim().length == 0) {
		$("#pw").focus();
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if($("#pw").val().trim().length < 4 || $("#pw").val().trim().length > 12){
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
	if ($("#birthY").val().trim() == "none") {
		$("#birthY").focus();
		alert("생년월일을 선택하세요.");
		return false;
	}
	if ($("#birthM").val().trim() == "none") {
		$("#birthM").focus();
		alert("생년월일을 선택하세요.");
		return false;
	}
	
	if(($("input:radio[id='male']").is(":checked")||$("input:radio[id='female']").is(":checked"))==false){
		alert("성별을 선택하세요.");
		return false;
	}
	return true;
}

function cancelduplicationConfirm(){
	console.log(nickNameChk)
	nickNameChk = false;
}

function nnCheck(){
	let nickValue = $("#nickname").val();
	
	if(!nickValue) {
		$("#nickname").focus();
		alert("닉네임을 입력하세요.");
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
$(function passwordChk() {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$("#pwChk").keyup(function() {
		var pw = $("#pw").val();
		var pwChk = $("#pwChk").val();
		
		
			if (pw == pwChk) {
				$("#pwChk").css('margin-bottom','5px');
				$("#alert-success").css('margin-bottom','0px');
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#joinButton").removeAttr("disabled");
				
			} else if (pw !== pwChk)  {
				$("#pwChk").css('margin-bottom','5px');
				$("#alert-danger").css('margin-bottom','0px');
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#joinButton").attr("disabled", "disabled");
				
				return false;
			}
		
		
	});
});





