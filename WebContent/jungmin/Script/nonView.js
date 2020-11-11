

	$(document).ready(function() {
						getList();
					});

					$("#sendBtn").on("click", function() {
						getUpdateList();

					});

					function chk(c_uid) {
						$("span#num" + c_uid).addClass('hide');
						$("div#revise" + c_uid).removeClass('hide');
						$("span#reviseBtn" + c_uid).addClass('hide');
						$("div#chkOk" + c_uid).removeClass('hide');
					}

					
					var chkC_uid;
					
					function Revise_chkPassword(c_uid) {
						reply_box.style.display = "block";
						chkC_uid = c_uid;
					}

					function Delete_chkPassword(c_uid) {
						reply_d_box.style.display = "block";
						chkC_uid = c_uid;
					}
					
					function reply_de() {
						const userpsw = $("#reply_delete_psw").val();
						
					 	let url = "${pageContext.request.contextPath}/jungmin/nonPswChk.ajax?reqType=json";
					 	
				 		$.ajax({
				 			
							url : url,
							type : "POST",
							data : {
								'userPsw' : userpsw ,  'c_uid' : chkC_uid
							},
							cache : false,
							success : function(result) {
	
								if (result == 1){
									ckhDelete(chkC_uid);
									reply_d_box.style.display = "none";
									$('#reply_delete_psw').val('');
								}else {
									alert("비밀번호가 틀렸습니다.");
									reply_d_box.style.display = "none";
									$('#reply_delete_psw').val('');
								}
							}
						});
					}
					
					
					function reply_re() {
					 	const userPsw =  $("#reply_revise_psw").val();
					 	console.log("userPsw :" + userPsw);

					 	let url = "${pageContext.request.contextPath}/jungmin/nonPswChk.ajax?reqType=json";
					 	
				 		$.ajax({
				 			
							url : url,
							type : "POST",
							data : {
								'userPsw' : userPsw ,  'c_uid' : chkC_uid
							},
							cache : false,
							success : function(result) {
								console.log("여긴  r :" + result);
								console.log("chkC_uid :" + chkC_uid);
								if (result == 1){
									chk(chkC_uid);
									reply_box.style.display = "none";
									$('#reply_revise_psw').val('');
								}else {
									alert("비밀번호가 틀렸습니다.");
									reply_box.style.display = "none";
									$('#reply_revise_psw').val('');
								}
							}
						});
					 	
						
					}
					
					function ckhDelete(c_uid) {
						let url = "${pageContext.request.contextPath}/jungmin/nonDeleteOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="
	                        + c_uid;
	                  $.ajax({
	                     url : url,
	                     type : "GET",
	                     cache : false,
	                     success : function(data, status) {
	                        parseJSON(data);
	                     }
	                  });
					}
					

					function chkUpdate(c_uid) {

						let url = "${pageContext.request.contextPath}/jungmin/nonUpdateOk.ajax?reqType=json&b_uid=${param.b_uid}&c_uid="
								+ c_uid;
						$.ajax({
							url : url,
							type : "GET",
							data : {
								reply : $("input[name='reviseReply" + c_uid+ "']").val()
							},
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});
					}

					function getList() {
						let url = "${pageContext.request.contextPath}/jungmin/nonView.ajax?reqType=json&b_uid=${param.b_uid}";
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});

					};
					
					function getUpdateList() {
						let url = "${pageContext.request.contextPath}/jungmin/nonWrite.ajax?reqType=json&b_uid=${param.b_uid}";
						$.ajax({
							url : url,
							type : "GET",
							data : {
								c_nickname : $("input[name='c_nickname']")
										.val(),
								c_pw : $("input[name='c_pw']").val(),
								reply : $("input[name='reply']").val()
							},
							cache : false,
							success : function(data, status) {
								if (data.status == "OK")
									parseJSON(data);
							}
						});
					};
					
					function parseJSON(jsonObj) {
						var data = jsonObj.data;
						let t_html = "";
						let html = "";
						var i;

						for (i = 0; i < jsonObj.count; i++) {

							t_html = "<h4>댓글 <span>" + data.count
									+ "</span> 개</h4>";

							html += "<div id='com-inner-box' style='width:100%;'>";
							html += "<div class='com-btn-box' style='float:right'>";
							if (data[i].u_nickname == null
									|| data[i].u_nickname == "") {

								html += "<span id='reviseBtn"+ data[i].c_uid +"'><a onclick='Revise_chkPassword("
										+ data[i].c_uid
										+ ")'><i class='fas fa-pen reply-btn' ></i></a>&nbsp;&nbsp;";
								html += "<a onclick='Delete_chkPassword("
										+ data[i].c_uid
										+ ")'><i class='fas fa-trash reply-btn'></i></a></span>";
								html += "<div class='hide' id='chkOk"+ data[i].c_uid +"'><button id='btnNum"
										+ data[i].c_uid
										+ "' onclick='chkUpdate("
										+ data[i].c_uid + ");'>확인</button>";
								html += "<button onclick='getList("
										+ data[i].c_uid
										+ ")'>취소</button></div>";
							}
							html += "</div>";

							if (data[i].u_nickname == null
									|| data[i].c_nickname == "") {
								html += "<h3>"
										+ data[i].c_nickname
										+ " <span style='font-size:15px; padding:0 20px'>"
										+ data[i].c_regdate + "</span></h3>";
							} else {
								html += "<h3>"
										+ data[i].u_nickname
										+ " <span style='font-size:15px; padding:0 20px'>"
										+ data[i].c_regdate + "</span></h3>";
							}
							html += "<div class='comment-write-form'>";
							html += "<span id='num" + data[i].c_uid
									+ "' class='comment' style='width:100%'>"
									+ data[i].reply + "</span>";
							html += "<div id='revise"+ data[i].c_uid +"' class='hide'><input type='text' value='"+ data[i].reply +"' name='reviseReply"+ data[i].c_uid +"'></div>";
							html += "</div>";
							html += "</div>"
							
						}

						$("#JSON").html(html);

						$('#nickname').val('');
						$('#psw').val('');
						$('#reply').val('');
					} 
										

