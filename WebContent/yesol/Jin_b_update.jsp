<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<!-- 게시글 내용 분리  -->
<c:set var="contents" value="${list[0].content}" />
<c:set var="ho_start" value='${fn:indexOf(contents,"방문병원: ") }' />
<c:set var="vi_start" value='${fn:indexOf(contents,", 방문일자: ") }' />
<c:set var="sy_start" value='${fn:indexOf(contents,", 증상: ") }' />
<c:set var="con_start" value='${fn:indexOf(contents,", 내용: ") }' />

<c:set var='hospital'
	value='${fn:substring(contents, ho_start + 6, vi_start ) }' />
<c:set var='visit'
	value='${fn:substring(contents, vi_start + 8, sy_start ) }' />
<c:set var='symptom'
	value='${fn:substring(contents, sy_start + 6 ,con_start ) }' />
<c:set var='content' value='${fn:substringAfter(contents, ", 내용: ") }' />
<!-- 게시글 내용 분리  -->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="CSS/common.css">
<link rel="stylesheet" href="CSS/Jin_b_write-update.css">

<c:choose>
	<c:when test="${empty list || fm.length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다.");
			history.back();
		</script>
	</c:when>

	<c:otherwise>

		<script>
		function chkSubmit() {
			
			frm = document.forms["frm"];

			var title = frm["title"].value.trim();
			var hospital = frm["hospital"].value.trim();
			var visit = frm["visit"].value.trim();
			var symptom = frm["symptom"].value.trim();
			var content = frm["content"].value.trim();
			var importFile = frm["file1"].value.trim();


			if (title == "") {
				alert("제목은 필수 작성내용입니다.");
				frm["title"].focus();
				return false;
			}
			
			if (hospital == "") {
				alert("방문병원은 필수 작성내용입니다.");
				frm["hospital"].focus();
				return false;
			}
			
			if (visit == "") {
				alert("방문일은 필수 작성내용입니다.");
				frm["visit"].focus();
				return false;
			}
			
			if (symptom == "") {
				alert("증상은 필수 작성내용입니다.");
				frm["symptom"].focus();
				return false;
			}
			
			if (content == "") {
				alert("내용은 필수 작성내용입니다.");
				frm["content"].focus();
				return false;
			}

			if (importFile == "") {
				alert("증빙자료는 필수 작성내용입니다.");
				frm["file1"].focus();
				return false;
			}
	
	return true;
}
</script>

		<%@ include file="../layout/top2.jsp"%>
		<jsp:include page="../layout/header.jsp" />
		<jsp:include page="../layout/sidebar.jsp" />

		<div class="content">
			<div id="content-box">
				<!-- 유저 닉네임 area -->
				<div id="write-top-box">
					<h1><i class="fas fa-plus-square"></i>&nbsp;진료톡 -
					<c:choose>
						<c:when test="${param.catagory == 'jin_bi'}">
							비뇨기과			
						</c:when>
						<c:when test="${param.catagory == 'jin_jung'}">
							정신과
						</c:when>
					</c:choose>
					</h1>
					
					<img src="../layout/assets/img/tiger_par-logo-B.svg" alt="navbar brand"
						class="navbar-brand write-logo">
					
					<h1 class="text-right">${list[0].u_nickname}님</h1>
				</div>
				<!-- END 유저 닉네임 area -->

				<form name="frm" action="Jin_b_updateOk.tp?catagory=${param.catagory}&b_uid=${list[0].b_uid }
					" method="post"	onsubmit="return chkSubmit()" encType="Multipart/form-data">				
					
					<input type="hidden" name="u_uid" value="${list[0].u_uid}"/>
					
					<div id="write-inner-box">
						<h4 class="one_line">제목</h4>
						<input type="text" name="title" class="long-input" maxlength="50" value="${list[0].title }"/>
			
						<div class="clear"></div>
						
						<!-- 병원, 일자 -->
						<div>	
							<div class="div_inline">
								<h4 class="one_line"><span class="red">*</span> 방문병원</h4>
								<input type="text" name="hospital" class="short-input" value="${hospital }"/>
							</div>
							<div id="visit_box"class="div_inline">
								<h4 class="two_line"><span class="red">*</span> 방문일자</h4>
								<input type="date" class="short-input" name="visit" placeholder="yyyy-mm-dd" value="${visit }"/>
							</div>
						</div>
						<!-- END 병원, 일자 -->
						
						<!-- 증상 -->
						<div>
							<h4 class="one_line"><span class="red">*</span> 증상</h4>
							<input type="text" class="long-input" name="symptom" value="${symptom }"/>
						</div>				
						<!-- END 증상 -->
					</div>
					<!-- END #write-inner-box -->
					
					<div id="write-content-box">
						<textarea name="content" class="wr-content"><c:out value='${content }' /></textarea>
						
						<div class="display-block">
							<!-- file1 -->
							<div id="delFiles"></div>
							<%-- 삭제할 file의 bf_uid 값(들)을 담기 위한 div --%>
							<div id="file1_W">
								<h4 class="one_line"><span class="red">*</span> 증빙서류</h4>
								<div id="file1_origin"><!-- 기존 file1 감싸는 div -->
									<div class="downTxt">${list[0].file1 }</div>
									<input type="hidden" name="file1Chk" value="file1">
									<button type="button" id="delBtn" onclick="deleteFile('file1')">삭제</button>
								</div><!-- 기존 file1 감싸는 div -->
								<div id="file1Up"></div><!-- file2삭제시 새로운 파일을 업로드 해줄 input 들어오는 곳 -->
							</div>
							<!-- end file1_W -->
						</div>
						
						<div class="display-block">
							<!-- file2 -->
							<c:choose>
								<c:when test="${list[0].file2 != null}">
									<div id="file2_W">
										<h4 class="one_line">&nbsp;&nbsp;&nbsp;첨부파일</h4>
										<%-- 기존 file2 감싸는 div --%>
										<div id="file2_origin">
											<div class="downTxt">${list[0].file2 }</div>
											<input type="hidden" name="file2Chk" value="file2">
											<button type="button" id="delBtn" onclick="deleteFile('file2')">삭제</button>
										</div>
										<%-- 기존 file2 감싸는 div --%>
										<div id="file2Up"></div>
										<%-- file2삭제시 새로운 파일을 업로드 해줄 input 들어오는 곳 --%>
									</div>
									<%-- end file2_W --%>
								</c:when>
								<c:when test="${list[0].file2 == null}">
									<h4 class="one_line">첨부파일</h4>
									<input type="file" id="file2" name="file2" readonly/>
									<button class="hide" type="button" id="delBtn" onclick="cleanFile('#file2')">삭제</button>
								</c:when>
							</c:choose>
						</div>
					</div>
					<!-- write-content-box -->
					<div>
					<div class="text-center">
						<input type="button" value="취소" onclick="history.back();" class="btn btn-warning"/>
						<input type="submit" value="수정" class="btn btn-warning"/>
					</div>
					</div>
					<!-- text-center -->
				</form>
					
			
			</div>
		</div>

	</c:otherwise>
