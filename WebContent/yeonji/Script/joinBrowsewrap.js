var agreeAll = $("input:radio[name=agreeAll]");
var radioBox = $("input:radio");
var checkBox = $("input:checkbox");
var checkBoxV = ["locationChk", "promotionChk"];
var checkBoxL = checkBoxV.length;

//모두동의 누르면 라디오와 체크박스 모두 체크
agreeAll.on("click", function(){
    radioBox.prop('checked', true);
    checkBox.prop('checked', true);
});

//위치나 프로모션 중 하나만 체크되면 모두동의는 no체크 둘다 체크되면 모두 체크
checkBox.on("click",
function(){
    var cnt = 0;
    
    for(i = 0; i < checkBoxL; i++){ 
        var inputCB = $("input:checkbox[value=\""+ checkBoxV[i]+"\"]");

        if(inputCB.is(":checked") == false){
            agreeAll.prop('checked', false);
        } else if(inputCB.is(":checked") == true){
            cnt++;
            
            if(cnt == 2) agreeAll.prop('checked', true);
        }
    }
});

var cancleBtn = $("#cancleBtn");

//취소버튼 클릭시 메인페이지 이동
cancleBtn.on("click", function(){
    location.href = '../layout/index.tp';
});


var agree = ["agree1", "agree2"];
var agreeL = agree.length;
var chkBtn = $("#chkBtn");

//확인버튼 클릭시 필수동의가 모두 체크되지않으면 체크하라는 알럿창이 뜨고  모두 체크되면 joinImpo-email로 이동
chkBtn.on("click", function () {
    for (i = 0; i < agreeL; i++) {
        var inputRadio = $("input:radio[name=\"" + agree[i] + "\"]");
        
        if (!inputRadio.is(":checked")) {
            alert("필수사항을 모두 체크해주세요.");
            inputRadio.focus();

            return false;
        }
    }
    location.href = 'emailChk.tp';
});
