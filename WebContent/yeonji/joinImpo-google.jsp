<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../layout/top.jsp"%>

<%@ include file = "../layout/top1.jsp"%>

<!-- 자신의 폴더에서 인클루드할때!!!!!!
	<%@ include file = "../layout/top1.jsp"%>를
	<%@ include file = "../layout/top1_2.jsp"%>로
	꼭꼭 바꾸기!!
 -->
<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->


<%@ include file = "../layout/top2.jsp"%>
<%@ include file = "../layout/header.jsp"%>
<%@ include file = "../layout/sidebar.jsp"%>

 
        <!--컨텐츠가 들어가는 메인화면-->
        <div class="main-panel">

            <div id="content" style="margin-top:300px;">
                <div id="joinBrowcontainer">
                    <!-- Join Form -->
                    <div id="formCon">
                        <form id="join">
                            <h1>회원가입</h1>
                                    <table class="table ">
                                        <tr>
                                            <td>이메일</td>
                                            <td>${gInfo.email }</td>
                                        </tr>
                                        <tr>
                                            <td>이름</td>
                                            <td><input class="formChk" type="text" name="name" placeholder="이름"
                                                    required></td>
                                        </tr>

                                        <tr>
                                            <td>닉네임</td>
                                            <td>
                                                <input class="formChk" id="nicknameBox" type="text" name="nickname"
                                                    placeholder="닉네임" required>
                                                <input id="nicknameChk" type="button" value="중복확인">
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
            <script src="Script/joinImpo-email.js" type="text/javascript"></script>
<%@ include file = "../layout/footer.jsp"%>
<%@ include file = "../layout/script_bottom.jsp"%>