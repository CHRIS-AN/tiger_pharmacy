<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<link rel="stylesheet" href="CSS/default.css">
<link rel="stylesheet" href="CSS/login.css">

<%@ include file = "../layout/top2.jsp"%>
<%@ include file = "../layout/header.jsp"%>
<%@ include file = "../layout/sidebar.jsp"%>

<div id="container">
        <div class="loginFrm">
            <form action="index.html">
                <div>
                    <label for="id"><b>ID</b></label>
                    <input type="text" placeholder="아이디" name="uname" required>
                    
                    <label for="pw"><b>Password</b></label>
                    <input type="password" placeholder="비밀번호" name="pw" required>
                    
                    <button type="submit">Login</button>
                </div>
                <div id="bottom">
                    <label>
                        <input type="checkbox" name="remember"> 아이디 기억하기
                    </label>
                    <span id="find"><a href="#">아이디/비밀번호 찾기</a></span>
                </div>
            </form>
        </div>
    </div>

<%@ include file = "../layout/footer.jsp"%>
<%@ include file = "../layout/script_bottom.jsp"%>