</c:choose>
			<script>
			
			function deleteFile(file){
				console.log("file : " + file)
				var cleanLocation;
				
				if(file == "file1"){
					console.log("file1삭제")
					cleanLocation = "#file1";
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + file +"'>");
					$(cleanLocation + "_origin").remove();
					$(cleanLocation + "Up").append("<input type='file' id=" + file + " name=" + file + " readonly>");
				} else if(file == "file2"){
					console.log("file2삭제")
					cleanLocation = "#file2";
					var file3 = "#file3";
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + file +"'>");
					$(cleanLocation + "_origin").remove();
					$(cleanLocation + "Up").append("<input type='file' id='file3'name=" + file + " readonly/>" +
							"<button type='button' id='delBtn2' class='hide' onclick='cleanFile(" + file3 + ")''>삭제</button>");
				}
			}
			
			function cleanFile(fileId) {
				$(fileId).val("");
				$("#delBtn").addClass("hide");
			}
			
			
			
			$("#file2").on("change", function(){
				var fileV = $("#file2").val();
				
				if(fileV != ""){
					$("#delBtn").removeClass("hide");
				} else if(fileV == ""){
					$("#delBtn").addClass("hide");
				}
			});
			
			// 기존파일이 삭제된 후 실행
			$(document).on("change","#file3" ,function(){
				var fileV = $("#file3").val();
				
				if(fileV != ""){
					$("#delBtn2").removeClass("hide");
				} else if(fileV == ""){
					$("#delBtn2").addClass("hide");
				}
			});
			
			$(document).on("click","#delBtn2" ,function(){
				$("#file3").val("");
				$("#delBtn2").addClass("hide");
			})
			
			</script>


<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />