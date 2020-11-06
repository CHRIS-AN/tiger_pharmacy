// Birth Select Option Add =======
var birthChk = $(".birthChk");
var birthY = $("#birthY");
var birthM = $("#birthM");
var birthD = $("#birthD");
var day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 29 ];

function appendYearMonth() {
	var date = new Date();
	var year = date.getFullYear();
	var yearLen = year - 120;

	for (i = year; i >= yearLen; i--) {
		var addOption = $("<option>" + i + "</option>");
		birthY.append(addOption);
	}

	for (i = 1; i <= 12; i++) {
		var addOption = $("<option>" + i + "</option>");
		birthM.append(addOption);
	}
}
appendYearMonth();

birthChk.on("change", function() {
	var year = $("#birthY option:selected").val();
	var yearIndex = $("#birthY option").index($("#birthY option:selected"));
	var mothIndex = $("#birthM option").index($("#birthM option:selected"));
	var dayLen = 0;

	if (yearIndex != 0 && mothIndex != 0) {
		if (mothIndex == 2 && year % 4 == 0) {
			dayLen = day[12];
		} else {
			dayLen = day[mothIndex - 1];
		}

		for (i = 1; i <= dayLen; i++) {
			var addOption = $("<option>" + i + "</option>");
			birthD.append(addOption);
		}
	}
});
// Birth Select Option Add 끝 =======

var joinInputAll = [ "pw", "pwChk", "name", "nickname" ];
var joinInputAllL = joinInputAll.length;

console.log(joinInputAllL);
// 회원가입 버튼 클릭시 빈칸
$("#joinButton").click(function() {

	if ($("#pw").val().trim().length == 0) {
		$("#pw").focus();
		$('#pw').tooltip({
			title : '비밀번호 써라'
		});
		return false;
	}
	if ($("#pwChk").val().trim().length == 0) {
		$("#pwChk").focus();
		$('#pwChk').tooltip({
			title : '비밀번호 확인하게 다시 써라'
		});
	
	}else if($("#pwChk").val().trim().length !== 0) {
		passwordChk();
		
	}
	if ($("#name").val().trim().length == 0) {
		$("#name").focus();
		$('#name').tooltip({
			title : '너의 이름은'
		});
		return false;
	}
	if ($("#nickname").val().trim().length == 0) {
		$("#nickname").focus();
		$('#nickname').tooltip({
			title : '너의 닉네임은'
		});
		return false;
	}

	location.href = '../layout/index.jsp';

	// for(var i =0; i<joinInputAllL; i++){
	// var ok = "#" + joinInputAll[i];
	// console.log(ok);
	// if($(ok).val().trim().length==0){
	// $(ok).focus();
	// $(ok).tooltip({ title: '비밀번호 써라'});
	// }
	// }

});

$(function passwordChk() {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$("input").keyup(function() {
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

function blanckChk() {
	// 인증번호와 입력한 값이 같은지 확인후 같으면 joinImpo-email.jsp로 넘어가고 다르면 알럿 띄우기

}
