<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--각 버전 중 가장 최신 표준 모드를 선택하는 문서모드-->
<title>TIGER PHARMACY</title>
<meta name='viewport'
	content='width=device-width, initial-scale=1.0, shrink-to-fit=no' />
<link rel="icon" href="./assets/img/tiger_par-tiger_img-B.png"
	type="image/x-icon" />
<!--탭 아이콘-->

<!-- Fonts and icons -->
<script src="./assets/js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ './assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>

<!-- CSS Files -->
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/atlantis.css">

</head>
<body>


	<div class="wrapper">
		<!--화면의 크기에 따라 다르게 반응할 수 있음-->
		<div class="main-header">


			<!-- Logo Header 로고가 있는 헤더-->
			<div class="logo-header" data-background-color="orange">

				<a href="index.html" class="logo"> <img
					src="./assets/img/tiger_par-logo-W.svg" alt="navbar brand"
					class="navbar-brand"> <!--해더 이미지를 svg로 해야 하지만 일단 png로 대체-->
				</a>
				<!-- ↓ 모바일때 표시되는 메뉴 왼쪽버튼(PC 버젼에서는 보이지 않는다.) -->
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
					</span>
				</button>
				<!-- ↓ 모바일때 표시되는 메뉴 오른쪽버튼(PC 버젼에서는 보이지 않는다.) -->
				<button class="topbar-toggler more">
					<i class="icon-options-vertical"></i>
				</button>
				<!-- ↓ PC 버젼일때 표시되는 햄버거메뉴 버튼 -->
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->


			<!-- Navbar Header -->
			<!--검색창있는 헤더-->
			<nav class="navbar navbar-header navbar-expand-lg"
				data-background-color="orange2">
				<div class="container-fluid">
					<!--꽉찬 너비의 내비게이션 바-->
					<!--검색창-->
					<div class="collapse" id="search-nav">
						<form class="navbar-left navbar-form nav-search mr-md-3">
							<div class="input-group">
								<input type="text" placeholder="Search .."
									class="form-control ml-2">
								<!--검색창 글쓰는 곳-->
								<div class="input-group-prepend">
									<!--검색창 돋보기-->
									<button type="submit" class="btn btn-search mr-1">
										<i class="fa fa-search search-icon"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<!--↓ 모바일때 표시되는 메뉴 오른쪽버튼 안에 들어가는 것들-->
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<!-- 검색 -->
						<li class="nav-item toggle-nav-search hidden-caret"><a
							class="nav-link" data-toggle="collapse" href="#search-nav"
							role="button" aria-expanded="false" aria-controls="search-nav">
								<i class="fa fa-search"></i>
						</a></li>
						<!--로그인-->
						<li class="nav-item hidden-caret"><a class="nav-link "
							href="#" role="button" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-sign-in-alt"></i> <span class="ml-1">로그인</span>

						</a></li>
						<!--회원가입-->
						<li class="nav-item hidden-caret"><a class="nav-link "
							href="#" role="button" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-user-plus"> </i> <span class="ml-1">회원가입</span>
						</a></li>
						<!--그냥 빈칸. 왜 만들었냐면 눌리는 크기를 동일하게 하기 위해서 만듬-->
						<li class="nav-item hidden-caret"></li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>




		<!-- Sidebar 메뉴바-->
		<div class="sidebar sidebar-style-2">
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">

					<ul class="nav nav-primary">
						<li class="nav-item active"><a data-toggle="collapse"
							href="#dashboard" class="collapsed" aria-expanded="false"> <i
								class="fas fa-plus-square"></i>
								<p>진료톡</p> <span class="caret"></span>
						</a>
							<div class="collapse" id="dashboard">
								<ul class="nav nav-collapse">
									<li><a href="#"> <span class="sub-item">비뇨기과</span>
									</a></li>
									<li><a href="#"> <span class="sub-item">정신과</span>
									</a></li>
								</ul>
							</div></li>

						<li class="nav-item active"><a data-toggle="collapse"
							href="#" class="collapsed" aria-expanded="false"> <i
								class="fas fa-comments"></i>
								<p>자유톡</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->












		<!--컨텐츠가 들어가는 메인화면-->
		<div class="main-panel">
			
				<div class="content">
					<!--호랭이약국 소개-->
					<div class="panel-header ">
						<div class="page-inner py-5">
							<div
								class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
								<div>
									<h2 class="text-black pb-2 fw-extrabold">호랭이약국</h2>
									<h5 class="text-black op-7 mb-2">진료받은 기록을 공유하는 커뮤니티</h5>
								</div>
							</div>
						</div>
					</div>


					<div class="page-inner mt--5">
						<div class="row mt--2">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<div class="card-head-row card-tools-still-right">
											<h4 class="card-title fas fa-plus-square">비뇨기과</h4>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="table-responsive table-hover table-sales">

													<table
														class="table table-bordered table-head-bg-warning table-bordered-bd-warning">
														<thead>
															<tr>
																<th scope="col">글제목</th>
																<th>작성자</th>
																<th>일시</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
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
											<h4 class="card-title fas fa-plus-square">정신과</h4>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="table-responsive table-hover table-sales">

													<table
														class="table table-bordered table-head-bg-warning table-bordered-bd-warning">
														<thead>
															<tr>
																<th scope="col">글제목</th>
																<th>작성자</th>
																<th>일시</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
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
											<h4 class="card-title fas fa-comments">자유톡</h4>
										</div>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-8">
												<div class="table-responsive table-hover table-sales">

													<table
														class="table table-bordered table-head-bg-warning table-bordered-bd-warning">
														<thead>
															<tr>
																<th scope="col">글제목</th>
																<th>작성자</th>
																<th>일시</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
															<tr>
																<td>배가아파요</td>
																<td>지코</td>
																<td>2020-10-30</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				
			</div>

			<!--푸터-->
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="#"> 푸터에 </a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#"> 무슨 </a></li>
							<li class="nav-item"><a class="nav-link" href="#">
									내용넣을까? </a></li>
						</ul>
					</nav>
					<div class="copyright ml-auto">
						2020, made with <i class="fa fa-heart heart text-danger"></i> by <a
							href="#">JungminYesolYeonsubYeonji</a>
					</div>
				</div>
			</footer>
		</div>


	</div>

	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="./assets/js/core/popper.min.js"></script>
	<script src="./assets/js/core/bootstrap.min.js"></script>
	<!--이걸지우니까 메뉴에서 진료톡이 다운드롭이 안됨-->

	<!-- jQuery UI -->
	<script
		src="./assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="./assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="./assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Datatables 메뉴호버 -->
	<script src="./assets/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="./assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- Atlantis JS -->
	<script src="./assets/js/atlantis.min.js"></script>

</body>
</html>

