// Birth Select Option Add =======
var nickNameChk = false;
var birthChk = $(".birthChk"); 
var birthY = $("#birthY");
var birthM = $("#birthM"); 
var birthD = $("#birthD");
var day = [31,28,31,30,31,30,31,31,30,31,30,31,29];
var regName = /^[가-힣]{2,4}$/;
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

	if ($("#name").val().trim().length == 0) {
		$("#name").focus();
		$('#name').tooltip({
			title : '너의 이름은'
		});
		
		
		return false;
	}
	
	if (!regName.test($("#name").val().trim())) {
		$("#name").focus();
		$('#name').tooltip({
			title : '이상한 이름인 것'
		});
		
		return false;
	}
	if ($("#pw").val().trim().length == 0) {
		$("#pw").focus();
		$('#pw').tooltip({
			title : '비밀번호 입력하세요.'
		});
		return false;
	}
	
	if (!regPsw.test($("#pw").val().trim())) {
		$("#pw").focus();
		$('#pw').tooltip({
			title : '영문, 숫자, 특수문자 조합 8~15 이소'
		});
		return false;
	}
	
	if (nickNameChk == false) {
		$("#nickname").focus();
		$('#nickname').tooltip({
			title : '중복체크를 하셔야 합니다.'
		});
		return false;
	}
	
	if ($("#nickname").val().trim().length == 0) {
		$("#name").focus();
		$('#name').tooltip({
			title : '너의 닉네임은'
		});
		return false;
	} 
	
	if (!regNick.test($("#nickname").val().trim())) {
		//"2~10자의 한글, 영문, 숫자만 사용할 수 있습니다."
		$("#nickname").focus();
		$('#nickname').tooltip({
			title : '닉네임이 이상한 것'
		});
		return false;
	}
	
	if ($("#birthY").val().trim() == "none") {
		$("#birthY").focus();
		$('#birthY').tooltip({
			title : '너가 태어난 연도는?'
		});
		return false;
	}
	
	if ($("#birthM").val().trim() == "none") {
		$("#birthM").focus();
		$('#birthM').tooltip({
			title : '너가 태어난 월은?'
		});
		return false;
	}
	
	if ($("#birthD").val().trim() == "none") {
		$("#birthD").focus();
		$('#birthD').tooltip({
			title : '너가 태어난 일은?'
		});
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
		$('#nickname').tooltip({
			title : '너의 닉네임은'
		});
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
function cancelDuplicationConfirm(){
	nickNameChk = false;
}




