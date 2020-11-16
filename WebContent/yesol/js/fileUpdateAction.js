function cleanFile2(fileId) {
				$(fileId).val("");
				$("#delBtn2").addClass("hide");
			}
			
			
$("#file3").change(function(){
					console.log("여기는 들어오나?")				
				var fileV = $("#file3")[0].files[0].size;
				console.log("뭐닝" + fileV)
				
				if(fileV != 0){
				console.log("파일 있을때" + fileV)
					$("#delBtn2").removeClass("hide");
				} else if(fileV == 0){
					$("#delBtn2").addClass("hide");
				}
});