// 게시글 수정
			
					var revise_box = document.getElementById('revise_box');
					var btn_Update = document.getElementById('btn_Update');
					var btn_close = document.getElementsByClassName('close2')[0];

					btn_Update.onclick = function() {
						revise_box.style.display = "block"
					}
					btn_close.onclick = function() {
						revise_box.style.display = "none"
					}
					window.onclick = function(event) {
						if (event.target == revise_box) {
							revise_box.style.display = "none";
						}
					}		

// 게시글 삭제 

					var delete_box = document.getElementById('delete_box');
					var btn_Delete = document.getElementById('btn_Delete');
					var btn_close1 = document.getElementsByClassName('close1')[0];

					btn_Delete.onclick = function() {
						delete_box.style.display = "block"
					}
					btn_close1.onclick = function() {
						delete_box.style.display = "none"
					}
					window.onclick = function(event) {
						if (event.target == delete_box) {
							delete_box.style.display = "none";
						}
					}

// 댓글 수정

			var reply_box = document.getElementById('reply_box');
			var reply_close = document.getElementsByClassName('reply_close')[0];
			reply_close.onclick = function() {
				reply_box.style.display = "none"
			}

			window.onclick = function(event) {
				if (event.target == reply_box) {
					reply_box.style.display = "none";
				}
			}
			
// 댓글 삭제

			var reply_d_box = document.getElementById('reply_d_box');
			var reply_d_close = document
					.getElementsByClassName('reply_d_close')[0];
			reply_d_close.onclick = function() {
				reply_d_box.style.display = "none"
			}

			window.onclick = function(event) {
				if (event.target == reply_d_box) {
					reply_d_box.style.display = "none";
				}
			}
					
					
					
					
					
					
					
					
					
					
					