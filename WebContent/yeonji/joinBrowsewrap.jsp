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
    <link rel="icon" href="<%=request.getContextPath()%>/layout/assets/img/tiger_par-tiger_img-B.png"
	type="image/x-icon" />
	   <!--탭 아이콘-->

    <!-- Fonts and icons -->
    <script src="<%=request.getContextPath()%>/layout/assets/js/plugin/webfont/webfont.min.js"></script>
    	<%@ include file="../layout/top1_2.jsp"%>

    <!-- CSS Files -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layout/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/joinBrowsewrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <div class="main-header container-fluid">
            <div class="row">
                <a href="../layout/index.tp"> <img
                    src="Img/tiger_par-logo-B.svg" alt="top brand" class="col">
                </a>
            </div>
        </div>
    
        <!--컨텐츠가 들어가는 메인화면-->
        <div class="main-panel">
    
            <div id="content">
                <div id="joinBrowcontainer">

                    <!-- Regist Form -->
                    <div id="formCon">
                        <form id="regist">
    
                            <div class="agreeBox font-bold">
                                <input type="radio" name="agreeAll" value="agreeAll"> 약관
                                전체 (필수, 선택) 모두 동의
                            </div>
    
                            <div class="agreeBox">
                                <input type="radio" name="agree1" value="useChkr" required>
                                호랭이 약방 이용약관 동의 <span class="font-red">(필수)</span>
                                <p>
                                    여러분을 환영합니다. 호랭이 약방 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본
                                    약관은 다양한 호랭이 약방 서비스의 이용과 관련하여 호랭이 약방 서비스를 제공하는 WORLD
                                    CINEMA 주식회사(이하 ‘호랭이 약방’)와이를 이용하는 호랭이 약방 서비스 회원(이하
                                    ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 호랭이 약방 서비스 이용에 도움이 될 수
                                    있는 유익한 정보를 포함하고 있습니다. 호랭이 약방 서비스를 이용하시거나 호랭이 약방 서비스
                                    회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의
                                    깊게 살펴봐 주시기 바랍니다. 다양한 호랭이 약방 서비스를 즐겨보세요. 호랭이 약방는
                                    호랭이 약방 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의
                                    커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고
                                    있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 호랭이 약방
                                    서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, WORLD
                                    CINEMA 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다. 호랭이 약방는
                                    기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별
                                    서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용,
                                    이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스
                                    상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다. 호랭이 약방 서비스에는 기본적으로
                                    본 약관이 적용됩니다만 호랭이 약방가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관,
                                    운영정책 등을 적용하는 경우가 있습니다. 그리고 호랭이 약방 계열사가 제공하는 특정 서비스의 경우에도
                                    해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기
                                    화면에서 확인해 주시기 바랍니다. 회원으로 가입하시면 호랭이 약방 서비스를 보다 편리하게 이용할 수
                                    있습니다. 여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 호랭이 약방는 이에
                                    대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 호랭이 약방 서비스 이용 계정(이하 ‘계정’)을
                                    부여합니다. 계정이란 회원이 호랭이 약방 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원
                                    별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 WORLD
                                    CINEMA 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내
                                    호랭이 약방 회원가입 방법 등에서 확인해 주세요.<br>...
                                </p>
                            </div>
    
                            <div class="agreeBox agreeImpor">
                                <input type="radio" name="agree2" value="perInfoChk" required>
                                개인정보 수집 및 이용 동의 <span class="font-red">(필수)</span>
                                <p>
                                    개인정보보호법에 따라 호랭이 약방에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집
                                    및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니
                                    자세히 읽은 후 동의하여 주시기 바랍니다.<br> 1. 수집하는 개인정보<br>이용자는 회원가입을
                                    하지 않아도 정보 검색, 뉴스 보기 등 대부분의 호랭이 약방 서비스를 회원과 동일하게 이용할 수
                                    있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을
                                    할 경우, 호랭이 약방는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에
                                    호랭이 약방가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br> - 회원 가입 시에
                                    ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는
                                    생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별,
                                    중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를
                                    수집합니다.<br> 2. 수집한 개인정보의 이용<br>호랭이 약방 및 WORLD
                                    CINEMA 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경
                                    구축 등 아래의 목적으로만 개인정보를 이용합니다.<br> 3. 개인정보의 보관기간<br>회사는
                                    원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에 대해
                                    별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를
                                    안전하게 보관합니다.<br> 4. 개인정보 수집 및 이용 동의를 거부할 권리<br>이용자는
                                    개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에
                                    대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.<br>...
                                </p>
                            </div>
    
                            <div class="agreeBox">
                                <input type="checkbox" name="agreeSelec" value="locationChk">
                                위치정보 이용약관 동의 <span class="font-sub">(선택)</span>
                                <p>
                                    위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 호랭이 약방 위치기반
                                    서비스를 이용할 수 있습니다.<br>제 1 조 (목적)<br>이 약관은 호랭이 약방
                                    주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의
                                    권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br> 제 2 조 (약관 외
                                    준칙)<br>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진
                                    및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침,
                                    회사가 별도로 정한 지침 등에 의합니다.<br>제 3 조 (서비스 내용 및 요금)<br>①회사는
                                    직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를
                                    제공합니다.<br> 제 4 조 (개인위치정보주체의 권리)<br>①개인위치정보주체는 개인위치정보
                                    수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의
                                    일부에 대하여 동의를 유보할 수 있습니다.<br>...
    
                                </p>
                            </div>
    
                            <div class="agreeBox">
                                <input type="checkbox" name="agreeSelec" value="promotionChk">
                                프로모션 정보 수신 동의 <span class="font-sub">(선택)</span>
                                <p>호랭이 약방에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(호랭이 약방앱 알림
                                    또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 호랭이 약방 가입
                                    이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도
                                    수신 동의에 대해 별도로 안내하고 동의를 받습니다.</p>
                            </div>
    
                            <div id="buttonC">
                                <input id="cancleBtn" type="button" name="cancle" value="취소" onmouseover="this.style.cursor='pointer'">
                                <input id="chkBtn" type="button" name="registChk" value="확인" onmouseover="this.style.cursor='pointer'">
                            </div>
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
    <script src="Script/joinBrowsewrap.js" type="text/javascript"></script>
    
    
    </body>
    </html>