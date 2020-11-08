// Birth Select Option Add =======
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
	if ($("#nickname").val().trim().length == 0) {
		$("#nickname").focus();
		$('#nickname').tooltip({
			title : '너의 닉네임은'
		});
		return false;
	}
	
	return true;

}