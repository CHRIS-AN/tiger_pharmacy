<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="assets/css/index.css">
<div class="content">
	<!--호랭이약국 소개-->
	<div class="panel-header ">
		<div class="page-inner py-5">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div class="containerBox">
					<div class="text-box">
						<h1 id="mainh1" class="text-black pb-2 fw-extrabold">&nbsp;호랭이약방</h1>
						<h5 id="mainh5" class="text-black op-7 mb-2">&nbsp;&nbsp; 진료받은 기록을 공유하는
							커뮤니티</h5>
					</div>
					 <img class="img-responsive" src="./assets/img/mainpageimg.jpg"/>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<div class="page-inner mt--5">
		<div class="row mt--2">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-head-row card-tools-still-right">
							<h4 class="card-title fas fa-plus-square">&nbsp;비뇨기과</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive table-hover table-sales">

									<table class="table ">
										<colgroup>
											<col style="width: 60%">
											<col style="width: 20%">
											<col style="width: 20%">
										</colgroup>

										<thead style="background-color: #FFFBD7;">
											<tr>
												<th scope="col" class="text-center">글제목</th>
												<th class="text-center">작성자</th>
												<th class="text-center">일시</th>
											</tr>
										</thead>

										<tbody>
											<%-- 게시글이 없을 경우  --%>
											<c:choose>
												<c:when test="${empty jin_bi || fn:length(jin_bi) == 0 }">
												</c:when>
												<%-- END 게시글이 없을 경우  --%>
												<c:otherwise>
													<c:forEach var="dto" items="${jin_bi }">
														<%-- .board-box 게시글 하나씩 div --%>
														<tr onclick="sendBoard_b(${dto.b_uid})" class="board_link">
															<td>${dto.title }</td>
															<td class="text-center">${dto.u_nickname }</td>
															<td class="text-center">${dto.b_regdate }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-head-row card-tools-still-right">
							<h4 class="card-title fas fa-plus-square">&nbsp;정신과</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive table-hover table-sales">

									<table class="table ">
										<colgroup>
											<col style="width: 60%">
											<col style="width: 20%">
											<col style="width: 20%">
										</colgroup>
										<thead style="background-color: #FFFBD7">
											<tr>
												<th scope="col" class="text-center">글제목</th>
												<th class="text-center">작성자</th>
												<th class="text-center">일시</th>
											</tr>
										</thead>
										<tbody>
											<%-- 게시글이 없을 경우  --%>
											<c:choose>
												<c:when
													test="${empty jin_jung || fn:length(jin_jung) == 0 }">
												</c:when>
												<%-- END 게시글이 없을 경우  --%>
												<c:otherwise>
													<c:forEach var="dto2" items="${jin_jung }">
														<%-- .board-box 게시글 하나씩 div --%>
														<tr onclick="sendBoard_j(${dto2.b_uid})" class="board_link">
															<td>${dto2.title }</td>
															<td class="text-center">${dto2.u_nickname }</td>
															<td class="text-center">${dto2.b_regdate }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row ">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-head-row card-tools-still-right">
							<h4 class="card-title fas fa-comments">&nbsp;자유톡</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div class="table-responsive table-hover table-sales">

									<table class="table ">
										<colgroup>
											<col style="width: 60%">
											<col style="width: 20%">
											<col style="width: 20%">
										</colgroup>
										<thead style="background-color: #FFFBD7;">
											<tr>
												<th scope="col" class="text-center">글제목</th>
												<th class="text-center">작성자</th>
												<th class="text-center">일시</th>
											</tr>
										</thead>
										<tbody>
											<%-- 게시글이 없을 경우  --%>
											<c:choose>
												<c:when test="${empty free || fn:length(free) == 0 }">
												</c:when>
												<%-- END 게시글이 없을 경우  --%>
												<c:otherwise>
													<c:forEach var="dto3" items="${free }">
														<%-- .board-box 게시글 하나씩 div --%>
														<tr onclick="sendBoard_f(${dto3.b_uid})" class="board_link">
															<td>${dto3.title }</td>
															<c:choose>
																<c:when test="${not empty dto3.b_nickName }">
																	<td class="text-center">${dto3.b_nickName }</td>
																</c:when>
																<c:otherwise>
																	<td class="text-center">${dto3.u_nickname }</td>
																</c:otherwise>
															</c:choose>
															<td class="text-center">${dto3.b_regdate }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>
<script>
	function sendBoard_b(b_uid) {
		location.href = "../yesol/Jin_b_view.tp?catagory=jin_bi&b_uid=" + b_uid;
	}
	function sendBoard_j(b_uid) {
		location.href = "../yesol/Jin_b_view.tp?catagory=jin_jung&b_uid=" + b_uid;
	}	
	function sendBoard_f(b_uid) {
		if(${not empty sessionScope.u_uid}){
			location.href = "../yeonsub/freeView.tp?b_uid=" + b_uid ;
		}else {
			location.href = "../jungmin/nonView.tp?b_uid=" + b_uid;
		}
	}	
</script>
