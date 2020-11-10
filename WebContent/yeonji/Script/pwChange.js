
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
				
			} else if (pw !== pwChk)  {
				$("#pwChk").css('margin-bottom','5px');
				$("#alert-danger").css('margin-bottom','0px');
				$("#alert-success").hide();
				$("#alert-danger").show();
				
				return false;
			}
		
		
	});
});