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
<lqink rel="icon" href="<%=request.getContextPath()%>/layout/assets/img/tiger_par-tiger_img-B.png"
	type="image/x-icon" />
<!--탭 아이콘-->

<!-- Fonts and icons -->
<script src="<%=request.getContextPath()%>/layout/assets/js/plugin/webfont/webfont.min.js"></script>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/layout/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/layout/assets/css/atlantis.css">

</head>
<body>
