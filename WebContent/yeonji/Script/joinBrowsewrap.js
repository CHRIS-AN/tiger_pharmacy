var agreeAll = $("input:radio[name=agreeAll]");
var radioBox = $("input:radio");
var checkBox = $("input:checkbox");
var checkBoxV = ["locationChk", "promotionChk"];
var checkBoxL = checkBoxV.length;


agreeAll.on("click", function(){
    radioBox.prop('checked', true);
    checkBox.prop('checked', true);
});


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

cancleBtn.on("click", function(){
    location.href = 'login.html';
});


var agree = ["agree1", "agree2"];
var agreeL = agree.length;
var chkBtn = $("#chkBtn");

chkBtn.on("click", function () {
    for (i = 0; i < agreeL; i++) {
        var inputRadio = $("input:radio[name=\"" + agree[i] + "\"]");
        
        if (!inputRadio.is(":checked")) {
            alert("필수사항을 모두 체크해주세요.");
            inputRadio.focus();

            return false;
        }
    }
    location.href = "join_2.html";
});
