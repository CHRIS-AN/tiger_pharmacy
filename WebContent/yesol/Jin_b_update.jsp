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

<!--css js 넣기 -->

<style>
.hide {
	display: none;
}
</style>

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

				<h2>
					<i class="fas fa-plus-square"></i>진료톡 -
					<c:choose>
						<c:when test="${param.catagory == 'jin_bi'}">
							비뇨기과			
						</c:when>
						<c:when test="${param.catagory == 'jin_jung'}">
							정신과
						</c:when>
					</c:choose>
				</h2>
				<form name="frm"
					action="Jin_b_updateOk.tp?catagory=${param.catagory}&u_uid=${param.u_uid }&b_uid${param.b_uid}"
					method="post" onsubmit="return chkSubmit()"
					encType="Multipart/form-data">
					<input type="hidden" name="b_uid" value="${list[0].b_uid }">
					<h2>${list[0].u_nickname}님</h2>
					<br> 제목 <input type="text" name="title"
						value="${list[0].title }"><br>
					<table>
						<tr>
							<td>방문병원</td>
							<td><input type="text" name="hospital" value='${hospital }' /></td>
						</tr>
						<tr>
							<td>방문일자</td>
							<td><input type="text" name="visit" value='${visit }' /></td>
						</tr>
						<tr>
							<td>증상</td>
							<td><input type="text" name="symptom" value='${symptom }' /></td>
						</tr>
					</table>
					<textarea name="content"><c:out value='${content }' /></textarea>
					<br>

					<!-- 첨부파일 wrap -->
					<div>
						<!-- file1 -->
						<div id="file1_W">
							<span class="red">*</span>증빙서류 &nbsp;
							<span style="font-weight: bold;" id="oriFile1">${list[0].file1 }</span>&nbsp;
							<input type="hidden" name="file1" value="${list[0].file1 }">
							<button type="button" onclick="deleteFile('#file1_W')">삭제</button>
							<br>
							<div style="width: 300px">
								<!-- 증빙자료 -->
								<img style="width: 100%; height: auto"
									src="../upload/${list[0].file1 }" />
							</div>
						</div>
						<div id="newFile1" class="hide">
							<input type="file" id="file1" name="file1" readonly>
							<button type="button" onclick="cleanFile('#file1')">삭제</button>
							<br>
						</div>

						<br>

						<!-- file2 -->
						<c:choose>
						<c:when test="${list[0].file2 != null}">
						<div id="file2_W">
							첨부파일 &nbsp;
							<span style="font-weight: bold;" id="oriFile2">${list[0].file2 }</span>&nbsp;
							<input type="hidden" name="file2" value="${list[0].file2 }">
							<button type="button" onclick="deleteFile('#file2_W')">삭제</button>
							<br>
								<div style="width: 300px">
									<img style="width: 100%; height: auto;"
										src="../upload/${list[0].file2 }" />
								</div>
						</div>
						<div id="newFile2" class="hide">
							<input type="file" id="file2" name="file2" readonly>
							<button type="button" onclick="cleanFile('#file2')">삭제</button><br>
						</div>
						</c:when>

						<c:when test="${list[0].file2 == null}">
						<div id="newFile2">
							<input type="file" id="file2" name="file2" readonly>
							<button type="button" onclick="cleanFile('#file2')">삭제</button><br>
						</div>
						</c:when>
						</c:choose>
					</div>
					<br> <br> <input type="submit" value="수정" />
				</form>

				<button onclick="history.back()">이전으로</button>
				<button
					onclick="location.href='Jin_b_list.tp?catagory=${param.catagory}&u_uid=${param.u_uid }">목록보기</button>
				<br>
			</div>
		</div>
	
	<script>
		function deleteFile(fileW_Id){
			var showNew;
	
			if(fileW_Id == "#file1_W"){
				showNew = "#newFile1";
			} else if(fileW_Id == "#file2_W"){
				showNew = "#newFile2";
			}
			
			$(showNew).removeClass("hide");
			$(fileW_Id).remove();
		}
	
	
		function cleanFile(fileId) {
			$(fileId).val("");
		}
	</script>
	</c:otherwise>
</c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />