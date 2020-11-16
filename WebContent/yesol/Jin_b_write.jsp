<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

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
	} // end chkSubmit()
</script>

<link rel="stylesheet" href="CSS/common.css">
<link rel="stylesheet" href="CSS/Jin_b_write-update.css">

<%@ include file = "../layout/top2.jsp"%>
<%@ include file = "../layout/header.jsp"%>
<%@ include file = "../layout/sidebar.jsp"%>

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
			
			<h1 class="text-right">${nowuser.u_nickName}님</h1>
		</div>
		<!-- END 유저 닉네임 area -->
		
		<form name="frm" action="Jin_b_writeOk.tp?catagory=${param.catagory}" method="post"
			onsubmit="return chkSubmit()" encType="Multipart/form-data">
			
			<input type="hidden" name="u_uid" value="${nowuser.u_uid}"/>
			
			<div id="write-inner-box">
				<h4 class="one_line">제목</h4>
				<input type="text" name="title" class="long-input" maxlength="50" />
	
				<div class="clear"></div>
				
				<!-- 병원, 일자 -->
				<div>	
					<div class="div_inline">
						<h4 class="one_line"><span class="red">*</span> 방문병원</h4>
						<input type="text" name="hospital" class="short-input"/>
					</div>
					<div id="visit_box"class="div_inline">
						<h4 class="two_line"><span class="red">*</span> 방문일자</h4>
						<input type="date" class="short-input" name="visit" placeholder="yyyy-mm-dd"/>
					</div>
				</div>
				<!-- END 병원, 일자 -->
				
				<!-- 증상 -->
				<div>
					<h4 class="one_line"><span class="red">*</span> 증상</h4>
					<input type="text" class="long-input" name="symptom"/>
				</div>				
				<!-- END 증상 -->
			</div>
			<!-- END #write-inner-box -->
			
			<div id="write-content-box">
				<textarea name="content" class="wr-content"></textarea>
				
				<div class="display-block">
					<h4 class="one_line text_up"><span class="red">*</span> 증빙서류</h4>
					<input type="file" id="file1" name="file1" readonly/>
				</div>
				<div class="display-block">
					<h4 class="one_line">&nbsp;&nbsp;&nbsp;첨부파일</h4>
					<input id="file2" type="file" name="file2" readonly/>
					<button class="hide" type="button" id="delBtn" onclick="cleanFile('#file2')">삭제</button>
				</div>
			</div>
			<!-- write-content-box -->
			<div>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();" class="btn btn-warning"/>
				<input type="submit" value="등록" class="btn btn-warning"/>
			</div>
			</div>
			<!-- text-center -->
		</form>

	</div>
</div>

		<script>
			
		function cleanFile(fileId) {
			$(fileId).val("");
			$("#delBtn").addClass("hide");
		};
		
		$("#file2").on("change", function(){
			
			var fileV = $("#file2").val(); 
			
			if(fileV != ""){
				$("#delBtn").removeClass("hide");
			} else if(fileV == ""){
				$("#delBtn").addClass("hide");
			}
		});
			
		</script>
<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />