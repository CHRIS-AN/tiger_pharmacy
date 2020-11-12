<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
   int u_uid = 0;
if (session.getAttribute("u_uid") != null)
   u_uid = (Integer) session.getAttribute("u_uid");

pageContext.setAttribute("u_uid", u_uid);
%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>


<!--css js 넣기 -->

<c:choose>
   <c:when test="${empty list || fn:length(list) == 0 }">
      <script>
         alert("해당 정보가 삭제되거나, 없습니다. 다시 시도해주세요.");
         history.back();
      </script>
   </c:when>

   <c:otherwise>

      <link href="../yeonsub/css/common.css" rel="stylesheet"
         type="text/css">
      <link href="../yeonsub/css/freeView.css" rel="stylesheet"
         type="text/css">
      <link rel="stylesheet" href="CSS/nonView.css">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <script src="https://kit.fontawesome.com/bb29575d31.js"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"
         integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
         crossorigin="anonymous"></script>


      <style>
.hide {
   display: none;
}
</style>
      <%@ include file="../layout/top2.jsp"%>
      <jsp:include page="../layout/header.jsp" />
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="content-box">
         <div class="content-top-box">
            <div class="content-wrtie-top">
               <h1>
                  <i class="fas fa-book-medical"></i> 자유 톡
               </h1>
               <div class="date">
                  <c:choose>
                     <c:when test="${not empty user.u_nickname }">

                        <h2 style="text-align: right;">${user.u_nickname }님</h2>
                     </c:when>
                     <c:otherwise>
                        <h2 style="text-align: right;">${list[0].b_nickname }님</h2>
                     </c:otherwise>
                  </c:choose>
               </div>
               <div class="content-title">
                  <h4>${list[0].title }</h4>
                  <c:choose>
                     <c:when test="${not empty user }">
                        <div>나이 만 ${user.age } 세 ${user.gender }</div>
                     </c:when>
                     <c:otherwise>
                        <div>(비회원)</div>
                     </c:otherwise>
                  </c:choose>

                  <span>${list[0].b_regDate }</span>
               </div>
            </div>
            <div class="content-write-main">
               <div class="warinng-box">경고 문구 - 의료 관련 정보는 예민한 부분이라 법적 책임까지 갈
                  수 있음을 경고합니다.</div>
               <div class="freeView-btn-box" style="padding-bottom: 20px;">
                  <div style="overflow-y:scroll;" class="content-main">${list[0].content }</div>
                  <%-- 이미지인 경우 보여주기 --%>
                  <c:if test="${fn:length(fileList) > 0 }">
                     <c:forEach var="fileDto" items="${fileList }">
                        <c:if test="${fileDto.image == true }">
                           <div style="width: 100px">
                              <img style="width: 100%; height: auto"
                                 src="../upload/${fileDto.file2 }" />
                           </div>
                        </c:if>
                     </c:forEach>
                  </c:if>
                  <div style="flost: left; display: inline-block">
                     <button class="btn btn-warning"
                        onclick="location.href='../yeonsub/freeTalk.tp'">목록으로</button>
                  </div>
                  <div style="float: right; display: inline-block">
                     <c:if test="${empty user.u_uid }">
                        <button class="btn btn-warning" id="btn_Delete"
                           style="width: auto" onclick="">삭제하기</button>
                        <button class="btn btn-warning" id="btn_Update"
                           style="width: auto" onclick="">수정하기</button>
                     </c:if>
                  </div>
               </div>
            </div>
            <div class="download-box">
               <c:if test="${fn:length(fileList) > 0 }">
                  <div
                     style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
                     <ul>
                        <c:forEach var="fileDto" items="${fileList }">
                           	첨부파일: <li><a href="nonDownload.tp?b_uid=${fileDto.b_uid }">${fileDto.file2 }</a></li>
                        </c:forEach>
                     </ul>
                  </div>
               </c:if>
            </div>
            <div class="comment-write-box">
               <div class="comment-write-top"></div>
               
               <div class="comment-write-form">
                  댓글란: <input type="text" name="reply" id="reply" size='500'
                     style="width: 100%" placeholder="자극적인 댓글을 삼가해주세요." />
                      
                     작성자명: 
                     <input type="text" name="c_nickname" id="nickname" maxlength='10' size='500'
                     placeholder="닉네임을 입력해주세요." /> &nbsp&nbsp&nbsp&nbsp

                     비밀번호: 
                     <input type="password" name="c_pw" id="psw" maxlength='5'
                     placeholder="5자 비밀번호를 입력해주세요." /><br>
                     
                  <!---------- 이부분은 댓글 내용을 담는 곳!!!-------------->
                  <div class="text-right cs-btn-box">
                     <input type="button" id="sendBtn" class="btn btn-warning" value="등록" />
                  </div>
               </div>

               <!-- 댓글내용이 들어 갈 곳이다. -->
               <table id="JSON"></table>
            </div>


            <script>
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
                     //---------------
                  } // end for

                  $("#JSON").html(html);

                  $('#nickname').val('');
                  $('#psw').val('');
                  $('#reply').val('');
               } // end parseJSON()
            </script>




            <!-- ------------------------------수정 수정 수정 수정 수정 수정 수정 수정-------------------------------- -->


            <div id="revise_box" class="revise_box">

               <form class="reply_box_content"
                  action="pwChkU.tp?b_uid=${list[0].b_uid }" method="post">

                  <div class="pswContainer" style="top: 10px;">
                     <span class="close2" title="Close Modal"
                        style="width: 5%; left: 582px; top: 82px;">&times;</span>
                     <div style="bottom: 5px;">
                        <label for="psw"><b>비밀번호 : </b></label> <input
                           type="password" placeholder="*게시글 비밀번호를 입력해주세요."
                           name="password" style="width: 70%;">
                        <button class="btnCHK" type="submit" style="float: right">수정</button>
                     </div>
                  </div>
               </form>
            </div>


            <script>
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
            </script>

            <!-----------------------삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 삭제 -----------------------  -->


            <div id="delete_box" class="delete_box">

               <!-- Form : 이 위치에 form 을 넣습니다 -->
               <form class="reply_box_content"
                  action="pwChkD.tp?b_uid=${list[0].b_uid }" method="post">

                  <div class="pswContainer" style="top: 10px;">
                     <span class="close1" title="Close Modal"
                        style="width: 5%; left: 582px; top: 82px;">&times;</span>
                     <div style="bottom: 5px">
                        <label for="psw"><b>비밀번호 : </b></label> <input
                           type="password" placeholder="*게시글 비밀번호를 입력해주세요."
                           name="password" style="width: 70%;" />
                        <button class="btnCHK" type="submit" style="float: right">삭제</button>
                     </div>
                  </div>
               </form>
            </div>

            <script>
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
            </script>
         </div>
      </div>


      <!-- 댓글 수정. -->

      <div id="reply_box" class="reply_box">
         <div class="reply_box_content">
            <div class="pswContainer" style="top: 10px;">
               <span class="reply_close" title="Close Modal"
                  style="width: 5%; left: 582px; top: 82px;">&times;</span>
               <div style="bottom: 5px;">
                  <label for="psw"><b>비밀번호 : </b></label> <input type="password"
                     maxlength='5' placeholder="*댓글 비밀번호를 입력해주세요."
                     name="reply_revise_psw" id="reply_revise_psw" style="width: 70%;"/>
                  <button class="btnCHK"  id="reply_reviseBtn" name="reply_reviseBtn" onclick="reply_re();" type="button" style="float: right">수정</button>
               </div>
            </div>
         </div>
      </div>

      <script>
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
      </script>


      <!-- 댓글 삭제. -->

      <div id="reply_d_box" class="reply_d_box">
         <div class="reply_box_content">

            <div class="pswContainer" style="top: 10px;">
               <span class="reply_d_close" title="Close Modal"
                  style="width: 5%; left: 582px; top: 82px;">&times;</span>
               <div style="bottom: 5px;">
                  <label for="psw"><b>비밀번호 : </b></label> <input type="password"
                     maxlength='5' placeholder="*댓글 비밀번호를 입력해주세요."
                     name="reply_delete_psw" id="reply_delete_psw" style="width: 70%;">
                  <button class="btnCHK" type="submit" style="float: right" onclick="reply_de();" >삭제</button>
               </div>
            </div>
         </div>
      </div>


      <script>
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
      </script>


   </c:otherwise>
</c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />