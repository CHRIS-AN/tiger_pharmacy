<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--각 버전 중 가장 최신 표준 모드를 선택하는 문서모드-->
    <title>TIGER PHARMACY</title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0, shrink-to-fit=no' />
    <link rel="icon" href="../layout/assets/img/tiger_par-tiger_img-B.png" type="image/x-icon" />
    <!--탭 아이콘-->

    <!-- Fonts and icons -->
    <script src="../layout/assets/js/plugin/webfont/webfont.min.js"></script>
    <%@ include file="../layout/top1_2.jsp"%>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../layout/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/joinImpo-email.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>
    <div class="wrapper">
        <div class="main-header container-fluid">
            <div class="row">
                <a href="../layout/index.jsp"> <img src="Img/tiger_par-logo-B.svg" alt="top brand" class="col">
                </a>
            </div>
        </div>

        <!--컨텐츠가 들어가는 메인화면-->
        <div class="main-panel">

            <div id="content">
                <div id="joinBrowcontainer">
                    <!-- Join Form -->
                    <div id="formCon">
                        <form id="join">
                            <h1>회원가입</h1>
                                    <table class="table ">
                                        <tr>
                                            <td>이메일</td>
                                            <td>aaa@example.com</td>
                                        </tr>

                                        <tr>
                                            <td>비밀번호</td>
                                            <td>
                                                <input class="formChk" type="password" name="pw" placeholder="비밀번호"
                                                    required>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>비밀번호 확인</td>
                                            <td>
                                                <input class="formChk" type="password" name="pwChk"
                                                    placeholder="비밀번호 확인" required>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>이름</td>
                                            <td>
                                                <input class="formChk" type="text" name="name" placeholder="이름"
                                                    required>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>닉네임</td>
                                            <td>
                                            	<div class="row">
	                                                <input class="formChk col-sm-8" id="nicknameBox" type="text" name="nickname"
	                                                    placeholder="닉네임" required>
	                                                <input id="nicknameChk" class="col-sm-3" type="button" value="중복확인">  
                                            	</div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>생년월일</td>
                                            <td>
                                                <select class="formChk birthChk" id="birthY" name="birthY">
                                                    <option value="none" selected>선택</option>
                                                </select> 년
                                                <select class="formChk birthChk" id="birthM" name="birthM">
                                                    <option value="none" selected>선택</option>
                                                </select> 월
                                                <select class="formChk" id="birthD" name="birthD">
                                                    <option value="none" selected>선택</option>
                                                </select> 일
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>성별</td>
                                            <td>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" class="custom-control-input" id="customRadio"
                                                        name="example" value="customEx">
                                                    <label class="custom-control-label" for="customRadio">남성</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" class="custom-control-input" id="customRadio2"
                                                        name="example" value="customEx">
                                                    <label class="custom-control-label" for="customRadio2">여성</label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr >
                                            <td colspan="2" class="text-center">
                                                <br>
                                                <input id="cancleBtn" type="button" name="cancle" value="취소" onclick="location.href='../layout/index.jsp'">
                                                <input id="joinButton" type="button" name="join" value="회원가입" onclick="blanckChk()">
                                            </td>
                                        </tr>

                                    </table>
                        </form>
                    </div>

                </div>
            </div>
            <footer class="footer container-fluid">
                <div class="row">
                    <div class="col">
                        2020, made with <i class="fa fa-heart heart text-danger"></i> by
                        JungminYesolYeonsubYeonji
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script src="Script/joinImpo-email.js" type="text/javascript"></script>
</body>

</html>