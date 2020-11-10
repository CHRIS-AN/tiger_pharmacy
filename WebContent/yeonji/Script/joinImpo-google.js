// Birth Select Option Add =======
var nickNameChk = false;
var birthChk = $(".birthChk"); 
var birthY = $("#birthY");
var birthM = $("#birthM"); 
var birthD = $("#birthD");
var day = [31,28,31,30,31,30,31,31,30,31,30,31,29];

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
	if (!nickNameChk) {
		$("#nickname").focus();
		$('#nickname').tooltip({
			title : '중복체크를 하셔야 합니다.'
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
		url : "usernickcheck.tp?regType=json",
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





