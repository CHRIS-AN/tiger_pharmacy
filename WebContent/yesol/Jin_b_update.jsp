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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
				
				<div><!-- 내용 감싸는 div -->
				<form name="frm"
					action="Jin_b_updateOk.tp?catagory=${param.catagory}&u_uid=${param.u_uid }&b_uid${param.b_uid}"
					method="post" onsubmit="return chkSubmit()"	encType="Multipart/form-data">
					<input type="hidden" name="b_uid" value="${list[0].b_uid }"/>
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
						<div id="delFiles"></div>
						<%-- 삭제할 file의 bf_uid 값(들)을 담기 위한 div --%>
						<div id="file1_W">
							<span class="red">*</span>증빙서류 &nbsp;
							<div id="file1_origin"><!-- 기존 file1 감싸는 div -->
								${list[0].file1 }
								<button type="button"
									onclick="deleteFile1('${list[0].file1 }')">삭제</button>
								<br>
								<div style="width: 300px">
									<!-- 증빙자료 -->
									<img style="width: 100%; height: auto"
										src="../upload/${list[0].file1 }" />
								</div><!-- end img -->
							</div><!-- 기존 file1 감싸는 div -->
							<div id="file1Up"></div><!-- file2삭제시 새로운 파일을 업로드 해줄 input 들어오는 곳 -->
							
					</div>
					<!-- end file1_W -->

					<br>

					<!-- file2 -->
					<c:choose>
						<c:when test="${list[0].file2 != null}">
							<div id="file2_W">
								첨부파일 &nbsp;
								<div id="file2_origin">
									<!-- 기존 file2 감싸는 div -->
									${list[0].file2 }
									<button type="button"
										onclick="deleteFile2('${list[0].file2 }')">삭제</button>
									<br>
									<div style="width: 300px">
										<img style="width: 100%; height: auto;"
											src="../upload/${list[0].file2 }" />
									</div>
								</div>
								<!-- 기존 file2 감싸는 div -->
								<div id="file2Up"></div>
								<!-- file2삭제시 새로운 파일을 업로드 해줄 input 들어오는 곳 -->
							</div>
							<!-- end file2_W -->
						</c:when>
						<c:when test="${list[0].file2 != null}">
							<input type='file' id='file2' name='file2' readonly>
							<button type='button' onclick="cleanFile('#file2')">삭제</button>
						</c:when>
					</c:choose>
			</div><!-- end 첨부파일 wrap -->
			
			<br> <br> <input type="submit" value="수정" />
			</form>
			<script>
			
				function deleteFile1(fileUid){
					
					var cleanLocation = "#file1";
					
					
					
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid +"'>");
					
					$("#file1_origin").remove();
					
					$("#file1Up").append("<input type='file' id='file1' name='file1' readonly>" +
							"<button type='button' onclick='cleanFile(" + cleanLocation + ")'>삭제</button>"
							+ "(<button type='button' onclick='fileChk()'>업데이트 확인</button)");
				}
				
				function deleteFile2(fileUid){
					var cleanLocation = "#file2";
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid +"'>");
					
					$("#file2_origin").remove();
					
					$("#file2Up").append("<input type='file' id='file2' name='file2' readonly>" +
					"<button type='button' onclick='cleanFile(" + cleanLocation + ")'>삭제</button>");
				}
				
				function cleanFile(fileId) {
					$(fileId).val("");
				}
				
				function fileChk(){
					console.log("파일1 : " + $("#file1").val());
				}
						
			</script>

			
			
			</div> <!-- 내용 감싸는 div -->

			<button onclick="history.back()">이전으로</button>
			<button
				onclick="location.href='Jin_b_list.tp?catagory=${param.catagory}&u_uid=${param.u_uid }">목록보기</button>
			<br>
		</div>
		</div>

	</c:otherwise>
</c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />